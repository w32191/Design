package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.CaseRepository;
import com.eeit40.design.Entity.Case;
import com.eeit40.design.Service.CaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.Access;

@Component
public class CaseServiceImpl implements CaseService {

    @Autowired
    private CaseRepository caseRepository;

    @Override
    public Case getCaseById(Integer id) {
        return caseRepository.getCaseById(id);
    }
}
