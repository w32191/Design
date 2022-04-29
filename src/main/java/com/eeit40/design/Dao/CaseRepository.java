//package com.eeit40.design.Dao;
//
//import com.eeit40.design.Dto.CaseDto;
//import com.eeit40.design.Dto.CaseQueryParams;
//import com.eeit40.design.Entity.Case;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.stereotype.Component;
//
//import java.util.List;
//
//
////public interface CaseRepository extends JpaRepository<Case, Integer> {
//public interface CaseRepository {
//
//    Integer countCase(CaseQueryParams caseQueryParams);
//
//    List<Case> getCases(CaseQueryParams caseQueryParams);
//
//    Case getCaseById(Integer id);
//
//    Integer createCase(CaseDto caseDto);
//
//    void updatedCase(Integer id, CaseDto caseDto);
//
//    void deleteCaseById(Integer id);
//
//    //按"時間"尋找
//    //1.Decs
//    //@Query(value = "select * from cases order by date_time Desc = ?1", nativeQuery = true)
////    public List<Case> findAllByOrderByDateTimeDesc();
//    //2.Acs
////    public List<Case> findAllByOrderByDateTimeAsc();
//
//    //按"類別"搜尋
////    @Query(value = "select * from cases where classification = :classification", nativeQuery = true)
////    public List<Case> orderByClassification(String classification);
//
//    //按"地區"搜尋
////    @Query(value = "select * from cases where location = :location", nativeQuery = true)
////    public List<Case> orderByLocation(String location);
//
//    //新增案件
//
//    //刪除
////    @Modifying
////    @Query(value = "delete from cases where id=?1",nativeQuery = true)
////    public Integer deleteCaseById(Integer id);
//
////    @Query("from Case where name = :name")
////    public List<Case> findCaseByName(@Param("name") String name);
////
////    @Query(value = "select * from cases where name = :name", nativeQuery = true)
////    public List<Case> findCaseByName(@Param("name") String name);
//
////    @Transactional
////    @Modifying
////    @Query(value = "delete from cases where id = ?1",nativeQuery = true)
////    public void deleteCaseById(Integer id);
//
//
//
//
//}