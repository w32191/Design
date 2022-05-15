package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Activity;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ActivityRepository extends JpaRepository<Activity, Integer> {

  @Query(value =
      "SELECT [id],[subject],[content],[discount_percentage],[start_date],[end_date],[photo],[color] "
          + " FROM activities WHERE DateDiff(Day,start_date,getdate()) >= 0 AND DateDiff(Day,end_date,getdate()) <= 0",
      nativeQuery = true)
  List<Activity> findActivitiesCurrentTime();

  @Query(value =
      "SELECT [id],[subject],[content],[discount_percentage],[start_date],[end_date],[photo],[color] "
          + " FROM activities WHERE DateDiff(Day,start_date,getdate()) >= 0 AND DateDiff(Day,end_date,getdate()) <= 0 AND [id]=:id",
      nativeQuery = true)
  Activity findActivitiesCurrentTime(@Param("id") Integer id);

  List<Activity> findActivitiesBySubjectContaining(@Param("subject") String subject);

  Page<Activity> findActivitiesByStartDateBetweenAndEndDateBetween(LocalDate startDate1,
      LocalDate endDate1, LocalDate startDate2, LocalDate endDate2, Pageable page);

  Page<Activity> findActivitiesByStartDateBetweenAndEndDateBetweenAndSubjectContaining(
      LocalDate startDate1, LocalDate endDate1, LocalDate startDate2, LocalDate endDate2,
      String subject, Pageable page);

}
