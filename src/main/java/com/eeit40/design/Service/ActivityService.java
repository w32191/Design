package com.eeit40.design.Service;

import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.Activity;
import java.util.List;

public interface ActivityService {


  List<Activity> findAll();

  List<ActivityDto> findAllDto();

  boolean deleteByID(int id);
}
