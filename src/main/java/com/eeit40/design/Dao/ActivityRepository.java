package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Activity;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ActivityRepository extends JpaRepository<Activity, Integer> {

  @Query(value = "SELECT * FROM activities WHERE DateDiff(Day,start_date,getdate()) >= 0 AND DateDiff(Day,end_date,getdate()) <= 0", nativeQuery = true)
  List<Activity> findActivitiesCurrentTime();

}
