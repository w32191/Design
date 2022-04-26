package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Case;
import com.eeit40.design.rowmapper.CaseRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//@Repository
//public interface CaseRepository extends JpaRepository<Case, Integer> {
public interface CaseRepository  {

    Case getCaseById(Integer id);

    //按"時間"尋找
    //1.Decs
    //@Query(value = "select * from cases order by date_time Desc = ?1", nativeQuery = true)
//    public List<Case> findAllByOrderByDateTimeDesc();
    //2.Acs
//    public List<Case> findAllByOrderByDateTimeAsc();

    //按"類別"搜尋
//    @Query(value = "select * from cases where classification = :classification", nativeQuery = true)
//    public List<Case> orderByClassification(String classification);

    //按"地區"搜尋
//    @Query(value = "select * from cases where location = :location", nativeQuery = true)
//    public List<Case> orderByLocation(String location);

    //新增案件

    //刪除
//    @Modifying
//    @Query(value = "delete from cases where id=?1",nativeQuery = true)
//    public Integer deleteCaseById(Integer id);

//    @Query("from Case where name = :name")
//    public List<Case> findCaseByName(@Param("name") String name);
//
//    @Query(value = "select * from cases where name = :name", nativeQuery = true)
//    public List<Case> findCaseByName(@Param("name") String name);

//    @Transactional
//    @Modifying
//    @Query(value = "delete from cases where id = ?1",nativeQuery = true)
//    public void deleteCaseById(Integer id);




}
