package com.eeit40.design.Service;

import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.Activity;
import java.io.IOException;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public interface ActivityService {


  List<Activity> findAll();

  List<ActivityDto> findAllDto();

  boolean deleteByID(int id);

  boolean insertActivity(ActivityDto dto, MultipartFile file) throws IOException;
}
