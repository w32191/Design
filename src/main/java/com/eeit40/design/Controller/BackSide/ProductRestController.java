package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.Product;

import java.util.List;

import com.eeit40.design.Service.Impl.ProductServiceImpl;
import com.eeit40.design.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductRestController {

    @Autowired
    private ProductRepository dao;

    @PostMapping("/B/product/insert")
    public Product insertProduct(@RequestBody Product pro) {
        Product resPro = dao.save(pro);
        return resPro;
    }

    @GetMapping("/B/product/findProductById/{id}")
    public Product findProductById(@PathVariable Integer id) {
        Product resPro = dao.findProductById(id);
        return  resPro;
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


    @GetMapping(value = "/B/product/findAllProduct")
    public List<Product> findAll() {
        System.out.println(dao.findAll());
        return dao.findAll();
    }

    @GetMapping(value = "/B/product/findProductOrderByPrice")
    public List<Product> findProductOrderByPrice() {
        return dao.findProductOrderByPrice();
    }

    @GetMapping(value = "/B/product/findProductOrderByPriceDesc")
    public List<Product> findProductOrderByPriceDesc() {
        return dao.findProductOrderByPriceDesc();
    }



    ////////日期排序/////////////////////

    @GetMapping(value = "/B/product/findProductOrderByAdded")
    public List<Product>findProductrOderByAdded(){
        return dao.findProductOrderByAdded();
    }
    @GetMapping(value = "/B/product/findProductOrderByAddedDesc")
    public List<Product>findProductOderByAddedDesc(){
        return dao.findProductOrderByAddedDesc();
    }




    //0庫存--> 無法購買
    @GetMapping(value = "/B/product/findProductOutOfStock")
    public List<Product> findProductOutOfStock() {
        return dao.findProductOutOfStock();
    }




    //////////////依商品種類///////////////
    @GetMapping(value = "/B/product/findProductByCategories/{categories}")
    public List<Product> findProductByCategories(@PathVariable String categories) {
        return dao.findProductByCategories(categories);
    }

    @GetMapping(value = "/B/product/findProductByCategoriesOrderByPrice/{categories}")
    public List<Product> findProductByCategoriesOrderByPrice(@PathVariable String categories) {
        return dao.findProductByCategoriesOrderByPrice(categories);
    }

    @GetMapping(value = "/B/product/findProductByCategoriesOrderByPriceDesc/{categories}")
    public List<Product> findProductByCategoriesOrderByPriceDesc(@PathVariable String categories) {
        return dao.findProductByCategoriesOrderByPriceDesc(categories);
    }

    @GetMapping("/B/product/findProductByCategoriesOrderByAdded/{categories}")
    public List<Product>findProductByCategoriesOrderByAdded(@PathVariable String categories){
        return dao.findProductByCategoriesOrderByAdded(categories);
    }

    @GetMapping("/B/product/findProductByCategoriesOrderByAddedDesc/{categories}")
    public List<Product>findProductByCategoriesOrderByAddedDesc(@PathVariable String categories){
        return dao.findProductByCategoriesOrderByAddedDesc(categories);
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
