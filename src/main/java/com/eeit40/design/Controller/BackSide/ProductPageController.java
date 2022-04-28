package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ProductPageController {

    private ProductRepository dao;

    @GetMapping("/F/Product/Product")
    public ModelAndView findAllProduct(ModelAndView mav){
        Product pro = new Product();
//        List<Product> ap = dao.findAll();
        mav.addObject("findAll",pro);
        mav.setViewName("/F/Product/shop");
        return mav;
    }





//    @PostMapping("/B/Product/Product")
//    public ModelAndView dofindAll(ModelAndView mav, @ModelAttribute(name="findAll")
//                                  Product product,String )
//
//
//
//    @PostMapping("/register")
//    public ModelAndView doRegister (ModelAndView mav, @Valid @ModelAttribute(name =
//            "doRegister")
//    Account account, String email
//• String pwd, BindingResult br) {
//        if(lbr.hasErrors()){
//            accountService.register (account) ;
//            mav.setViewName("B/Account/login"):
//            return mav;
//            I
//            return null;











}
