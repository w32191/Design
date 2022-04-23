package com.eeit40.design.Service;

import com.eeit40.design.Entity.Brand;
import org.springframework.data.domain.Page;

public interface BrandService {

  Page<Brand> findAllByPage(Integer pageNumber);
}
