package com.eeit40.design.Controller.FrontSide;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Dto.CheckoutCartListDto;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.ShoppingCard;
import com.eeit40.design.Service.ShoppingCartService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrderInformationController {

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
	
	//傳送shoppingcart data 到 CheckoutCartListDto
	public List<CheckoutCartListDto> checkoutCartList() {

		// 假的account
//		Account account = new Account();
//		account.setId(1);
//		account.setEmail("admin@gmail.com");
//		account.setPwd("admin");
		
		List<ShoppingCard> cart = shoppingCartService.findShoppingCratByAccountId(accountId());
		List<CheckoutCartListDto> checkoutCartList = new ArrayList<>();
		
		for(ShoppingCard sc : cart) {
			
			int cartId = sc.getId();
			String productName = sc.getFkProduct().getName();
			int productPrice = sc.getFkProduct().getPrice();
			int quantity = sc.getTempMount();
			int tPrice = productPrice*quantity;
			
			CheckoutCartListDto checkoutCartListDto = new CheckoutCartListDto();
			
			checkoutCartListDto.setName(productName);
			checkoutCartListDto.setTempMount(quantity);
			checkoutCartListDto.setPrice(productPrice);
			checkoutCartListDto.setTprice(tPrice);
			
			checkoutCartList.add(checkoutCartListDto);
			
		}
		return checkoutCartList;
	}
	
	@ResponseBody
	@PostMapping("F/checkoutorderlist")
	public ModelAndView checkoutOrderList(ModelAndView mav, HttpServletRequest request,HttpSession session) {
		
		// 假的account
//		Account account = new Account();
//		account.setId(1);
//		account.setEmail("admin@gmail.com");
//		account.setPwd("admin");
		
		String discount = request.getParameter("discount");
		
		mav.getModel().put("discount", discount);
		mav.getModel().put("checkoutCartList", checkoutCartList());
		
		
		mav.setViewName("/F/shoppingCart/checkout");
//		mav.setViewName("redirect:/F/checkoutorderlist?fkAccount=" + accountId());
		return mav;
	}
	
}
