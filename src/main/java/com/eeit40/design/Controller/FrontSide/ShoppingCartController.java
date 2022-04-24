package com.eeit40.design.Controller.FrontSide;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Collection;
//import java.util.Date;
//import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eeit40.design.Dto.DiscountCouponDto;
import com.eeit40.design.Entity.DiscountCoupon;
import com.eeit40.design.Entity.ShoppingCard;
import com.eeit40.design.Service.ShoppingCartService;

@Controller
public class ShoppingCartController {

	@Autowired
	private ShoppingCartService shoppingCartService;

	// 查詢
	@GetMapping("F/shoppingcart")
	public ModelAndView findShoppingCratByAccountId(ModelAndView mav, @RequestParam(name = "fkAccount") int fkAccount) {

		mav.setViewName("F/shoppingCart/cart");

		List<ShoppingCard> cart = shoppingCartService.findShoppingCratByAccountId(fkAccount);

		mav.getModel().put("cart", cart);

		return mav;

	}

	// 修改
	@PostMapping("F/editshoppingcart")
	public ModelAndView editAmountByCartId(ModelAndView mav, HttpServletRequest request) {

		String id = request.getParameter("cartid");
		String tempMount = request.getParameter("uamount");

		int amount = Integer.valueOf(tempMount);
		int cartid = Integer.valueOf(id);
		// 先給死的id
		int fkAccount = 1;

		shoppingCartService.editAmountByCartId(amount, cartid);

		mav.setViewName("redirect:/F/shoppingcart?fkAccount=" + fkAccount);
		return mav;

	}

	// 刪除
	@GetMapping("F/deleteshoppingcart")
	public ModelAndView deleteShoppingCratByCartId(ModelAndView mav, @RequestParam(name = "id") int id) {

		shoppingCartService.deletById(id);

		int fkAccount = 2;
		mav.setViewName("redirect:/F/shoppingcart?fkAccount=" + fkAccount);

		return mav;

	}

	// 新增
//	@PostMapping("F/addshoppingcart1")
//	public ModelAndView addProductToShoppingCart(ModelAndView mav,HttpServletRequest request) {
//		
//		String tempMount = request.getParameter("amount");
////		String  sessionId= request.getRequestedSessionId();
//		String fkProduct = request.getParameter("fkProduct");
//		
//	    int amount = Integer.valueOf(tempMount);
////	    int accountId = Integer.valueOf(sessionId);
//	    int productId = Integer.valueOf(fkProduct);
//	    
//	    int fakesessionid=2;
//		
//	    shoppingCartService.addProductToShoppingCart(amount, fakesessionid, productId);
//	    
//		return mav;
//		
//	} 

	// 新增(確認購物車品項是否重複)
	// 以產品id修改數量
	@PostMapping("F/addshoppingcart")
	public ModelAndView addProductToShoppingCart(ModelAndView mav, HttpServletRequest request) {

		String tempMount = request.getParameter("amount");
		String fkProduct = request.getParameter("fkProduct");

		int amount = Integer.valueOf(tempMount);
		int productId = Integer.valueOf(fkProduct);

		int fkAccount = 2;

		shoppingCartService.checkShoppingCart(amount, fkAccount, productId);

		return mav;
	}

	// 以購物車id修改數量
//	@PostMapping("F/addshoppingcart2")
//	public ModelAndView addProductToShoppingCart(ModelAndView mav,HttpServletRequest request) {
//		
//		String id = request.getParameter("id");
//		String tempMount = request.getParameter("amount");
//		String fkProduct = request.getParameter("fkProduct");
//		
//		int cartId = Integer.valueOf(id);
//		int amount = Integer.valueOf(tempMount);
//		int productId = Integer.valueOf(fkProduct);
//		
//	    int fakesessionid=1;
//	    
//	    shoppingCartService.checkShoppingCart(fakesessionid, productId, amount, cartId);
//	    
//		return mav;
//	}

	// 確認coupon可否使用
	@ResponseBody
	@PostMapping("F/usecoupon")
	public DiscountCouponDto checkCoupon(HttpServletRequest request) {

		String coupon = request.getParameter("coupon_code");

		DiscountCoupon couponData = shoppingCartService.checkCoupon(coupon);
		DiscountCouponDto discountCouponDto = new DiscountCouponDto();

		if (couponData != null) {

			discountCouponDto.setCoupon(couponData.getCoupon());
			discountCouponDto.setDiscount(couponData.getDiscount());

			DiscountCoupon couponStarDate = shoppingCartService.checkCouponStarDate(coupon);

			if (couponStarDate != null) {

				DiscountCoupon couponEndDate = shoppingCartService.checkCouponEndDate(coupon);

				if (couponEndDate != null) {

					return discountCouponDto;
				}
				discountCouponDto.setErrMsg("優惠券已過期");
				return discountCouponDto;
			}
			discountCouponDto.setErrMsg("優惠券尚不能使用");
			return discountCouponDto;
		}

		discountCouponDto.setErrMsg("無此優惠券");
		return discountCouponDto;
	}

}
