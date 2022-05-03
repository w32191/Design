package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.impl.CaseDaoImpl2;
import com.eeit40.design.Dto.CaseDto;
import com.eeit40.design.Dto.CaseQueryParams;
import com.eeit40.design.Entity.Case;
import com.eeit40.design.Service.CaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CaseServiceImpl implements CaseService {

    @Autowired
    private CaseDaoImpl2 caseRepository;

    @Override
    public Integer countCase(CaseQueryParams caseQueryParams) {
        return caseRepository.countCase(caseQueryParams);
    }

    @Override
    public List<Case> getCases(CaseQueryParams caseQueryParams) {
        return caseRepository.getCases(caseQueryParams);
    }

    @Override
    public List<Case> getCaseById(Integer id) {
        return caseRepository.getCaseById(id);
    }

    @Override
    public Integer createCase(CaseDto caseDto) {
        return caseRepository.createCase(caseDto);
    }

    @Override
    public void updatedCase(Integer id, CaseDto caseDto) {
        caseRepository.updatedCase(id, caseDto);
    }

    @Override
    public void deleteCaseById(Integer id) {
        caseRepository.deleteCaseById(id);
    }

    @Override
    public String uploadImg(CaseDto caseDto){
        return caseRepository.uploadImg(caseDto);
    }

}
