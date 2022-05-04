package com.eeit40.design.Controller.FrontSide;

import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.eeit40.design.Controller.FrontSide.ProductReviewController;
import com.eeit40.design.Entity.Member;
import com.eeit40.design.Entity.ProductReview;
import com.eeit40.design.Service.ProductReviewService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductReviewController {

  @Autowired
  private ProductReviewService prService;
  
  //顯示屬於商品頁自己的全部Review
  @ResponseBody
  @GetMapping("/F/ProductReview/ProductReview/{fkProductId}")
  public List<ProductReview> selectAllReview(@PathVariable Integer fkProductId) {
    List<ProductReview> pr = prService.reviewAll(fkProductId);
//    mav.addObject("prs",pr);
//    mav.setViewName("redirect:/F/ProductReview/ProductReview");
    return pr;
  }
  
  //新增Review
  @PostMapping("/F/ProductReview/insertProductReview")
  @ResponseBody
  public String insertProductReview(
      @RequestParam("comment") String comment,
      @RequestParam("comment_date") LocalDate comment_date,
      @RequestParam("score") Integer score,
      @RequestParam("star") Integer star,
      @RequestParam("fk_member_id") Integer fk_member_id,
      @RequestParam("fk_product_id") Integer fk_product_id
      ) {
    ProductReview pr = new ProductReview();
    Member mb = new Member();
    mb.setId(fk_member_id);
    pr.setComment(comment);
    log.info(comment);
    pr.setCommentDate(comment_date);
    pr.setScore(score);
    pr.setStar(star);
       
    prService.insert(pr);
    return "success";
  }
  
  
  
  
  
  
  
  
}
