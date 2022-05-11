package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.impl.DesignDaoImpl;
import com.eeit40.design.Dto.DesignDto;
import com.eeit40.design.Dto.DesignQueryParams;
import com.eeit40.design.Entity.Design;
import com.eeit40.design.Service.DesignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DesignServiceImpl implements DesignService {

    @Autowired
    private DesignDaoImpl designRepository;

    @Override
    public Integer countDesign(DesignQueryParams designQueryParams) {
        return designRepository.countDesign(designQueryParams);
    }

    @Override
    public List<Design> getDesigns(DesignQueryParams designQueryParams) {
        return designRepository.getDesigns(designQueryParams);
    }

    @Override
    public Design getDesignById(Integer id) {
        return designRepository.getDesignById(id);
    }

    @Override
    public List<Design> getDesignByMemberId(Integer fk_member_id) {
        return designRepository.getDesignByMemberId(fk_member_id);
    }

    @Override
    public Integer createDesign(DesignDto designDto) {
        return designRepository.createDesign(designDto);
    }

    @Override
    public void deleteDesign(Integer id){
        designRepository.deleteDesign(id);
    }

    @Override
    public void updateDesign(Integer id, DesignDto designDto) {
        designRepository.updateDesign(id, designDto);
    }


}
