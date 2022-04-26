package com.eeit40.design.Controller.FrontSide;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Dto.CheckoutCartListDto;
import com.eeit40.design.Entity.ShoppingCard;
import com.eeit40.design.Service.ShoppingCartService;

@Controller
public class OrderInformationController {

	@Autowired
	private ShoppingCartService shoppingCartService;
	
	//傳送shopping cart data 到 checkout頁面
	@ResponseBody
	@PostMapping("F/checkoutlist")
	public List<CheckoutCartListDto> checkoutCartList(ModelAndView mav,HttpServletRequest request, List<CheckoutCartListDto> checkoutCartListDto) {

//		mav.setViewName("F/shoppingCart/checkout");
		// 先給死的id
		int fkAccount = 1;
		
		String cartid = request.getParameter("cartid");
		String productName = request.getParameter("pname");
		String uamount = request.getParameter("uamount");
		String tprice = request.getParameter("tprice");
		
		int productQuantity= Integer.valueOf(uamount);
		int cartId= Integer.valueOf(cartid);
		int productTotal= Integer.valueOf(tprice);
		
	    List<ShoppingCard> cart = shoppingCartService.findShoppingCratByAccountId(fkAccount);
	    CheckoutCartListDto checkoutCartList= new CheckoutCartListDto();
		
//		cart.get(cartId).getTempMount();
//		checkoutCartListDto.setName(productName);
//		checkoutCartListDto.setTempMount(productQuantity);
	    checkoutCartList.setTempMount(cart.get(cartId).getTempMount());
//		checkoutCartListDto.setTprice(productTotal);
		
		mav.getModel().put("checkoutCartList", checkoutCartList);
		
		return checkoutCartListDto;
		
	}
	
	
}
