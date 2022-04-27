package com.eeit40.design.Controller.FrontSide;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Dto.CheckoutCartListDto;
import com.eeit40.design.Entity.ShoppingCard;
import com.eeit40.design.Service.ShoppingCartService;

@Controller
public class OrderInformationController {

	@Autowired
	private ShoppingCartService shoppingCartService;
	
	public int accountId() {
		int fkAccount = 2;
		return fkAccount;
	}
	
	//傳送shoppingcart data 到 CheckoutCartListDto
	public List<CheckoutCartListDto> checkoutCartList() {

		// 先給死的id
//		int fkAccount = 1;
		
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
	@GetMapping("F/checkoutorderlist")
	public ModelAndView checkoutOrderList(ModelAndView mav, HttpServletRequest request) {
		
		// 先給死的id
//		int fkAccount = 2;
		
		String discount = request.getParameter("discount");
		
		mav.getModel().put("discount", discount);
		mav.getModel().put("checkoutCartList", checkoutCartList());
		
		
		mav.setViewName("/F/shoppingCart/checkout");
//		mav.setViewName("redirect:/F/checkout?fkAccount=" + accountId());
		return mav;
	}
	
}
