package com.eeit40.design.Service;

import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.Activity;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;
import org.springframework.data.domain.Page;

public interface ActivityService {


  List<Activity> findAll();

  Page<Activity> findByPage(Integer pageNumber);

  boolean deleteByID(int id);

  Activity findById(Integer id);

  Activity insertActivity(ActivityDto dto) throws IOException;
}
