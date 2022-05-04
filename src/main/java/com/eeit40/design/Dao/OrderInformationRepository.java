package com.eeit40.design.Dao;

import com.eeit40.design.Entity.OrderInformation;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface OrderInformationRepository extends JpaRepository<OrderInformation, Integer> {

	//會員訂單查詢
	@Query(value="select * from order_information where fk_account_id = :accountId order by id desc",nativeQuery = true)
	public List<OrderInformation> selectByAccountId(@Param("accountId") int fkAccount);
	
	//**********************************後台**********************************//
	//商城所有訂單查詢
	@Query(value="select * from order_information order by id desc",nativeQuery = true)
	public List<OrderInformation> selectAllOrderByOrderDate();
	
	//商城訂單查詢-依ship_state
	@Query(value="select * from order_information where ship_state = :shipState order by order_date desc",nativeQuery = true)
	public List<OrderInformation> selectByShipState(@Param("shipState") String shipState);
	
	//商城訂單查詢-依order_date
	@Query(value="select * from order_information where order_date = :orderDate",nativeQuery = true)
	public List<OrderInformation> selectByOrderDate(@Param("orderDate") Date orderDate);

	//商家修改訂單狀態
	@Transactional
	@Modifying
	@Query(value="update order_information set shipping_date = :shipDate ,ship_state = :shipState where id = :id ",nativeQuery = true)
	public void editShipStateByOrderId(@Param("shipDate") Date shippingDate,@Param("shipState") String shipState,@Param("id") int id);
	
}
