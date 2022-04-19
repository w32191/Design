package com.eeit40.design.Service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit40.design.Dao.CommonQuestionRepository;
import com.eeit40.design.Entity.CommonQuestion;

@Service
public class CommonQuestionService2 {

  @Autowired
  private CommonQuestionRepository cqrDao;

  public List<CommonQuestion> selectAll() {

    List<CommonQuestion> cq = cqrDao.findAll();
    return cq;
  }

  public void insert(CommonQuestion messages) {
    cqrDao.save(messages);
  }

  public CommonQuestion findById(Integer id) {
    Optional<CommonQuestion> option = cqrDao.findById(id);

    if (option.isPresent()) {
      return option.get();
    }

    return null;
  }

  public void deleteById(Integer id) {
    cqrDao.deleteById(id);
  }



}
