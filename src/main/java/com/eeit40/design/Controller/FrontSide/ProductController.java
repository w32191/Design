package com.eeit40.design.Controller.FrontSide;

import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Entity.Product;
import java.util.Properties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductController {

  @Autowired
  private ProductRepository dao;

  @PostMapping("/product/insert")
  public Product insert(@RequestBody Product pro){
    Product resPro = dao.save(pro);
    return resPro;
  }




}
