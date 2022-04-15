package com.eeit40.design.Service;

import com.eeit40.design.Entity.Product;

public interface ProductService {

  Product getProductById(Integer id);

  Product insertProduct(Product product);

  Product deleteById(Integer id);


}