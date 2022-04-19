package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Product;
import com.eeit40.design.Entity.ProductImg;
import com.eeit40.design.Entity.ShoppingCard;

import java.util.List;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface ShoppingCardRepository extends JpaRepository<ShoppingCard, Integer> {

	//查詢
	@Query(value="select * from shopping_card where fk_account_id = :accountId",nativeQuery = true)
	public List<ShoppingCard> findShoppingCratByAccountId(@Param("accountId") int fkAccount);
	
	//修改
	@Transactional
	@Modifying
	@Query(value="update shopping_card set temp_mount=:amount where id=:id",nativeQuery = true)
	public void editAmountByCartId(@Param("amount") int tempMount,@Param("id") int id);
	
//	//刪除
//	@Transactional
//	@Modifying
//	@Query(value="delete from shopping_card where id=:id",nativeQuery = true)
//	public void deleteShoppingCratByCartId(@Param("id") int id);
	
	//新增
	@Query(value="insert into shopping_card(temp_mount,fk_account_id,fk_product_id) values(:amount,:accountId,:productId)",nativeQuery = true)
	public void addProductToShoppingCart(@Param("amount") int tempMount,@Param("accountId") int fkAccount,@Param("productId") int fkProduct);
	
}
