package com.eeit40.design.Service;

import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.Product;

import java.util.List;

public interface ProductService {
  List<Product> findAll();

  Product findProductById(Integer id);

  Product save(Product pro);

  boolean deleteById(Integer id);

  List<Product> findProductByName(String name);

  List<Product> findProductByCategories(String categories);

  List<Product> findProductByFkBrand(Brand id);

  List<Product> findProductOutOfStock();

  List<Product> findProductOrderByPrice();

  List<Product> findProductByCategoriesOrderByPrice(String categories);

  List<Product> findProductByCategoriesOrderByPriceDesc(String categories);
}
