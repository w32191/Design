package com.eeit40.design.Dao;

import com.eeit40.design.Entity.CommonQuestion;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CommonQuestionRepository extends JpaRepository<CommonQuestion, Integer> {

//更新
  @Transactional
  @Modifying
  @Query(value = "update product set productName=:pName, productPrice=:pPrice, "
          + "productSpecs=:pSpecs, productDescription=:pDes, productType=:pType, "
          + "productCountry=:pCountry, productAvailable=:pAvailable, "
          + "lastModifiedTime=:strDate where productID=:pID", nativeQuery = true)
  public void updateProduct(@Param("pName") String pName, @Param("pPrice") int pPrice, @Param("pSpecs") String pSpecs,
          @Param("pDes") String pDes, @Param("pType") int pType, @Param("pCountry") int pCountry,
          @Param("pAvailable") String pAvailable, @Param("strDate") String strDate, @Param("pID") int pID);

}
