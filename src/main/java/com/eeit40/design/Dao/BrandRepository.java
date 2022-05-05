package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public interface BrandRepository extends JpaRepository<Brand, Integer> {

    List<Brand> findAll();

    @Query("from Brand where id = :id")
    Brand findBrandById(@Param("id") Integer id);
}


//    @Query("from Product  where id = :id")
//    Product findProductById(@Param("id") Integer Id);