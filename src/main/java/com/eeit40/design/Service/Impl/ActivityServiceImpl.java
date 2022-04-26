package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.ActivityRepository;
import com.eeit40.design.Dao.BrandRepository;
import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.ImgurImg;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Service.ActivityService;
import com.eeit40.design.Util.ImgurUtil;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import javax.annotation.PostConstruct;
import javax.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
@PropertySource("classpath:imgurConfigs.properties")
@Slf4j
public class ActivityServiceImpl implements ActivityService {

  @Autowired
  private ActivityRepository activityRepository;

  @Autowired
  private ProductRepository productRepository;

  @Autowired
  private BrandRepository brandRepository;

  @Autowired
  private ImgurUtil imgurUtil;

  // 認證放在imgur.properties，class上方要加 @PropertySource("classpath:imgur.properties")
  // ${ 中間放imgur.properties中的key值 }
  @Value("${AU_w32191}")
  private String authorization;

  // 整個Bean初始化中的執行順序：Constructor -> @Autowired/@Value -> @PostConstruct
  // 若不使用 @PostConstruct則需要在呼叫imgurUtil的方法前，用setter注入
  @PostConstruct
  public void init() {
    // imgurUtil沒有認證字串，setter注入
    this.imgurUtil.setAuthorization(authorization);
  }


  @Override
  public List<Activity> findAll() {
    return activityRepository.findAll();
  }

  @Override
  public Page<Activity> findByPage(Integer pageNumber) {
    Pageable page = PageRequest.of(pageNumber - 1, 10, Direction.ASC, "id");
    return activityRepository.findAll(page);
  }

  @Override
  public Activity findById(Integer id) {
    Optional<Activity> result = activityRepository.findById(id);
    return result.orElse(null);
  }

  @Override
  public Activity insertActivity(ActivityDto dto) throws IOException {

    Activity activity = new Activity();

    activity.setSubject(dto.getSubject());
    activity.setContent(dto.getContent());
    activity.setDiscountPercentage(dto.getDiscountPercentage());
    activity.setStartDate(dto.getStartDate());
    activity.setEndDate(dto.getEndDate());

    Set<ImgurImg> imgs = doUploadImg(dto.getInsertImg(), activity);
    //活動關聯圖片
    activity.setImgurImgs(imgs);
    //活動關聯商品
    activity.setProducts(checkedProductSet(dto));
    // 回傳新增後的Activity
    return activityRepository.save(activity);
  }


  @Override
  public boolean deleteByID(int id) {
    Optional<Activity> findResult = activityRepository.findById(id);

    // 先確認是否有這個ID的Activity
    if (findResult.isPresent()) {

      Activity activity = findResult.get();
      for (ImgurImg img : activity.getImgurImgs()) {
        // 刪除imgur圖床的照片
        if (imgurUtil.delete(img.getDeleteHash())) {
          log.info("id:" + img.getId() + " imgur圖床照片刪除成功");
        } else {
          log.info("id:" + img.getId() + " imgur圖床照片刪除失敗");
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
  public Activity updateActivity(ActivityDto dto) throws IOException {
    Optional<Activity> findResult = activityRepository.findById(dto.getId());

    // 如果傳入的ＩＤ是沒有這筆資料的
    if (findResult.isEmpty()) {
      log.info("update findResult is Empty!");
      // 把ＩＤ欄位清掉後，直接新增這筆
      dto.setId(null);
      return insertActivity(dto);
    }

    Activity activity = findResult.get();
    activity.setProducts(checkedProductSet(dto));
    activity.setSubject(dto.getSubject());
    activity.setContent(dto.getContent());
    activity.setStartDate(dto.getStartDate());
    activity.setEndDate(dto.getEndDate());
    Set<ImgurImg> imgs = doUploadImg(dto.getInsertImg(), activity);
    activity.setImgurImgs(imgs);

    return activityRepository.save(activity);
  }

  // Dto 將前端傳來的MultipartFile file轉換
  @Override
  public ActivityDto setImg(MultipartFile file, ActivityDto dto) throws IOException {
    Map<String, byte[]> imgs;
    //  若前端有傳MultipartFile來
    if (file != null) {
      log.info("有收到圖片");
      imgs = new HashMap<>();
      imgs.put(file.getOriginalFilename(), file.getBytes());
      dto.setInsertImg(imgs);
    }
    return dto;
  }

  @Override
  public List<Brand> getAllBrands() {
    return brandRepository.findAll();
  }

  @Override
  public Page<Brand> findAllBrandByPage(Integer pageNumber) {
    Pageable pageable = PageRequest.of(pageNumber - 1, 10, Direction.ASC, "id");
    return brandRepository.findAll(pageable);
  }

  // 用productsId，去取得這些product的Set
  private Set<Product> checkedProductSet(ActivityDto dto) {
    Set<Product> productSet = new LinkedHashSet<>();

    //如果使用者有勾選，此活動的商品
    if (dto.getProductId() != null) {
      for (Integer productId : dto.getProductId()) {
        Optional<Product> productResult = productRepository.findById(productId);
        if (productResult.isPresent()) {
          productSet.add(productResult.get());
        } // end of 2nd if()
      } // end of product forEach()
    } // end of 1st if()
    return productSet;
  }

  // 檢查是否有傳入圖片，有的話就上傳圖片至imgur
  private Set<ImgurImg> doUploadImg(Map<String, byte[]> map, Activity activity) throws IOException {
    Set<ImgurImg> imgs = null;
    //如果使用者有上傳圖片的話
    if (map != null) {
      imgs = new LinkedHashSet<>();
      for (String fileName : map.keySet()) {
        ImgurImg img = imgurUtil.uploadImg(fileName, map.get(fileName));
        // 圖片關聯活動
        img.setFkActivity(activity);
        imgs.add(img);
      } // end of img for()
    } // end of img if()
    return imgs;
  }


}
