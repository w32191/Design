package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Case;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface CaseRepository extends JpaRepository<Case, Integer> {

    //按"時間"尋找
    //1.Decs
//    @Query(value = "select * from cases order by date_time Desc = ?1", nativeQuery = true)
    public List<Case> findAllByOrderByDateTimeDesc();
    //2.Acs
    public List<Case> findAllByOrderByDateTimeAsc();


    //按"類別"尋找
    @Query(value = "select * from cases where classification = :classification", nativeQuery = true)
    public List<Case> findByClassification(String classification);


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
