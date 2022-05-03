package com.eeit40.design.Dao;

import com.eeit40.design.Entity.OrderList;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderListRepository extends JpaRepository<OrderList, Integer> {
	
	//查詢
	@Modifying
	@Query(value="select * from order_list where fk_order_imformation_id = :imforId",nativeQuery = true)
	public List<OrderList> selectByImforId(@Param("imforId") int fkOrderImformation);
	
}
