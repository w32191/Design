package com.eeit40.design.Service;

import com.eeit40.design.Dto.CaseQueryParams;
import com.eeit40.design.Dto.DesignDto;
import com.eeit40.design.Dto.DesignQueryParams;
import com.eeit40.design.Entity.Design;

import java.util.List;


public interface DesignService {

    Integer countDesign(DesignQueryParams designQueryParams);

    List<Design> getDesigns(DesignQueryParams designQueryParams);

    Design getDesignById(Integer id);

    List<Design> getDesignByMemberId(Integer fk_member_id);

    Integer createDesign(DesignDto designDto);

    void deleteDesign(Integer id);

    void updateDesign(Integer id, DesignDto designDto);

}

