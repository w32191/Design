//package com.eeit40.design.Dao.impl;
//
//
//import com.eeit40.design.Dao.CaseRepository;
//import com.eeit40.design.Dto.CaseDto;
//import com.eeit40.design.Dto.CaseQueryParams;
//import com.eeit40.design.Entity.Case;
//import com.eeit40.design.rowmapper.CaseRowMapper;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Example;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.Pageable;
//import org.springframework.data.domain.Sort;
//import org.springframework.data.repository.query.FluentQuery;
//import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
//import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
//import org.springframework.jdbc.support.GeneratedKeyHolder;
//import org.springframework.jdbc.support.KeyHolder;
//import org.springframework.stereotype.Repository;
//
//import java.util.*;
//import java.util.function.Function;
//
//
//@Repository
//public class CaseDaoImpl implements CaseRepository
//{
//
//    @Autowired
//    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
//
//    @Override
//    public Integer countCase(CaseQueryParams caseQueryParams) {
//
//        String sql = "SELECT count(*) FROM cases ";
//
//        Map<String, Object> map = new HashMap<>();
//
//        // 1.未提煉查詢條件
////        if(caseQueryParams.getSearch() != null){
////            sql = sql + " WHERE CONCAT (classification , location , title) LIKE :search";
////            map.put("search", "%" + caseQueryParams.getSearch() + "%");
////        }
//        // 2.提煉程式後的查詢條件
//        sql = addFilteringSql(sql, map, caseQueryParams);
//
//        Integer total = namedParameterJdbcTemplate.queryForObject(sql, map, Integer.class);
//
//        return total;
//    }
//
//    @Override
//    public List<Case> getCases(CaseQueryParams caseQueryParams) {
//
//        String sql = "SELECT id, name, title, classification, location,  case_email,  message, date_time, expiry_date, viewing_count " +
//                "FROM cases ";
//
//        Map<String, Object> map = new HashMap<>();
//
//        // 1.未提煉查詢條件
////        if(caseQueryParams.getSearch() != null){
////            sql = sql + " WHERE CONCAT (classification , location , title) LIKE :search";
////            map.put("search", "%" + caseQueryParams.getSearch() + "%");
////        }
//        // 2.提煉程式後的查詢條件
//        sql = addFilteringSql(sql, map, caseQueryParams);
//
//        // 排序
//        sql = sql + " ORDER BY " + caseQueryParams.getOrderBy() + " " + caseQueryParams.getSort();
//
//        // 分頁
//        sql = sql + " OFFSET :offset ROWS FETCH NEXT :fetchNext ROWS ONLY";
//        map.put("fetchNext", caseQueryParams.getFetchNext());
//        map.put("offset", caseQueryParams.getOffset());
//
//        List<Case> caseList = namedParameterJdbcTemplate.query(sql, map, new CaseRowMapper());
//
//        return caseList;
//    }
//
//    @Override
//    public Case getCaseById(Integer id){
//        String sql = "select id, name, title, classification, location,  case_email,  message, date_time, expiry_date, viewing_count " +
//                "from cases " +
//                "where id= :id";
//        Map<String, Object> map = new HashMap();
//        map.put("id" , id);
//
//        List<Case> caseList = namedParameterJdbcTemplate.query(sql,map, new CaseRowMapper());
//
//        if(caseList.size() > 0){
//            return caseList.get(0);
//        }else {
//            return null;
//        }
//    }
//
//    @Override
//    public Integer createCase(CaseDto caseDto) {
//        String sql = "\n" +
//                "INSERT INTO cases (name,title,classification, location,  case_email,  message, date_time, expiry_date) " +
//                "VALUES (:name, :title, :classification, :location, :caseEmail, :message, :dateTime, :expiryDate)";
//
//        Map<String, Object> map = new HashMap<>();
//        map.put("title", caseDto.getTitle());
//        map.put("name", caseDto.getName());
//        map.put("caseEmail", caseDto.getCaseEmail());
//        map.put("classification", caseDto.getClassification());
//        map.put("location", caseDto.getLocation());
//        map.put("message", caseDto.getMessage());
//        map.put("expiryDate", caseDto.getExpiryDate());
//
//        Date now = new Date();
//        map.put("dateTime", now);
//
//        KeyHolder keyHolder = new GeneratedKeyHolder();
//
//        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(map), keyHolder);
//
//        int id = keyHolder.getKey().intValue();
//
//// insert into imgurImg(link,fk_case_id) values ('xxx',id);
//        return id;
//    }
//
//    @Override
//    public void updatedCase(Integer id, CaseDto caseDto) {
//        String sql = "UPDATE cases " +
//                "SET name = :name, title = :title ,classification = :classification , location = :location,  case_email = :caseEmail,  message = :message " +
//                "WHERE id = :id";
//
//        //  "Update imgurImg Set link=:link WHERE fk_case_id =:caseId and id=:id'
//        Map<String, Object> map = new HashMap<>();
//        map.put("id", id);
//
//        map.put("title", caseDto.getTitle());
//        map.put("name", caseDto.getName());
//        map.put("caseEmail", caseDto.getCaseEmail());
//        map.put("classification", caseDto.getClassification());
//        map.put("location", caseDto.getLocation());
//        map.put("message", caseDto.getMessage());
//        map.put("expiryDate", caseDto.getExpiryDate());
//
//        namedParameterJdbcTemplate.update(sql, map);
//    }
//
//    @Override
//    public void deleteCaseById(Integer id) {
//        String sql = "DELETE FROM cases WHERE id = :id";
//
//        Map<String, Object> map = new HashMap<>();
//        map.put("id", id);
//
//        namedParameterJdbcTemplate.update(sql, map);
//    }
//
//
//    //提煉程式 將 sql 重複利用
//    private String addFilteringSql(String sql, Map<String, Object> map, CaseQueryParams caseQueryParams){
//
//        // 查詢條件
//        if(caseQueryParams.getSearch() != null){
//            sql = sql + " WHERE CONCAT (classification , location , title) LIKE :search";
//            map.put("search", "%" + caseQueryParams.getSearch() + "%");
//        }
//
//        return sql;
//    }
//
//
//    @Override
//    public List<Case> findAll() {
//        return null;
//    }
//
//    @Override
//    public List<Case> findAll(Sort sort) {
//        return null;
//    }
//
//    @Override
//    public Page<Case> findAll(Pageable pageable) {
//        return null;
//    }
//
//    @Override
//    public List<Case> findAllById(Iterable<Integer> integers) {
//        return null;
//    }
//
//    @Override
//    public long count() {
//        return 0;
//    }
//
//    @Override
//    public void deleteById(Integer integer) {
//
//    }
//
//    @Override
//    public void delete(Case entity) {
//
//    }
//
//    @Override
//    public void deleteAllById(Iterable<? extends Integer> integers) {
//
//    }
//
//    @Override
//    public void deleteAll(Iterable<? extends Case> entities) {
//
//    }
//
//    @Override
//    public void deleteAll() {
//
//    }
//
//    @Override
//    public <S extends Case> S save(S entity) {
//        return null;
//    }
//
//    @Override
//    public <S extends Case> List<S> saveAll(Iterable<S> entities) {
//        return null;
//    }
//
//    @Override
//    public Optional<Case> findById(Integer integer) {
//        return Optional.empty();
//    }
//
//    @Override
//    public boolean existsById(Integer integer) {
//        return false;
//    }
//
//    @Override
//    public void flush() {
//
//    }
//
//    @Override
//    public <S extends Case> S saveAndFlush(S entity) {
//        return null;
//    }
//
//    @Override
//    public <S extends Case> List<S> saveAllAndFlush(Iterable<S> entities) {
//        return null;
//    }
//
//    @Override
//    public void deleteAllInBatch(Iterable<Case> entities) {
//
//    }
//
//    @Override
//    public void deleteAllByIdInBatch(Iterable<Integer> integers) {
//
//    }
//
//    @Override
//    public void deleteAllInBatch() {
//
//    }
//
//    @Override
//    public Case getOne(Integer integer) {
//        return null;
//    }
//
//    @Override
//    public Case getById(Integer integer) {
//        return null;
//    }
//
//    @Override
//    public <S extends Case> Optional<S> findOne(Example<S> example) {
//        return Optional.empty();
//    }
//
//    @Override
//    public <S extends Case> List<S> findAll(Example<S> example) {
//        return null;
//    }
//
//    @Override
//    public <S extends Case> List<S> findAll(Example<S> example, Sort sort) {
//        return null;
//    }
//
//    @Override
//    public <S extends Case> Page<S> findAll(Example<S> example, Pageable pageable) {
//        return null;
//    }
//
//    @Override
//    public <S extends Case> long count(Example<S> example) {
//        return 0;
//    }
//
//    @Override
//    public <S extends Case> boolean exists(Example<S> example) {
//        return false;
//    }
//
//    @Override
//    public <S extends Case, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
//        return null;
//    }
//}
