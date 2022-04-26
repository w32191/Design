package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Exception.ActivityException;
import com.eeit40.design.Service.ActivityService;
import java.util.ArrayList;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller("BackActivityController")
@Slf4j
public class ActivityController {

  @Autowired
  private ActivityService service;

  // 活動全部資料table
  @GetMapping("/B/Activity/findAll")
  public ModelAndView findAll(ModelAndView modelAndView) {
    List<Activity> list = service.findAll();
    modelAndView.addObject("activities", list);
    modelAndView.setViewName("/B/Activity/Activity");
    return modelAndView;
  }

  // 編輯活動
  @GetMapping("/B/Activity/editActivity/{id}")
  public ModelAndView findById(ModelAndView mav, @PathVariable Integer id) {
    Activity editActivity = service.findById(id);
    if (editActivity == null) {
      throw new ActivityException("沒有找到該筆活動！！");
    }

    // 所有品牌的list
    List<Brand> brandAllList = service.getAllBrands();

    List<Integer> checkedBrandsId = null;
    // 如果原本產品已經有勾選折扣商品
    if (!editActivity.getProducts().isEmpty()) {
      checkedBrandsId = new ArrayList<>();  // 取得原本已經有勾選的品牌id
      for (Product product : editActivity.getProducts()) {
        checkedBrandsId.add(product.getFkBrand().getId());
      }
    }

    mav.addObject("activity", editActivity);
    mav.addObject("brandAllList", brandAllList);
    mav.addObject("checkedBrandsId", checkedBrandsId);
    mav.setViewName("/B/Activity/EditActivity");
    return mav;
  }


}
