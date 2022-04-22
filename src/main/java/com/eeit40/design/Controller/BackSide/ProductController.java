package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Dto.ProductDto;
import com.eeit40.design.Entity.Brand;
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

  @PostMapping("/B/product/insert")
  public Product insertProduct(@RequestBody Product pro) {
    Product resPro = dao.save(pro);
    return resPro;
  }

  @GetMapping("/B/product/findProductById/{id}")
  public Product findProductById(@PathVariable Integer id){
     Product resPro = dao.findProductById(id);
    return (Product) resPro;
  }

  @GetMapping("/B/product/delete/{id}")
  public boolean deleteProductById(@PathVariable Integer id) {
    dao.deleteById(id);
    return true;
  }

  @GetMapping(value = "/B/product/findProductByName/{name}")
  public List<Product> findProductByName(@PathVariable String name) {
    return dao.findProductByName(name);
  }

  @GetMapping(value = "/B/product/findProductByCategories/{categories}")
  public List<Product> findProductByCategories(@PathVariable String categories) {
    return dao.findProductByCategories(categories);
  }

@GetMapping(value = "/B/product/findProductByBrand/{id}")
  public List<Product> findProductByBrand(@PathVariable Brand id){
    return dao.findProductByFkBrand(id);
  }


}
