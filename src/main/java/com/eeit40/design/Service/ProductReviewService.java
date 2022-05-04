package com.eeit40.design.Service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eeit40.design.Dao.ProductReviewRepository;
import com.eeit40.design.Entity.ProductReview;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductReviewService {

  @Autowired
  private ProductReviewRepository prrDao;
  
  //顯示屬於商品頁自己的全部Review
  public List<ProductReview> reviewAll(Integer fkProductId){
    List<ProductReview> pr  = prrDao.reviewAll(fkProductId);
    
    return pr;
  }
  
  //新增QA
  public void insert(ProductReview pr){
    prrDao.save(pr);
  }
  
  
  
}
