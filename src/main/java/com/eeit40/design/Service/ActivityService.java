package com.eeit40.design.Service;
import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.Activity;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

public interface ActivityService {


  List<Activity> findAll();

  boolean deleteByID(int id);

  Activity insertActivity(ActivityDto dto) throws IOException;
}
