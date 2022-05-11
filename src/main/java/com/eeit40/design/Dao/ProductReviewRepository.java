package com.eeit40.design.Dao;

import com.eeit40.design.Entity.ProductReview;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProductReviewRepository extends JpaRepository<ProductReview, Integer> {
  
  //(@Param(value = "")) 這個value的值是接前端input的name值
  //SELECT p.id,p.fk_member_id,p.fk_product_id, 這幾個id雖然在SQL裡面執行時不需要，但是JPA不知道你在找哪些id，所以比較把這些table的id也一起select，JPA才能正常執行原生SQL語法！
  @Query(value = "SELECT * FROM product_review p left JOIN [member] m on m.id = p.fk_member_id WHERE p.fk_product_id =:fkProductId Order by p.id desc", nativeQuery = true)
  public List<ProductReview> reviewAll(@Param(value = "fkProductId") Integer fkProductId);
  
  
  
  
}
