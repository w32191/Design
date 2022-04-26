package com.eeit40.design.Dao.impl;

import com.eeit40.design.Dao.CaseRepository;
import com.eeit40.design.Entity.Case;
import com.eeit40.design.rowmapper.CaseRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class CaseDaoImpl implements CaseRepository {

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Override
    public Case getCaseById(Integer id){
        String sql = "select * from cases where id= :id";
        Map<String, Object> map = new HashMap();
        map.put("id" , id);

        List<Case> caseList = namedParameterJdbcTemplate.query(sql,map, new CaseRowMapper());

        if(caseList.size() > 0){
            return caseList.get(0);
        }else {
            return null;
        }
    }

}
