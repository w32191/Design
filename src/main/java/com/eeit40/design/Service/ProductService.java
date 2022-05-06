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

  List<Product> findProductByFkBrandOrderByPrice(Brand id);

  List<Product> findProductByFkBrandOrderByPriceDesc(Brand id);

  List<Product> findProductOrderByPriceDesc();

  List<Product> findProductOrderByAdded();

  List<Product> findProductOrderByAddedDesc();

  List<Product> findProductByCategoriesOrderByAdded(String categories);

  List<Product> findProductByCategoriesOrderByAddedDesc(String categories);

  List<Product> findProductByBrandOrderByAdded(Brand id);

  List<Product> findProductByBrandOrderByAddedDesc(Brand id);

    List<Product> findByNameLike(String name);
}
