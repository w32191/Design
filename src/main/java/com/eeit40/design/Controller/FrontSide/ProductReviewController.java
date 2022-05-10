package com.eeit40.design.Controller.FrontSide;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.Member;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Entity.ProductReview;
import com.eeit40.design.Service.ProductReviewService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductReviewController {

  @Autowired
  private ProductReviewService prService;

  // 顯示屬於商品頁自己的全部Review
  @ResponseBody
  @GetMapping("/F/ProductReview/ProductReview/{fkProductId}")
  public List<ProductReview> selectAllReview(@PathVariable Integer fkProductId) {
    List<ProductReview> pr = prService.reviewAll(fkProductId);
    // mav.addObject("prs",pr);
    // mav.setViewName("redirect:/F/ProductReview/ProductReview");
    return pr;
  }

  // 新增Review
  @PostMapping("/F/ProductReview/insertProductReview")
  public ModelAndView insertProductReview(ModelAndView mav, HttpSession session,
      @RequestParam("comments") String comments,
      @RequestParam(name = "star", defaultValue = "5") Integer star,
      @RequestParam("productId") Integer fk_product_id) {

    // LocalDate date = LocalDate.now();
    // SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
    // String bDate = ft.format(date);

    ProductReview pr = new ProductReview();
    Account account = (Account) session.getAttribute("Faccount");
    // Member member = account.getMembers();
    Member member = new Member();
    member.setId(account.getId());

    log.info(comments);
    Product product = new Product();
    product.setId(fk_product_id);

    pr.setFkMember(member);
    pr.setComment(comments);
    pr.setFkProduct(product);
    pr.setStar(star);

    ProductReview newProductReview = prService.insert(pr);

    String urlString = "redirect:/F/product/product-details?id=" + fk_product_id;

    mav.setViewName(urlString);
    return mav;
  }


  @GetMapping("/F/getP")
  @ResponseBody
  public String getMemberName(HttpSession session) {
    Account account = (Account) session.getAttribute("Faccount");
    if (account != null) {
      if (account.getMembers() != null) {
        return account.getMembers().getNames();
      }
    }

    return "";

  }



}
