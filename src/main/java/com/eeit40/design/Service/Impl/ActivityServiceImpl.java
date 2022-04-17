package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.ActivityRepository;
import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Service.ActivityService;
import com.eeit40.design.util.ImgurUtil;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class ActivityServiceImpl implements ActivityService {

  @Autowired
  private ActivityRepository activityRepository;
  @Autowired
  private ProductRepository productRepository;
  @Autowired
  private ImgurUtil imgurUtil;

  @Override
  public List<Activity> findAll() {
    return activityRepository.findAll();
  }

  @Override
  public boolean deleteByID(int id) {
    Optional<Activity> findResult = activityRepository.findById(id);

    if (findResult.isPresent()) {
      //斷掉關聯後刪除
      findResult.get().setProducts(null);
      activityRepository.deleteById(id);

      // 刪掉後再查一次看看還在不在
      findResult = activityRepository.findById(id);
    } else {
      return false;
    }

    // 查一次結果如果是空的，表示刪除成功
    return findResult.isEmpty();

  }

  @Override
  public boolean insertActivity(Activity activity, MultipartFile file) throws IOException {
    // SamWang To-Do 要用DTO還是直接Entity接？ 待確認

    return true;
  }

}
