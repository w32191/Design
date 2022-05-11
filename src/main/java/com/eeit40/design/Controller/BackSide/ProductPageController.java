package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Entity.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductPageController {


    @GetMapping(path = {"/B/Product/editProduct"})
    public String indexPage() {
        return "/B/Product/editProduct";
    }

    @GetMapping(path = {"/B/Product/addProduct"})
    public String indexPage4() {
        return "/B/Product/addProduct";
    }


    @GetMapping("/B/Product/")
    public ModelAndView findAllProduct(ModelAndView mav){
        Product pro = new Product();
//        List<Product> ap = dao.findAll();
        mav.addObject("findAll",pro);
        mav.setViewName("/B/Product/product");
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
