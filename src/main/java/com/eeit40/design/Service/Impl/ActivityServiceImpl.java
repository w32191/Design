package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.ActivityRepository;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Service.ActivityService;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ActivityServiceImpl implements ActivityService {

  @Autowired
  private ActivityRepository activityRepository;

  @Override
  public List<Activity> findAll(){
    return activityRepository.findAll();
  }



}
