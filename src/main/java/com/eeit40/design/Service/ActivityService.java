package com.eeit40.design.Service;

import com.eeit40.design.Entity.Activity;
import java.util.List;
import org.springframework.data.domain.Page;

public interface ActivityService {



  List<Activity> findAll();


}
