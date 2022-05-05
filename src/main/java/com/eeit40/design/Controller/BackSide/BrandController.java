package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dao.BrandRepository;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@RestController
public class BrandController {
    //
    @Autowired
    private BrandRepository dao;

    @PostMapping("/B/brand/insert")
    public Brand insertBrand(@RequestBody Brand bnd){
        Brand resBnd = dao.save(bnd);
        return resBnd;
    }
    @GetMapping("/B/brand/findAll")
    public List<Brand> findAll(){
        return dao.findAll();
    }

    @GetMapping("/B/brand/findBrandById/{id}")
    public Brand findBrandById(@PathVariable Integer id) {
        return dao.findBrandById(id);
    }




//    @GetMapping(value = "/B/Brand/findProductByBrandId/{id}")
//    public Set<Product> findProductByBrandId(@PathVariable Integer id) {
//        return Set<Product> dao.findProductById(id);
//    }
}
