package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Service.ProductService;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {


  @Autowired
  private ProductRepository productDao;


  @Override
  public Product getProductById(Integer id) {
    Optional<Product> option = productDao.findById(id);
    if (option.isPresent()) {
      return option.get();
    }
    return null;
  }

  @Override
  public Product insertProduct(Product product) {
    productDao.save(product);
    return product;
  }

  @Override
  public Product deleteById(Integer id) {
    productDao.deleteById(id);
    return null;
  }


}
