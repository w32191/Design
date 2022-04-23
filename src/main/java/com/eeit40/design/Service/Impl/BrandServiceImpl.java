package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.BrandRepository;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Service.BrandService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class BrandServiceImpl implements BrandService {

  @Autowired
  private BrandRepository brandRepository;

  @Override
  public Page<Brand> findAllByPage(Integer pageNumber) {
    Pageable pageable = PageRequest.of(pageNumber - 1, 10, Direction.ASC, "id");
    return brandRepository.findAll(pageable);
  }


}
