package com.eeit40.design.Controller.BackSide;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Entity.OrderInformation;
import com.eeit40.design.Entity.OrderList;
import com.eeit40.design.Service.OrderImformationService;
import com.eeit40.design.Service.ShoppingCartService;

@Controller
public class OrderInformationBackController {

	@Autowired
	private OrderImformationService orderImformationService;
	
	
	//查詢所有訂單
	@GetMapping("B/allorder")
	public ModelAndView selectAllOrderByOrderDate(ModelAndView mav){
		
		mav.setViewName("B/ShoppingCart/OrderImforBack");
		
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
		
//		mav.setViewName("/B/ShoppingCart/OrderImformation");
		
		return mav;
	}
	
	//商城訂單查詢-依order_date
	@GetMapping("B/orderdatedetail")
	public ModelAndView selectByOrderDate(ModelAndView mav, HttpServletRequest request) throws ParseException{
		
		String date = request.getParameter("orderDate");
		DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd");
	    Date orderDate = fmt.parse(date);
	    
		List<OrderInformation> orderDateDetail = orderImformationService.selectByOrderDate(orderDate);
		mav.getModel().put("shipStateDetail", orderDateDetail);
		
//		mav.setViewName("/B/ShoppingCart/OrderImformation");
		
		return mav;
	}
	
	//商城訂單明細查詢
	@ResponseBody
	@GetMapping("B/orderProduct")
	public  List<OrderList> selectByImforId(HttpServletRequest request) {
			
		String fkOrderImformation = request.getParameter("fkOrderImformation");
			
		int imfroId = Integer.valueOf(fkOrderImformation);

		List<OrderList> orderProduct = orderImformationService.selectByImforId(imfroId);
			
		return orderProduct;
	}	
	
	//商家修改訂單狀態
	@PostMapping("B/editorder")
	public ModelAndView editShipStateByOrderId(ModelAndView mav,HttpServletRequest request) throws ParseException {
		
		String date = request.getParameter("shipDate");
		DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd");
	    Date shipDate = fmt.parse(date);
	    
		String shipState = request.getParameter("shipState");
		String id = request.getParameter("id");
		int imforId = Integer.valueOf(id);
		
		orderImformationService.editShipStateByOrderId(shipDate, shipState, imforId);
		
		mav.setViewName("B/allorder");
		return mav;
	} 
	
	//商家刪除訂單
	public ModelAndView deleteByOrderId(ModelAndView mav,@RequestParam(name = "id") int id) {
		
		orderImformationService.deleteByOrderId(id);
		
		mav.setViewName("redirect:/B/allorder");
		return mav;
	}
	
	
}
