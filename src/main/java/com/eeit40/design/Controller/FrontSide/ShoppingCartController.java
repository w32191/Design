package com.eeit40.design.Controller.FrontSide;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	private ShoppingCartService shoppingCartService;
	
	public int accountId() {
		
       Account account = new Account();
	   account.setId(1);
	   account.setEmail("admin@gmail.com");
	   account.setPwd("admin");
		   
	   int fkAccount = account.getId();
	   return fkAccount;
			
		}

	// 查詢
	@GetMapping("F/shoppingcart")
	public ModelAndView findShoppingCratByAccountId(ModelAndView mav) {

		mav.setViewName("F/shoppingCart/cart");
		
		// 假的account
//		Account account = new Account();
//		account.setId(1);
//		account.setEmail("admin@gmail.com");
//		account.setPwd("admin");

		List<ShoppingCard> cart = shoppingCartService.findShoppingCratByAccountId(accountId());

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
//		int fkAccount = 1;
		// 假的account
//		Account account = new Account();
//		account.setId(1);
//		account.setEmail("admin@gmail.com");
//		account.setPwd("admin");

		shoppingCartService.editAmountByCartId(amount, cartid);

		mav.setViewName("redirect:/F/shoppingcart?fkAccount=" + accountId());
		return mav;

	}

	// 刪除
	@GetMapping("F/deleteshoppingcart")
	public ModelAndView deleteShoppingCratByCartId(ModelAndView mav, @RequestParam(name = "id") int id) {

		shoppingCartService.deletById(id);

		// 假的account
//		Account account = new Account();
//		account.setId(1);
//		account.setEmail("admin@gmail.com");
//		account.setPwd("admin");
//		int fkAccount = 2;
		mav.setViewName("redirect:/F/shoppingcart?fkAccount=" + accountId());

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

		// 假的account
//		Account account = new Account();
//		account.setId(1);
//		account.setEmail("admin@gmail.com");
//		account.setPwd("admin");
//		int fkAccount = 2;

		shoppingCartService.checkShoppingCart(amount, accountId(), productId);

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
