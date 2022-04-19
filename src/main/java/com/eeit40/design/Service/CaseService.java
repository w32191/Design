package com.eeit40.design.Service;

import com.eeit40.design.Dao.CaseRepository;
import com.eeit40.design.Entity.Case;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CaseService {
    @Autowired
    private CaseRepository caseDao;

    public void insert(Case aCase){
        caseDao.save(aCase);
    }

    public Case findById(Integer id){
        Optional<Case> option = caseDao.findById(id);

        if(option.isPresent()){
            return option.get();
        }
        return null;
    }

    public void deleteById(Integer id){
        caseDao.deleteById(id);
    }

    public List<Case> findAllCases(){
        return caseDao.findAll();
    }

    public Page<Case> findByPage(Integer pageNumber){
        Pageable pgb = PageRequest.of(pageNumber-1,6,Sort.Direction.DESC,"dateTime");

        Page<Case> page = caseDao.findAll(pgb);

        return page;

    }

    public Case getLastest(){
        return caseDao.findFirstByOrderByDateTimeAsc();
    }

}
