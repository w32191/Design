package com.eeit40.design.Service;

import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.Product;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;
import java.util.Set;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

public interface ActivityService {


  List<Activity> findAll();

  Page<Activity> findByPage(Integer pageNumber);

  boolean deleteByID(int id);

  Activity findById(Integer id);

  Activity insertActivity(ActivityDto dto) throws IOException;

  Activity updateActivity(ActivityDto dto) throws IOException;


  // Dto 將前端傳來的MultipartFile file轉換
  ActivityDto setImg(MultipartFile file, ActivityDto dto) throws IOException;
}
