package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.ActivityRepository;
import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Service.ActivityService;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ActivityServiceImpl implements ActivityService {

  @Autowired
  private ActivityRepository activityRepository;

  @Override
  public List<Activity> findAll() {
    return activityRepository.findAll();
  }

  @Override
  public List<ActivityDto> findAllDto() {
    List<Activity> result = activityRepository.findAll();
    List<ActivityDto> dtoList = null;

    //先確定result有沒有資料
    if (!result.isEmpty()) {

      dtoList = new ArrayList<>();
      for (Activity activity : result) {

        ActivityDto dto = new ActivityDto(activity.getId(), activity.getSubject(),
            activity.getContent(), activity.getDiscountPercentage(), activity.getStartDate(),
            activity.getEndDate(), activity.getImgurImgs(), activity.getProducts());

        dtoList.add(dto);
      }
    }

    return dtoList;
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

}
