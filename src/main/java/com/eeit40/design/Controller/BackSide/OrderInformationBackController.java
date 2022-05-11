package com.eeit40.design.Controller.BackSide;

//import java.lang.reflect.Array;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Entity.OrderInformation;
import com.eeit40.design.Entity.OrderList;
import com.eeit40.design.Service.OrderImformationService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class OrderInformationBackController {

	@Autowired
	private OrderImformationService orderImformationService;

	@Autowired
	private Jackson2ObjectMapperBuilder builder;

	// 查詢所有訂單
//	@GetMapping("B/allorder")
//	public ModelAndView selectAllOrderByOrderId(ModelAndView mav) {
//
//		mav.setViewName("B/ShoppingCart/OrderImforBack");
//
//		List<OrderInformation> allOrder = orderImformationService.selectAllOrderByOrderId();
//		
//		
//		mav.getModel().put("allOrder", allOrder);
//
//		return mav;
//	}
	
	// 查詢所有訂單
	@GetMapping("B/allorder")
	public ModelAndView selectAllOrderByOrderId(ModelAndView mav,HttpServletRequest request, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		mav.setViewName("B/ShoppingCart/OrderImforBack");

		String shipState = request.getParameter("shipState");
		
		if(shipState !=null) {
			
		// 商城訂單查詢-依ship_state
		Page<OrderInformation> statePage = orderImformationService.findByShipState(shipState,pageNumber);	
		List<OrderInformation> shipPageContent = statePage.getContent();
		mav.getModel().put("allOrder", shipPageContent);
		mav.getModel().put("page", statePage);
		mav.addObject("shipState",shipState); //要丟回jsp用
		
		}else {
		
	    // 查詢所有訂單
		Page<OrderInformation> page = orderImformationService.findByPage(pageNumber);
		List<OrderInformation> pageContent = page.getContent();
		mav.getModel().put("allOrder", pageContent);
		mav.getModel().put("page", page);
		mav.addObject("shipState","所有訂單"); //要丟回jsp用
		}
		return mav;
	}

	// 商城訂單查詢-依id
	@ResponseBody
	@GetMapping("B/iddetail")
	public String selectOrderById(HttpServletRequest request) throws JsonProcessingException {

		String imforId = request.getParameter("imforId");
		int id = Integer.valueOf(imforId);

		List<OrderInformation> imfor = orderImformationService.selectOrderById(id);

		//解決json會在orderimfor和loderlist兩個table無限尋找的狀況
		ObjectMapper mapper = builder.build();
		//將陣列的值先轉成字串
		return mapper.writeValueAsString(imfor.get(0));
	}

	// 商城訂單查詢-依ship_state（暫與全部查詢一起使用）
//	@GetMapping("B/shipStatedetail")
//	public ModelAndView selectByShipState(ModelAndView mav, HttpServletRequest request) {
//
//		String shipState = request.getParameter("shipState");
//		List<OrderInformation> shipStateDetail = orderImformationService.selectByShipState(shipState);
//		mav.getModel().put("shipStateDetail", shipStateDetail);
//		
//		return mav;
//	}

	// 商城訂單查詢-依order_date（目前尚未使用）
	@GetMapping("B/orderdatedetail")
	public ModelAndView selectByOrderDate(ModelAndView mav, HttpServletRequest request) throws ParseException {

		String date = request.getParameter("orderDate");
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		Date orderDate = fmt.parse(date);

		List<OrderInformation> orderDateDetail = orderImformationService.selectByOrderDate(orderDate);
		mav.getModel().put("shipStateDetail", orderDateDetail);

//		mav.setViewName("/B/ShoppingCart/OrderImformation");
		
		return mav;
	}

	// 商城訂單明細查詢
	@ResponseBody
	@GetMapping("B/orderProduct")
	public List<OrderList> selectByImforId(HttpServletRequest request) {

		String fkOrderImformation = request.getParameter("fkOrderImformation");

		int imfroId = Integer.valueOf(fkOrderImformation);

		List<OrderList> orderProduct = orderImformationService.selectByImforId(imfroId);

		return orderProduct;
	}

	// 商家修改訂單出貨日期
	@PostMapping("B/editordershipdate")
	public ModelAndView editShipStateByShipDate(ModelAndView mav, HttpServletRequest request) throws ParseException {

		String date = request.getParameter("shipDate");
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		Date shipDate = fmt.parse(date);

		String id = request.getParameter("id");
		int imforId = Integer.valueOf(id);

		orderImformationService.editShipStateByShipDate(shipDate,imforId);

		mav.setViewName("redirect:/B/allorder");
		return mav;
	}
	
	// 商家修改訂單出貨狀態
	@PostMapping("B/editordershipstate")
	public ModelAndView editShipStateByShipState(ModelAndView mav, HttpServletRequest request) throws ParseException {

			String shipState = request.getParameter("shipState");
			String id = request.getParameter("id");
			int imforId = Integer.valueOf(id);

			 orderImformationService.editShipStateByShipState(shipState, imforId);

			mav.setViewName("redirect:/B/allorder");
			return mav;
		}

	// 商家刪除訂單（目前尚未使用）
	public ModelAndView deleteByOrderId(ModelAndView mav, @RequestParam(name = "id") int id) {

		orderImformationService.deleteByOrderId(id);

		mav.setViewName("redirect:/B/allorder");
		return mav;
	}

	//分頁
	@GetMapping("B/page")
	public ModelAndView viewOrder(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		
		mav.setViewName("/B/ShoppingCart/OrderImforBack");
		Page<OrderInformation> page = orderImformationService.findByPage(pageNumber);
		
		mav.getModel().put("page", page);
		return mav;
	}
}
