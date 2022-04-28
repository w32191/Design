package com.eeit40.design.Controller.FrontSide;

import com.eeit40.design.Entity.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductFrontPageController {

    @GetMapping(path = {"/F/product/product-details"})
    public String indexPage() {
        return "F/Product/product-details";
    }


    @GetMapping(path = {"/F/product/productbycategories"})
    public String indexPage2() {
        return "F/Product/productbycategories";
    }


    @GetMapping("/F/Product/")
    public ModelAndView findAllProduct(ModelAndView mav){
        Product pro = new Product();
//        List<Product> ap = dao.findAll();
        mav.addObject("findAll",pro);
        mav.setViewName("/F/Product/shop");
        return mav;
    }

}
