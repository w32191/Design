package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dao.BrandRepository;
import com.eeit40.design.Dao.OrderListRepository;
import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Dto.ProductAndDiscount;
import com.eeit40.design.Dto.ProductDto;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.Product;

import java.net.http.HttpRequest;
import com.eeit40.design.Service.ActivityService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.eeit40.design.Service.Impl.ProductServiceImpl;
import com.eeit40.design.Service.ProductService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
public class ProductRestController {

  @Autowired
  private ProductServiceImpl dao;

  @Autowired
  private ActivityService activityService;

  @Autowired
  private BrandRepository brandRepository;

  @Autowired
  private OrderListRepository orderListRepository;



  //備貨中訂單的商品數量表
  @GetMapping("/B/product/doSomethingGetBrand")
  public List<Map<Integer, Map<Integer, Integer>>> doSomething(){
    return orderListRepository.doSomethingGetBrand();
  }


  //備貨中訂單的缺貨商品品牌內的商品
  @GetMapping("/B/product/doSomethingGetPorduct/{id}")
  public List<Map<Integer, Map<Integer, Integer>>> doSomethingGetPorduct(@PathVariable Integer id){
    return orderListRepository.doSomethingGetPorduct(id);
  }



  @PostMapping("/B/product/updateById/{id}")
  public Product updateById(@PathVariable Integer id, @RequestBody Product pro) {
    pro.setId(id);
    Product resPro = dao.save(pro);
    return resPro;
  }

  @PostMapping("/B/product/findByNameLike")
  public List<Product> findByNameLike(@RequestParam("name") String name) {
    System.out.println(name);
    return dao.findByNameLike("%" + name + "%");
  }

  @PostMapping("")
  public  List<Product>findByNameLikeT(@RequestParam("name")String name){
    return dao.findByNameLikeT("%" + name + "%");
  }

  @PostMapping("/B/product/insert")
  public Product insertProduct(@RequestBody Product pro) {
    Product resPro = dao.save(pro);
    return resPro;
  }

  @GetMapping("/B/product/findProductById/{id}")
  public ProductAndDiscount findProductById(@PathVariable Integer id) {
    Product resPro = dao.findProductById(id);
    List<Product> productList = new ArrayList<>();
    productList.add(resPro);
    List<ProductAndDiscount> list = activityService.getProductsWithCurrentDiscount(productList);
    return list.get(0);
//    return (Product) resPro;
  }

  @GetMapping("/B/product/delete/{id}")
  public boolean deleteProductById(@PathVariable Integer id) {
    dao.deleteById(id);
    return true;
  }

  @GetMapping(value = "/B/product/findProductByName/{name}")
  public List<ProductAndDiscount> findProductByName(@PathVariable String name) {
    return activityService.getProductsWithCurrentDiscount(dao.findProductByName(name));
  }


  @GetMapping(value = "/B/product/findAllProduct")
    public List<ProductAndDiscount> findAll() {
    System.out.println(dao.findAll());
       return activityService.getProductsWithCurrentDiscount(dao.findAll());
  }

  @GetMapping(value = "/B/product/findProductOrderByPrice")
  public List<ProductAndDiscount> findProductOrderByPrice() {
    return activityService.getProductsWithCurrentDiscount(dao.findProductOrderByPrice());
  }

  @GetMapping(value = "/B/product/findProductOrderByPriceDesc")
  public List<ProductAndDiscount> findProductOrderByPriceDesc() {
    return activityService.getProductsWithCurrentDiscount(dao.findProductOrderByPriceDesc());
  }

  ////////日期排序/////////////////////

  @GetMapping(value = "/B/product/findProductOrderByAdded")
  public List<ProductAndDiscount> findProductrOderByAdded() {
    return activityService.getProductsWithCurrentDiscount(dao.findProductOrderByAdded());
  }

  @GetMapping(value = "/B/product/findProductOrderByAddedDesc")
  public List<ProductAndDiscount> findProductOderByAddedDesc() {
    return activityService.getProductsWithCurrentDiscount(dao.findProductOrderByAddedDesc());
  }


  //0庫存--> 無法購買
  @GetMapping(value = "/B/product/findProductOutOfStock")
  public List<Product> findProductOutOfStock() {
    return dao.findProductOutOfStock();
  }


  //////////////依商品種類///////////////
  @GetMapping(value = "/B/product/findProductByCategories/{categories}")
  public List<ProductAndDiscount> findProductByCategories(@PathVariable String categories) {

    return activityService.getProductsWithCurrentDiscount(dao.findProductByCategories(categories));
  }

  @GetMapping(value = "/B/product/findProductByCategoriesOrderByPrice/{categories}")
  public List<ProductAndDiscount> findProductByCategoriesOrderByPrice(@PathVariable String categories) {
    return activityService.getProductsWithCurrentDiscount(dao.findProductByCategoriesOrderByPrice(categories));
  }

  @GetMapping(value = "/B/product/findProductByCategoriesOrderByPriceDesc/{categories}")
  public List<ProductAndDiscount> findProductByCategoriesOrderByPriceDesc(@PathVariable String categories) {
    return activityService.getProductsWithCurrentDiscount(dao.findProductByCategoriesOrderByPriceDesc(categories));
  }

  @GetMapping("/B/product/findProductByCategoriesOrderByAdded/{categories}")
  public List<ProductAndDiscount> findProductByCategoriesOrderByAdded(@PathVariable String categories) {
    return activityService.getProductsWithCurrentDiscount(dao.findProductByCategoriesOrderByAdded(categories));
  }

  @GetMapping("/B/product/findProductByCategoriesOrderByAddedDesc/{categories}")
  public List<ProductAndDiscount> findProductByCategoriesOrderByAddedDesc(@PathVariable String categories) {
    return activityService.getProductsWithCurrentDiscount(dao.findProductByCategoriesOrderByAddedDesc(categories));
  }

  //////////////依品牌////////////////

  @GetMapping(value = "/B/product/findProductByBrand/{id}")
  public List<Product> findProductByBrand(@PathVariable Brand id) {
    return dao.findProductByFkBrand(id);
  }

  @GetMapping("/B/product/findProductByBrandOrderByPrice/{id}")
  public List<Product> findProductByFkBrandOrderByPrice(@PathVariable Brand id) {
    return dao.findProductByFkBrandOrderByPrice(id);
  }

  @GetMapping("/B/product/findProductByBrandOrderByPriceDesc/{id}")
  public List<Product> findProductByBrandOdrerByPriceDesc(@PathVariable Brand id) {
    return dao.findProductByFkBrandOrderByPriceDesc(id);
  }


  @GetMapping("/B/product/findProductByBrandOrderByAdded/{id}")
  public List<Product> findProductByBrandOrderByAdded(@PathVariable Brand id) {
    return dao.findProductByBrandOrderByAdded(id);
  }

  @GetMapping("/B/product/findProductByBrandOrderByAddedDesc/{id}")
  public List<Product> findProductByBrandOrderByAddedDesc(@PathVariable Brand id) {
    return dao.findProductByBrandOrderByAddedDesc(id);
  }


}
