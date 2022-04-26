package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Service.ProductService;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    private ProductRepository productRepository;

    public ProductServiceImpl(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();

    }


    @Override
    public Product findProductById(Integer id) {
        return productRepository.findProductById(id);
    }

    @Override
    public Product save(Product pro) {
        return productRepository.save(pro);
    }

    @Override
    public boolean deleteById(Integer id) {
        productRepository.deleteById(id);
        return true;
    }

    @Override
    public List<Product> findProductByName(String name) {
        return productRepository.findProductByName(name);
    }

    @Override
    public List<Product> findProductByCategories(String categories) {
        return productRepository.findProductByCategories(categories);
    }

    @Override
    public List<Product> findProductByFkBrand(Brand id) {
        return productRepository.findProductByFkBrand(id);

    }

    @Override

    public List<Product> findProductOutOfStock() {
        return productRepository.findProductOutOfStock();

    }

    @Override
    public List<Product> findProductOrderByPrice() {
        return productRepository.findProductOrderByPrice();
    }

    @Override
    public List<Product> findProductByCategoriesOrderByPrice(String categories) {
        return productRepository.findProductByCategoriesOrderByPrice(categories);
    }


    @Override
    public List<Product> findProductByCategoriesOrderByPriceDesc(String categories) {
        return productRepository.findProductByCategoriesOrderByPriceDesc(categories);
    }
}
