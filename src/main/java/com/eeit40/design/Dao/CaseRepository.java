package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Case;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Repository
public interface CaseRepository extends JpaRepository<Case, Integer> {

//    @Query("from Case where name = :name")
//    public List<Case> findCaseByName(@Param("name") String name);
//
//    @Query(value = "select * from cases where name = :name", nativeQuery = true )
//    public List<Case> findCaseByName2(@Param("name") String name);
//
//    @Transactional
//    @Modifying
//    @Query(value = "delete from cases where id = ?1",nativeQuery = true)
//    public void deleteCaseById(Integer id);
//
//    public List<Case> findByClassificationOrderByName(String  classification);

    public Case findFirstByOrderByDateTimeAsc();
}
