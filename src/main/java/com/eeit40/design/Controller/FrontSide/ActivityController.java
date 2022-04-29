package com.eeit40.design.Controller.FrontSide;

import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Service.ActivityService;
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

  @GetMapping("/F/Activity/index")
  public ModelAndView activityIndexPage(ModelAndView mav) {

    List<Activity> allActivity = activityService.findAll();

    mav.addObject("allActivity", allActivity);
    mav.setViewName("/F/Activity/ActivityIndex");
    return mav;
  }

  // 購物車商品的折扣
  @PostMapping("/F/Activity/checkDiscount")
  @ResponseBody
  public List<Map<String, Integer>> getProductDisCount(@RequestBody List<Integer> productIdList) {

    // Map< productId , 折扣％數>

    List<Map<String, Integer>> result = new ArrayList<>();
    for (Integer productId : productIdList) {
      result.add(activityService.getCurrentDiscountByProduct(productId));
    }

    return result;
  }

}
