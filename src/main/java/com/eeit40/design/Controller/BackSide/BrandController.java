package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dao.BrandRepository;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
public class BrandController {
    //
    @Autowired
    private BrandRepository dao;

//    @PostMapping("/brand/insert")
//    public Brand insertBrand(@RequestBody Brand bnd){
//        Brand resBnd = dao.save(bnd);
//        return resBnd;
//    }

//    @GetMapping(value = "/B/Brand/findProductByBrandId/{id}")
//    public Set<Product> findProductByBrandId(@PathVariable Integer id) {
//        return Set<Product> dao.findProductById(id);
//    }
}
