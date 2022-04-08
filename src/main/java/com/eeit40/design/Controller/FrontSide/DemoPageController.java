package com.eeit40.design.Controller.FrontSide;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 這隻DemoPageController是放，模板demo用的 url路徑
 * 給大家 測試demo畫面用的
 *
 * */

@Controller("FrontDemoPageController")
public class DemoPageController {

  @GetMapping(path = {"/F/","F/index.html"})
  public String indexPage() {
    return "F/demoPage/index";
  }

  @GetMapping("F/index-2.html")
  public String index2Page() {
    return "F/demoPage/index-2";
  }

  @GetMapping("F/index-3.html")
  public String index3Page() {
    return "F/demoPage/index-3";
  }

  @GetMapping("F/index-4.html")
  public String index4Page() {
    return "F/demoPage/index-4";
  }

  @GetMapping("F/index-5.html")
  public String index5Page() {
    return "F/demoPage/index-5";
  }

  @GetMapping("F/index-6.html")
  public String index6Page() {
    return "F/demoPage/index-6";
  }

  @GetMapping("F/cart.html")
  public String cartPage() {
    return "F/demoPage/cart";
  }

  @GetMapping("F/blog.html")
  public String blogPage() {
    return "F/demoPage/blog";
  }

  @GetMapping("F/blog-2-col.html")
  public String blog2Page() {
    return "F/demoPage/blog-2-col";
  }

  @GetMapping("F/blog-2-col-mas.html")
  public String blog2masPage() {
    return "F/demoPage/blog-2-col-mas";
  }

  @GetMapping("F/blog-3-col.html")
  public String blog3Page() {
    return "F/demoPage/blog-3-col";
  }

  @GetMapping("F/blog-details.html")
  public String blogDetailsPage() {
    return "F/demoPage/blog-details";
  }


  @GetMapping("F/blog-left-sidebar.html")
  public String blogLeftSideBarPage() {
    return "F/demoPage/blog-left-sidebar";
  }

  @GetMapping("F/blog-no-sidebar.html")
  public String blogLeftNoBarPage() {
    return "F/demoPage/blog-no-sidebar";
  }

  @GetMapping("F/checkout.html")
  public String checkOutPage() {
    return "F/demoPage/checkout";
  }

  @GetMapping("F/contact.html")
  public String contactPage() {
    return "F/demoPage/contact";
  }

  @GetMapping("F/error.html")
  public String errorPage() {
    return "F/demoPage/error";
  }

  @GetMapping("F/login.html")
  public String loginPage() {
    return "F/demoPage/login";
  }


  @GetMapping("F/register.html")
  public String registerPage() {
    return "F/demoPage/register";
  }

  @GetMapping("F/product-details.html")
  public String productDetailsPage() {
    return "F/demoPage/product-details";
  }

  @GetMapping("F/shop.html")
  public String shopPage() {
    return "F/demoPage/shop";
  }

  @GetMapping("F/shop-3-col.html")
  public String shop3ColPage() {
    return "F/demoPage/shop-3-col";
  }

  @GetMapping("F/shop-4-col.html")
  public String shop4ColPage() {
    return "F/demoPage/shop-4-col";
  }

  @GetMapping("F/shop-right-sidebar.html")
  public String shopRightSidebarPage() {
    return "F/demoPage/shop-right-sidebar";
  }


  @GetMapping("F/wishlist.html")
  public String wishListPage() {
    return "F/demoPage/wishlist";
  }


}
