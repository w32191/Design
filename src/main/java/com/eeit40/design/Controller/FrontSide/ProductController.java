package com.eeit40.design.Controller.FrontSide;

import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Entity.Product;
import java.util.List;
import java.util.Properties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductController {

  @Autowired
  private ProductRepository dao;

  @PostMapping("/product/insert")
  public Product insertProduct(@RequestBody Product pro) {
    Product resPro = dao.save(pro);
    return resPro;
  }

//  @PostMapping("/product/updateProductById/{id}")
//  public Product updateProductById(@PathVariable Product pro){
//    Product resPro= dao.save(pro);
//    return resPro;
//  }

  @GetMapping("product/delete/{id}")
  public boolean deleteProductById(@PathVariable Integer id) {
    dao.deleteById(id);
    return true;
  }

  @GetMapping(value = "product/findProductByName/{name}")
  public List<Product> findByName(@PathVariable String name) {
    return dao.findProductByName(name);
  }

  @GetMapping(value = "product/findProductByCategories/{categories}")
  public List<Product> findProductByCategories(@PathVariable String categories) {
    return dao.findProductByCategories(categories);
  }




}
