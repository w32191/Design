package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.ActivityRepository;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.ImgurImg;
import com.eeit40.design.Service.ActivityService;
import com.eeit40.design.Util.ImgurUtil;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import javax.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
@Slf4j
public class ActivityServiceImpl implements ActivityService {

  @Autowired
  private ActivityRepository activityRepository;

  @Autowired
  private ImgurUtil imgurUtil;

  @Override
  public List<Activity> findAll() {
    return activityRepository.findAll();
  }

  @Override
  public boolean deleteByID(int id) throws MalformedURLException {
    Optional<Activity> findResult = activityRepository.findById(id);

    // 先確認是否有這個ID的Activity
    if (findResult.isPresent()) {

      Activity activity = findResult.get();
      for (ImgurImg img : activity.getImgurImgs()) {
        // 刪除imgur圖床的照片
        if (imgurUtil.delete(img.getDeleteHash())) {
          log.info("id:" + img.getId() + "imgur圖床照片刪除成功");
        } else {
          log.info("id:" + img.getId() + "imgur圖床照片刪除失敗");
        }
      }

      //斷掉商品關聯後刪除
      activity.setProducts(null);
      activityRepository.deleteById(id);

      // 刪掉後再查一次看看還在不在
      findResult = activityRepository.findById(id);
    } else {
      //
      return false;
    }

    // 查一次結果如果是空的，表示刪除成功
    return findResult.isEmpty();

  }

  @Override
  public Activity insertActivity(Activity activity, MultipartFile file) throws IOException {
    Set<ImgurImg> imgs = new LinkedHashSet<>();
    // SamWang To-Do: 目前只讓使用者傳一張照片，多張照片這邊要再調整

    //如果使用者有上傳圖片的話
    if (file != null) {
      ImgurImg img = imgurUtil.uploadImg(file);
      // 關聯活動
      img.setFkActivity(activity);
      imgs.add(img);
    }

    //關聯圖片
    activity.setImgurImgs(imgs);
    // 回傳新增後的Activity
    return activityRepository.save(activity);
  }

}
