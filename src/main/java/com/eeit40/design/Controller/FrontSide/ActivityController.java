package com.eeit40.design.Controller.FrontSide;

import com.eeit40.design.Dto.DesignQueryParams;
import com.eeit40.design.Dto.ProductAndDiscount;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.Design;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Service.ActivityService;
import com.eeit40.design.Service.DesignService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("FrontActivityController")
@Slf4j
public class ActivityController {

  @Autowired
  private ActivityService activityService;

  @Autowired
  private DesignService designService;

  @GetMapping("/F/Activity/index")
  public ModelAndView activityIndexPage(ModelAndView mav) {

    // 所有的活動
    List<Activity> allActivity = activityService.findActivitiesNow();

    // 當前時間正在活動中的產品
    List<Product> productList = activityService.findProductsWithCurrentActivity();
    List<ProductAndDiscount> padList = activityService.getProductsWithCurrentDiscount(productList);

//    log.info("目前的productList size():" + productList.size());
    DesignQueryParams designQueryParams = new DesignQueryParams();
    designQueryParams.setOrderBy("create_time");
    designQueryParams.setSort("desc");
    designQueryParams.setFetchNext(10);
    designQueryParams.setOffset(0);

    List<Design> designList = designService.getDesigns(designQueryParams);

    mav.addObject("productList", padList);
    mav.addObject("allActivity", allActivity);
    mav.addObject("designList",designList);
    mav.setViewName("/F/Activity/ActivityIndex");
    return mav;
  }

  // 點輪播的活動，導向該活動的商品頁
  @GetMapping("/F/Activity/productList/{id}")
  public ModelAndView productList(ModelAndView mav, @PathVariable Integer id) {
    Activity activity = activityService.getProductsWithCurrentDiscountByActivityId(id);
    System.out.println(activity.getProducts());
    mav.addObject("activity", activity);
    mav.setViewName("/F/Activity/ActivityProducts");
    return mav;
  }


  // 購物車商品的折扣
  @PostMapping("/F/Activity/checkDiscount")
  @ResponseBody
  public List<Map<String, Integer>> getProductDisCount(@RequestBody List<Integer> productIdList) {

    // Map< productId , 折扣％數>

    List<Map<String, Integer>> result = new ArrayList<>();
    for (Integer productId : productIdList) {
      result.add(activityService.getCurrentDiscountStringMap(productId));
    }

    return result;
  }

}
