package com.eeit40.design.Service;

import com.eeit40.design.Entity.Activity;
import java.io.IOException;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public interface ActivityService {


  List<Activity> findAll();

  boolean deleteByID(int id);

  boolean insertActivity(Activity activity, MultipartFile file) throws IOException;
}
