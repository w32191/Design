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
	public List<OrderInformation> selectAllOrderByOrderId();
	
	//商城訂單查詢-依id
	@Query(value="select * from order_information where id = :id",nativeQuery = true)
	public List<OrderInformation> selectById(@Param("id") int id);
	
	//商城訂單查詢-依ship_state
	@Query(value="select * from order_information where ship_state = :shipState order by id desc",nativeQuery = true)
	public List<OrderInformation> selectByShipState(@Param("shipState") String shipState);
	
	//商城訂單查詢-依order_date
	@Query(value="select * from order_information where order_date = :orderDate",nativeQuery = true)
	public List<OrderInformation> selectByOrderDate(@Param("orderDate") Date orderDate);

	//商家修改訂單出貨日期
	@Transactional
	@Modifying
	@Query(value="update order_information set shipping_date = :shipDate where id = :id ",nativeQuery = true)
	public void editShipStateByShipDate(@Param("shipDate") Date shippingDate,@Param("id") int id);
	
	//商家修改訂單出貨狀態
	@Transactional
	@Modifying
	@Query(value="update order_information set ship_state = :shipState where id = :id ",nativeQuery = true)
	public void editShipStateByShipState(@Param("shipState") String shipState,@Param("id") int id);
}
