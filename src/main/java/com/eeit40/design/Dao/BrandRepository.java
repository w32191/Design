package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.LinkedHashSet;
import java.util.Set;

public interface BrandRepository extends JpaRepository<Brand, Integer> {



}
