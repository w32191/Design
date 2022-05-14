package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.ActivityProductDao;
import com.eeit40.design.Dao.ActivityRepository;
import com.eeit40.design.Dao.BrandRepository;
import com.eeit40.design.Dao.ImgurImgRepository;
import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Dto.EventDto;
import com.eeit40.design.Dto.ProductAndDiscount;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.ImgurImg;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Entity.ShoppingCard;
import com.eeit40.design.Service.ActivityService;
import com.eeit40.design.Util.ImgurUtil;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import org.springframework.data.domain.Sort;
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
  private ImgurImgRepository imgurImgRepository;

  @Autowired
  private ActivityProductDao activityProductDao;

  //設定顯示顏色
  private final String[] colors = {"#0080FF","#df1317","#e4934b","#e2bb8b","#91bcc6","#07abcc","#194645","#001871","#ff585d","#ffb549","#41b6e6"};

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
  public List<EventDto> findAllEvent() {
    List<Activity> result = activityRepository.findAll();
    List<EventDto> eventDtoList = new ArrayList<>();

    int a = 0;
    for (Activity ac : result) {
      EventDto dto = new EventDto(ac.getId(), ac.getSubject(), ac.getStartDate(), ac.getEndDate());

      if (a == 10) {
        dto.setBackgroundColor(colors[a]);
        a = 0;
      } else {
        dto.setBackgroundColor(colors[a]);
        a++;
      }

      eventDtoList.add(dto);
    }
    return eventDtoList;
  }

  @Override
  public Page<Activity> findByPage(Integer pageNumber) {
    Pageable page = PageRequest.of(pageNumber - 1, 5, Direction.DESC, "id");
    return activityRepository.findAll(page);
  }

  @Override
  public List<Activity> findActivitiesNow() {
    return activityRepository.findActivitiesCurrentTime();
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
    activity.setDiscountPercentage(dto.getDiscountPercentage());
    Set<ImgurImg> imgs = doUploadImg(dto.getInsertImg(), activity);

    //    如果有上傳照片
    if (imgs != null && activity.getImgurImgs().size() > 0) {
      imgurUtil.delete(imgurImgRepository.findDeleteHashById(activity.getId()));
      imgurImgRepository.deleteImgurImgByFkActivity(activity.getId());
    }

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

  // 找全部的品牌
  @Override
  public List<Brand> getAllBrands() {
    return brandRepository.findAll();
  }

  // 找分頁過後的品牌
  @Override
  public Page<Brand> findAllBrandByPage(Integer pageNumber) {
    Pageable pageable = PageRequest.of(pageNumber - 1, 10, Direction.ASC, "id");
    return brandRepository.findAll(pageable);
  }

  // 找品牌的全部產品
  @Override
  public List<Product> findProductByFkBrand(Brand brand) {
    return productRepository.findProductByFkBrand(brand);
  }

  // 找現在時間，活動中的產品
  @Override
  public List<Product> findProductsWithCurrentActivity() {
    // 先找到現在時間正在進行活動
    List<Activity> activitiesNowList = findActivitiesNow();

    List<Product> productList = new ArrayList<>();

    for (Activity activity : activitiesNowList) {
      if (activity.getProducts() != null) {
        productList.addAll(activity.getProducts());
      }
    }
    return productList;
  }


  // 檢查現在要加入活動的商品，活動時間是否與其他活動衝突
  @Override
  public Map<String, String> ableCheckProduct(
      LocalDate startDate, LocalDate endDate,
      Integer productId, Integer activityId
  ) {
    Map<String, String> resultMap = new HashMap<>();
    Product product = productRepository.findProductById(productId);
    Set<Activity> activities = product.getActivities();
    String resultStatus = "OK";
    String resultContent = "";

    if (!activities.isEmpty()) {
      // 該產品有勾選活動了
      log.info(productId + " 原本已有勾活動");

      for (Activity ac : activities) {

        log.info("正在比對的活動:" + ac.getId());
        log.info("原有的活動時間: " + ac.getStartDate() + " " + ac.getEndDate());
        log.info("新增的活動時間: " + startDate + " " + endDate);

        if (
            (startDate.isBefore(ac.getEndDate()) && startDate.isAfter(ac.getStartDate())) ||
                (startDate.isEqual(ac.getStartDate())) || (startDate.isEqual(ac.getEndDate())) ||
                (endDate.isAfter(ac.getStartDate()) && endDate.isBefore(ac.getEndDate())) ||
                (startDate.isBefore(ac.getStartDate()) && endDate.isAfter(ac.getEndDate()))

        ) {
          //
          if (!ac.getId().equals(activityId)) {
            // 新輸入的日期，只要起始日或結束日其中一天有重複，就不行
            log.info("與活動" + ac.getId() + " 時間衝突");
            resultStatus = "Conflict";

            resultContent = ac.getStartDate() + " " + ac.getEndDate();
            break;
          }

        }
        log.info("與活動" + ac.getId() + " 時間OK");
        resultContent = "與活動" + ac.getId() + " 時間OK";
      }  // end of for()


    }
    resultMap.put("status", resultStatus);
    resultMap.put("content", resultContent);
    return resultMap;
  }


  // 用product id取得現在此產品的折扣%
  // 給ajax呼叫的Controller用
  @Override
  public Map<String, Integer> getCurrentDiscountStringMap(Integer productId) {

    Product product = productRepository.findProductById(productId);
    // 選現在時間
    LocalDate now = LocalDate.now();
    // 預設折扣為0
    Integer discount = 0;

    Map<String, Integer> result = new LinkedHashMap<>();

    if (product != null) {

      for (Activity activity : product.getActivities()) {

        // 找到當日有活動的折扣
        if (
            (activity.getStartDate().isBefore(now) || activity.getStartDate().isEqual(now)) &&
                (activity.getEndDate().isEqual(now) || activity.getEndDate().isAfter(now))
        ) {
          discount = activity.getDiscountPercentage();
        } // end of if()
      } // end of for()
      result.put("productId", productId);
      result.put("discount", discount);
    }
    return result;
  }

  // 用product id 當Map 的 key
  // ModelAndView的Controller呼叫用
  @Override
  public Map<Integer, Integer> getCurrentDiscountIntegerMap(List<ShoppingCard> cart) {

    Map<Integer, Integer> resultMap = new LinkedHashMap<>();
    // 選現在時間
    LocalDate now = LocalDate.now();

    for (ShoppingCard shoppingCard : cart) {

      //  如果這個產品有活動
      if (shoppingCard.getFkProduct().getActivities() != null) {

        for (Activity activity : shoppingCard.getFkProduct().getActivities()) {
          // 遍歷所有活動，找看看是否現在的時間點
          if (
              (activity.getStartDate().isBefore(now) || activity.getStartDate().isEqual(now)) &&
                  (activity.getEndDate().isEqual(now) || activity.getEndDate().isAfter(now))
          ) {
            // 有找到現在的活動
            resultMap.put(shoppingCard.getFkProduct().getId(), activity.getDiscountPercentage());
          } // end of inner if()
        } // end of inner for()
      } // end of outer if()
    } // end of outer for()

    return resultMap;
  }


  // 幫傳入的List<Product>，找到當前discount後，return List<ProductAndDiscount>
  @Override
  public List<ProductAndDiscount> getProductsWithCurrentDiscount(List<Product> productList) {
    List<Map<Integer, Integer>> discountMapList = activityProductDao.getProductsWithCurrentDiscount();
    List<ProductAndDiscount> returnList = null;

    if (productList != null) {
      returnList = new ArrayList<>();

      for (Product product : productList) {
        ProductAndDiscount pad = new ProductAndDiscount(product);
        for (Map<Integer, Integer> map : discountMapList) {
          if (map.containsKey(product.getId())) {
            pad.setDiscountPercentage(map.get(product.getId()));
          }
        } //end of inner for()
        returnList.add(pad);
      } //end of outer for()
    }

    return returnList;
  }

  @Override
  public Activity getProductsWithCurrentDiscountByActivityId(Integer id) {
    return activityRepository.findActivitiesCurrentTime(id);
  }

  @Override
  public Page<Activity> findActivitiesByTimePaged(LocalDate startDate, LocalDate endDate,
      Integer pageNumber) {
    Pageable page = PageRequest.of(pageNumber - 1, 5, Sort.by("id").descending());
//    return activityRepository.findActivitiesByTime(startDate, endDate, page);
    return activityRepository.findActivitiesByStartDateBetweenAndEndDateBetween(startDate, endDate,
        startDate, endDate, page);
  }

  @Override
  public Page<Activity> findActivitiesByTimePaged(LocalDate startDate, LocalDate endDate,
      String subject,
      Integer pageNumber) {

    Pageable page = PageRequest.of(pageNumber - 1, 5, Sort.by("id").descending());
    return activityRepository.findActivitiesByStartDateBetweenAndEndDateBetweenAndSubjectContaining(
        startDate, endDate, startDate, endDate, subject, page);
  }

  @Override
  public List<String> findActivitiesSubBySubject(String subject) {
    List<Activity> list = activityRepository.findActivitiesBySubjectContaining(subject);
    List<String> result = new ArrayList<>(list.size());
    for (Activity activity : list) {
      result.add(activity.getSubject());
    }

    return result;
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
