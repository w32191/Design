package com.eeit40.design.Service;

import com.eeit40.design.Entity.Activity;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public interface ActivityService {


  List<Activity> findAll();

  boolean deleteByID(int id) throws MalformedURLException;

  Activity insertActivity(Activity activity, MultipartFile file) throws IOException;
}
