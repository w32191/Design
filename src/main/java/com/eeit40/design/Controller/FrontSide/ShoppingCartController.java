package com.eeit40.design.Controller.FrontSide;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eeit40.design.Service.ActivityService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Dto.DiscountCouponDto;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.DiscountCoupon;
import com.eeit40.design.Entity.ShoppingCard;
import com.eeit40.design.Service.ShoppingCartService;

@Controller
public class ShoppingCartController {

	@Autowired
	private ActivityService activityService;

	@Autowired
	private ShoppingCartService shoppingCartService;

//	public int accountId() {
//
//		Account account = new Account();
//		account.setId(45);
//		account.setEmail("admin@gmail.com");
//		account.setPwd("admin");
//
//		int fkAccount = account.getId();
//		return fkAccount;
//
//	}

	// 查詢
	@GetMapping("F/shoppingcart")
	public ModelAndView findShoppingCratByAccountId(ModelAndView mav, HttpServletRequest request,HttpSession session) {

		mav.setViewName("F/shoppingCart/cart");
		
		Account account = (Account) session.getAttribute("Faccount");
		int accountId = account.getId();
		
		List<ShoppingCard> cart = shoppingCartService.findShoppingCratByAccountId(accountId);
		
		// <product id , discount>
		Map<Integer, Integer> discountMap = activityService.getCurrentDiscountIntegerMap(cart);
		
		mav.addObject("discountMap", discountMap);
		mav.getModel().put("cartList", cart);
		
		return mav;
	}


	// 修改
	@PostMapping("F/editshoppingcart")
	public ModelAndView editAmountByCartId(ModelAndView mav, HttpServletRequest request,HttpSession session) {

		Account account = (Account) session.getAttribute("Faccount");
		int accountId = account.getId();
		
		String id = request.getParameter("cartid");
		String tempMount = request.getParameter("uamount");

		int amount = Integer.valueOf(tempMount);
		int cartid = Integer.valueOf(id);

		shoppingCartService.editAmountByCartId(amount, cartid);

		mav.setViewName("redirect:/F/shoppingcart?fkAccount=" + accountId);
		return mav;

	}

	// 刪除
	@GetMapping("F/deleteshoppingcart")
	public ModelAndView deleteShoppingCratByCartId(ModelAndView mav,HttpSession session, @RequestParam(name = "id") int id) {
		
		Account account = (Account) session.getAttribute("Faccount");
		int accountId = account.getId();
		
		shoppingCartService.deletById(id);
		
		mav.setViewName("redirect:/F/shoppingcart?fkAccount=" + accountId);

		return mav;

	}

	// 新增
// @PostMapping("F/addshoppingcart1")
// public ModelAndView addProductToShoppingCart(ModelAndView mav,HttpServletRequest request) {
//
//    String tempMount = request.getParameter("amount");
////      String  sessionId= request.getRequestedSessionId();
//    String fkProduct = request.getParameter("fkProduct");
//
//     int amount = Integer.valueOf(tempMount);
////       int accountId = Integer.valueOf(sessionId);
//     int productId = Integer.valueOf(fkProduct);
//
//     int fakesessionid=2;
//
//     shoppingCartService.addProductToShoppingCart(amount, fakesessionid, productId);
//
//    return mav;
//
// }

//	@SuppressWarnings("unused")
	// 新增(確認購物車品項是否重複)
	// 以產品id修改數量
	@GetMapping("F/addshoppingcart")
	@ResponseBody
	public String addProductToShoppingCart(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {

		Account account = (Account) session.getAttribute("Faccount");
		int accountId = account.getId();
		
		String tempMount = request.getParameter("amount");
		String fkProduct = request.getParameter("fkProduct");
		
		int amount = Integer.valueOf(tempMount);
		int productId = Integer.valueOf(fkProduct);

		shoppingCartService.checkShoppingCart(amount, accountId, productId);
		
		return "success";
	}

	// 以購物車id修改數量
// @PostMapping("F/addshoppingcart2")
// public ModelAndView addProductToShoppingCart(ModelAndView mav,HttpServletRequest request) {
//
//    String id = request.getParameter("id");
//    String tempMount = request.getParameter("amount");
//    String fkProduct = request.getParameter("fkProduct");
//
//    int cartId = Integer.valueOf(id);
//    int amount = Integer.valueOf(tempMount);
//    int productId = Integer.valueOf(fkProduct);
//
//     int fakesessionid=1;
//
//     shoppingCartService.checkShoppingCart(fakesessionid, productId, amount, cartId);
//
//    return mav;
// }

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
				discountCouponDto.setErrMsg("優惠券已過期"+" , "+"請輸入正確優惠券代碼");
				return discountCouponDto;
			}
			discountCouponDto.setErrMsg("優惠券活動時間尚未開始"+" , "+"請輸入正確優惠券代碼");
			return discountCouponDto;
		}
		discountCouponDto.setErrMsg("查無此優惠券"+" , "+"請輸入正確優惠券代碼");
		return discountCouponDto;
	}

}
