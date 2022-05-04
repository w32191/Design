package com.eeit40.design.Service;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.eeit40.design.Dao.OrderInformationRepository;
import com.eeit40.design.Dao.OrderListRepository;
import com.eeit40.design.Entity.OrderInformation;
import com.eeit40.design.Entity.OrderList;

@Service
public class OrderImformationService {

	@Autowired
	private OrderListRepository orderList;
	
	@Autowired
    private OrderInformationRepository orderInformation;
	
	//**********************************成立訂單**********************************//
	//建立訂單訂購資訊
	public void addOrderImformation(OrderInformation addOrderInformation) {
		orderInformation.save(addOrderInformation);
	}
	
	//建立訂單商品明細
	public void addOrderList(OrderList addOrderList) {
		orderList.save(addOrderList);
	}
	
	//**********************************訂單成立-前台查詢**********************************//
	//會員訂單查詢
	public List<OrderInformation> selectByAccountId(int fkAccount) {
		
		List<OrderInformation> orderDetail = orderInformation.selectByAccountId(fkAccount);
		
		return orderDetail;
	}
	
	//會員訂單明細查詢
	public List<OrderList> selectByImforId(int fkOrderImformation) {

		List<OrderList> orderProductDetail = orderList.selectByImforId(fkOrderImformation);
		
		return orderProductDetail;
	}
	
	//**********************************訂單成立-後台查詢修改**********************************//
	//商城所有訂單查詢
	public List<OrderInformation> selectAllOrderByOrderDate(){
		
		List<OrderInformation> orderDetail = orderInformation.selectAllOrderByOrderDate();
		
		return orderDetail;
	}
	
	//商城訂單查詢-依ship_state
	public List<OrderInformation> selectByShipState(String shipState){
		
		List<OrderInformation> shipStateDetail= orderInformation.selectByShipState(shipState);
		
		return shipStateDetail;
	}
	
	//商城訂單查詢-依order_date
	public List<OrderInformation> selectByOrderDate(Date orderDate){
			
		List<OrderInformation> orderDateDetail= orderInformation.selectByOrderDate(orderDate);
			
		return orderDateDetail;
	}
	
	//商家修改訂單狀態
	public void editShipStateByOrderId(Date shipDate, String shipState, int id) {
		orderInformation.editShipStateByOrderId(shipDate,shipState, id);
	}
	
	//商家刪除訂單
	public void deleteByOrderId(int id) {
		orderInformation.deleteById(id);
	}
	
	
}
