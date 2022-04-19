package com.eeit40.design.Controller.FrontSide;

import com.eeit40.design.Dao.CaseRepository;
import com.eeit40.design.Entity.Case;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.querydsl.QPageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
public class CaseApi {
//
//    @Autowired
//    private CaseRepository dao;
//
//    @ResponseBody
//    @PostMapping(value = "F/case/insert")
//    public Case insertCase(@RequestBody Case aCase){
//        Case requestCase = dao.save(aCase);
//        return requestCase;
//    }
//
//    @ResponseBody
//    @PostMapping(value = "/F/case/insertAll")
//    public List<Case> insertCase(@RequestBody List<Case> aCase){
//        List<Case> responseList = dao.saveAll(aCase);
//        return responseList;
//    }
//
//    @GetMapping("/F/case/get/{id}")
//    public Case getCaseById2(@PathVariable Integer id){
//        Optional<Case> reponseCase = dao.findById(id);
//        if(reponseCase.isPresent()){
//            return reponseCase.get();
//        }
//        return null;
//    }
//
//    @GetMapping("/F/case/get")
//    public Case getCaseById(@RequestParam Integer id){
//        Optional<Case> reponseCase = dao.findById(id);
//        if(reponseCase.isPresent()){
//            return reponseCase.get();
//        }
//        return null;
//    }
//
////    @GetMapping(value = "/F/case/page/{pageNumber}")
////    public List<Case> findByPage(@PathVariable Integer pageNumber){
////        Pageable pgb = PageRequest.of(pageNumber-1,2, Sort.Direction.DESC,"id");
////        Page<Case> page = dao.findAll(pgb);
////        List<Case> list = page.getContent();
////        return list;
////    }
//
//    @GetMapping(value = "/F/case/findByName")
//    public List<Case> findByName(@RequestParam String name){
//        return dao.findCaseByName(name);
//    }
//
//    @GetMapping(value = "/F/case/findByName2")
//    public List<Case> findByName2(@RequestParam String name){
//        return dao.findCaseByName2(name);
//    }
//
//    @GetMapping(value = "/F/case/delete/{id}")
//    public boolean deleteCase(@PathVariable Integer id){
//        dao.deleteCaseById(id);
//        return true;
//    }
//
//    @GetMapping(value = "/F/case/Classification/{Classification}")
//    public List<Case> findClassification(@PathVariable String Classification){
//        System.out.println(Classification);
//        return dao.findByClassificationOrderByName(Classification);
//    }
}
