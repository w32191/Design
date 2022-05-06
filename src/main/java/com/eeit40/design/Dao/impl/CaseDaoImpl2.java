package com.eeit40.design.Dao.impl;


import com.eeit40.design.Dto.CaseDto;
import com.eeit40.design.Dto.CaseQueryParams;
import com.eeit40.design.Entity.Case;
import com.eeit40.design.rowmapper.CaseRowMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@Slf4j
public class CaseDaoImpl2 {

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public Integer countCase(CaseQueryParams caseQueryParams) {

        String sql = "SELECT count(*) FROM cases ";

        Map<String, Object> map = new HashMap<>();

        // 1.未提煉查詢條件
//        if(caseQueryParams.getSearch() != null){
//            sql = sql + " WHERE CONCAT (classification , location , title) LIKE :search";
//            map.put("search", "%" + caseQueryParams.getSearch() + "%");
//        }
        // 2.提煉程式後的查詢條件
        sql = addFilteringSql(sql, map, caseQueryParams);

        Integer total = namedParameterJdbcTemplate.queryForObject(sql, map, Integer.class);

        return total;
    }
    //改完
    public List<Case> getCases(CaseQueryParams caseQueryParams) {

        String sql = "SELECT * FROM cases ";
//                + " ORDER BY cases.id, cases.name, cases.title, cases.classification, cases.location, cases.case_email, " +
//                "cases.message, cases.expiry_date, cases.viewing_count ";

//        String sql = "SELECT cases.id, cases.name, cases.title, cases.classification, cases.location,  cases.case_email,cases.message, cases.date_time, cases.expiry_date, cases.viewing_count " +
//                "FROM cases LEFT JOIN cases_photo cp on cases.id = cp.fk_cases_id";


        Map<String, Object> map = new HashMap<>();

        // 1.未提煉查詢條件
//        if(caseQueryParams.getSearch() != null){
//            sql = sql + " WHERE CONCAT (classification , location , title) LIKE :search";
//            map.put("search", "%" + caseQueryParams.getSearch() + "%");
//        }
        // 2.提煉程式後的查詢條件
        sql = addFilteringSql(sql, map, caseQueryParams);

        // 排序
        sql = sql + " ORDER BY " + caseQueryParams.getOrderBy() + " " + caseQueryParams.getSort();

        // 分頁
        sql = sql + " OFFSET :offset ROWS FETCH NEXT :fetchNext ROWS ONLY";
        map.put("fetchNext", caseQueryParams.getFetchNext());
        map.put("offset", caseQueryParams.getOffset());

        List<Case> caseList = namedParameterJdbcTemplate.query(sql, map, new CaseRowMapper());

        return caseList;
    }
    //改完
    public List<Case> getCaseById(Integer id){
            String sql = "select * " +
                    " from cases " +
                    " left join cases_photo on cases_photo.fk_cases_id = cases.id " +
                    " where id= :id";
        Map<String, Object> map = new HashMap();
        map.put("id" , id);

        List<Case> caseList = namedParameterJdbcTemplate.query(sql,map, new CaseRowMapper());
//        System.out.println(caseList);

        if(caseList.size() > 0){
            return caseList;
        }else {
            return null;
        }
    }

    public Integer createCase(CaseDto caseDto) {
        String sql =
                "INSERT INTO cases (name,title,classification, location,  case_email,  message, date_time, expiry_date,cover_photo) " +
                "VALUES (:name, :title, :classification, :location, :caseEmail, :message, :dateTime, :expiryDate,:coverPhoto)";

        Map<String, Object> map = new HashMap<>();
        map.put("title", caseDto.getTitle());
        map.put("name", caseDto.getName());
        map.put("caseEmail", caseDto.getCaseEmail());
        map.put("classification", caseDto.getClassification());
        map.put("location", caseDto.getLocation());
        map.put("message", caseDto.getMessage());
        map.put("expiryDate", caseDto.getExpiryDate());
        map.put("coverPhoto", caseDto.getCoverPhoto());

        Date now = new Date();
        map.put("dateTime", now);


        KeyHolder keyHolder = new GeneratedKeyHolder();

        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(map), keyHolder);

        int id = keyHolder.getKey().intValue();

// insert into imgurImg(link,fk_case_id) values ('xxx',id);
        return id;
    }

    public void updatedCase(Integer id, CaseDto caseDto) {
        String sql = "UPDATE cases " +
                "SET name = :name, title = :title ,classification = :classification , location = :location,  case_email = :caseEmail,  message = :message " +
                "WHERE id = :id";

        //  "Update imgurImg Set link=:link WHERE fk_case_id =:caseId and id=:id'
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);

        map.put("title", caseDto.getTitle());
        map.put("name", caseDto.getName());
        map.put("caseEmail", caseDto.getCaseEmail());
        map.put("classification", caseDto.getClassification());
        map.put("location", caseDto.getLocation());
        map.put("message", caseDto.getMessage());
        map.put("expiryDate", caseDto.getExpiryDate());

        namedParameterJdbcTemplate.update(sql, map);
    }

    public void deleteCaseById(Integer id) {
        String sql1 = "DELETE from cases_photo WHERE fk_cases_id=:fk_id";
        Map<String, Object> map2 = new HashMap<>();
        map2.put("fk_id", id);
        namedParameterJdbcTemplate.update(sql1,map2);

        String sql = "DELETE FROM cases WHERE id = :id";

        Map<String, Object> map = new HashMap<>();
        map.put("id", id);

        namedParameterJdbcTemplate.update(sql, map);
    }

    public String uploadImg(CaseDto caseDto){
        String sql = "INSERT INTO cases_photo (fk_cases_id, case_photo_url, case_photo_message) " +
       " VALUES (:fk_cases_id, :case_photo_url, :case_photo_message ) ";

        Map<String, Object> map = new HashMap<>();
        map.put("fk_cases_id", caseDto.getCasesPhoto());
        map.put("case_photo_message", caseDto.getCasesPhoto());
        map.put("case_photo_url", caseDto.getCasesPhoto());

        KeyHolder keyHolder = new GeneratedKeyHolder();

        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(map), keyHolder);

        int id = keyHolder.getKey().intValue();

        return null;
    };



    //提煉程式 將 sql 重複利用
    private String addFilteringSql(String sql, Map<String, Object> map, CaseQueryParams caseQueryParams){

        // 查詢條件
        if(caseQueryParams.getSearch() != null){
            sql = sql + " WHERE CONCAT (classification , location , title) LIKE :search";
            map.put("search", "%" + caseQueryParams.getSearch() + "%");
        }

        return sql;
    }

}
