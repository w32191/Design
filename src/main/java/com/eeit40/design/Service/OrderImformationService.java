package com.eeit40.design.Service;


import org.springframework.beans.factory.annotation.Autowired;
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
	
	
	public void addOrderImformation(OrderInformation addOrderInformation) {
		orderInformation.save(addOrderInformation);
	}
	
	public void addOrderList(OrderList addOrderList) {
		orderList.save(addOrderList);
	}
	
}
