package com.eeit40.design.Controller.BackSide;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Entity.OrderInformation;
import com.eeit40.design.Service.OrderImformationService;
import com.eeit40.design.Service.ShoppingCartService;

@Controller
public class OrderInformationBackController {

	@Autowired
	private OrderImformationService orderImformationService;
	
	
	//查詢所有訂單
	@GetMapping("B/allorder")
	public ModelAndView selectAllOrderByOrderDate(ModelAndView mav){
		
		List<OrderInformation> allOrder= orderImformationService.selectAllOrderByOrderDate();
		
		mav.getModel().put("allOrder", allOrder);
		
		return mav;
	}
	
	///商城訂單查詢-依ship_state
	@GetMapping("B/shipStatedetail")
	public ModelAndView selectByShipState(ModelAndView mav, HttpServletRequest request){
		
		String shipState = request.getParameter("shipState");
		List<OrderInformation> shipStateDetail= orderImformationService.selectByShipState(shipState);
		mav.getModel().put("shipStateDetail", shipStateDetail);
		
		mav.setViewName("/B/ShoppingCart/OrderImformation");
		
		return mav;
	}
	
	//商城訂單查詢-依order_date
//	@GetMapping("B/orderdatedetail")
//	public ModelAndView selectByOrderDate(ModelAndView mav, HttpServletRequest request){
//		
//		String orderDate = request.getParameter("orderDate");
//		DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd");
//	    Date date = fmt.parse(szBeginTime);
//		List<OrderInformation> orderDateDetail = orderImformationService.selectByOrderDate(orderDate);
//		
//		return orderDateDetail;
//	}
	
	//商家修改訂單狀態
//	@PostMapping()
//	public ModelAndView editShipStateByOrderId(ModelAndView mav,String shipState, int id) {
//		
//		orderImformationService.editShipStateByOrderId(shipState, id);
//	} 
	
	
	
}
