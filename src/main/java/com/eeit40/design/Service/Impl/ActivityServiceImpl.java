package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.ActivityRepository;
import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.ImgurImg;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Service.ActivityService;
import com.eeit40.design.util.ImgurUtil;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
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

  @Override
  public boolean insertActivity(ActivityDto dto, MultipartFile file) throws IOException {

    Activity activity = new Activity();
    activity.setSubject(dto.getSubject());
    activity.setContent(dto.getContent());
    activity.setDiscountPercentage(dto.getDiscountPercentage());
    activity.setStartDate(dto.getStartDate());
    activity.setEndDate(dto.getEndDate());
    Set<Product> products;
    if (!dto.getProductIdList().isEmpty()) {
      products = new LinkedHashSet<>();
      // 因前端傳來的只有 此活動相關的商品ＩＤ，
      for (Integer productId : dto.getProductIdList()) {
        Product product = new Product();
        product.setId(productId);
        products.add(product);
      } // end of for()
      activity.setProducts(products);
    } // end of if()
    Set<ImgurImg> imgs = new LinkedHashSet<>();
    imgs.add(imgurUtil.uploadImg(file));

    return true;
  }

}
