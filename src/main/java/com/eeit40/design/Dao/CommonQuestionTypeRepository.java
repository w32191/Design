package com.eeit40.design.Dao;

import com.eeit40.design.Entity.CommonQuestionType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommonQuestionTypeRepository extends JpaRepository<CommonQuestionType, Integer> {
  
}
