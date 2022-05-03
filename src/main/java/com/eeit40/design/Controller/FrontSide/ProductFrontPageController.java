package com.eeit40.design.Controller.FrontSide;

import com.eeit40.design.Entity.ImgurImg;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Util.ImgurUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
@PropertySource("classpath:imgurConfigs.properties")
public class ProductFrontPageController {


    @Value("${AU_OttoH}")
    private String authorization;

    @Autowired
    private ImgurUtil imgurUtil;


    @GetMapping(path = {"/F/product/product-details"})
    public String indexPage() {
        return "F/Product/product-details";
    }


    @GetMapping(path = {"/F/product/productbycategories"})
    public String indexPage2() {
        return "F/Product/productbycategories";
    }

    @GetMapping(path = {"/F/product/productbybrand"})
    public String indexPage3() {
        return "F/Product/productbybrand";
    }




    @GetMapping("/F/Product/")
    public ModelAndView findAllProduct(ModelAndView mav){
        Product pro = new Product();
//        List<Product> ap = dao.findAll();
        mav.addObject("findAll",pro);
        mav.setViewName("/F/Product/shop");
        return mav;
    }

    @PostMapping("/F/Product/uploadImg")
    @ResponseBody
    public String uploadImg(@RequestParam("file") MultipartFile multipartFile) throws IOException {

        imgurUtil.setAuthorization(authorization);
        ImgurImg img = imgurUtil.uploadImg(multipartFile.getOriginalFilename(), multipartFile.getBytes());

        return img.getLink();
    }

}
