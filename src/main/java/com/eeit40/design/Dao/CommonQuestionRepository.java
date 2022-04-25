package com.eeit40.design.Dao;

import com.eeit40.design.Entity.CommonQuestion;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CommonQuestionRepository extends JpaRepository<CommonQuestion, Integer> {

//更新資料
  @Modifying //針對某個東西update可能會失敗，所以update要加@Modifying，如果連@Modifying都不行就要加@Transactional
  //如果要直接下SQL原生語法的話要用@Query
  @Query(value = "update common_question set answer=:answer, question=:question, question_type=:question_type where id=:id", nativeQuery = true)
  public void updateCommonQuestion(@Param(value = "question_type") String question_type, 
      @Param(value = "question") String question, 
      @Param(value = "answer") String answer,
      @Param(value = "id") String id);
  
}
