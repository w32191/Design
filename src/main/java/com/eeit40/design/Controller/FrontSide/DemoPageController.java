package com.eeit40.design.Controller.FrontSide;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 這隻DemoPageController是放，模板demo用的 url路徑
 * 給大家 測試demo畫面用的
 *
 * */

@Controller
public class DemoPageController {

  @GetMapping("FrontSide/index.html")
  public String indexPage() {
    return "FrontSide/demoPage/index";
  }

  @GetMapping("FrontSide/index-2.html")
  public String index2Page() {
    return "FrontSide/demoPage/index-2";
  }

  @GetMapping("FrontSide/index-3.html")
  public String index3Page() {
    return "FrontSide/demoPage/index-3";
  }

  @GetMapping("FrontSide/index-4.html")
  public String index4Page() {
    return "FrontSide/demoPage/index-4";
  }

  @GetMapping("FrontSide/index-5.html")
  public String index5Page() {
    return "FrontSide/demoPage/index-5";
  }

  @GetMapping("FrontSide/index-6.html")
  public String index6Page() {
    return "FrontSide/demoPage/index-6";
  }

  @GetMapping("FrontSide/cart.html")
  public String cartPage() {
    return "FrontSide/demoPage/cart";
  }

  @GetMapping("FrontSide/blog.html")
  public String blogPage() {
    return "FrontSide/demoPage/blog";
  }

  @GetMapping("FrontSide/blog-2-col.html")
  public String blog2Page() {
    return "FrontSide/demoPage/blog-2-col";
  }

  @GetMapping("FrontSide/blog-2-col-mas.html")
  public String blog2masPage() {
    return "FrontSide/demoPage/blog-2-col-mas";
  }

  @GetMapping("FrontSide/blog-3-col.html")
  public String blog3Page() {
    return "FrontSide/demoPage/blog-3-col";
  }

  @GetMapping("FrontSide/blog-details.html")
  public String blogDetailsPage() {
    return "FrontSide/demoPage/blog-details";
  }


  @GetMapping("FrontSide/blog-left-sidebar.html")
  public String blogLeftSideBarPage() {
    return "FrontSide/demoPage/blog-left-sidebar";
  }

  @GetMapping("FrontSide/blog-no-sidebar.html")
  public String blogLeftNoBarPage() {
    return "FrontSide/demoPage/blog-no-sidebar";
  }

  @GetMapping("FrontSide/checkout.html")
  public String checkOutPage() {
    return "FrontSide/demoPage/checkout";
  }

  @GetMapping("FrontSide/contact.html")
  public String contactPage() {
    return "FrontSide/demoPage/contact";
  }

  @GetMapping("FrontSide/error.html")
  public String errorPage() {
    return "FrontSide/demoPage/error";
  }

  @GetMapping("FrontSide/login.html")
  public String loginPage() {
    return "FrontSide/demoPage/login";
  }


  @GetMapping("FrontSide/register.html")
  public String registerPage() {
    return "FrontSide/demoPage/register";
  }

  @GetMapping("FrontSide/product-details.html")
  public String productDetailsPage() {
    return "FrontSide/demoPage/product-details";
  }

  @GetMapping("FrontSide/shop.html")
  public String shopPage() {
    return "FrontSide/demoPage/shop";
  }

  @GetMapping("FrontSide/shop-3-col.html")
  public String shop3ColPage() {
    return "FrontSide/demoPage/shop-3-col";
  }

  @GetMapping("FrontSide/shop-4-col.html")
  public String shop4ColPage() {
    return "FrontSide/demoPage/shop-4-col";
  }

  @GetMapping("FrontSide/shop-right-sidebar.html")
  public String shopRightSidebarPage() {
    return "FrontSide/demoPage/shop-right-sidebar";
  }


  @GetMapping("FrontSide/wishlist.html")
  public String wishListPage() {
    return "FrontSide/demoPage/wishlist";
  }


}
