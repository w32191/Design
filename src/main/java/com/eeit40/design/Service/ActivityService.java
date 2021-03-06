package com.eeit40.design.Service;

import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Dto.EventDto;
import com.eeit40.design.Dto.ProductAndDiscount;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Entity.ShoppingCard;
import java.io.IOException;
import java.net.MalformedURLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

public interface ActivityService {


  List<Activity> findAll();

  List<EventDto> findAllEvent();

  Page<Activity> findByPage(Integer pageNumber);

  boolean deleteByID(int id);

  List<Activity> findActivitiesNow();

  Activity findById(Integer id);

  Activity insertActivity(ActivityDto dto) throws IOException;

  Activity updateActivity(ActivityDto dto) throws IOException;


  // Dto 將前端傳來的MultipartFile file轉換
  ActivityDto setImg(MultipartFile file, ActivityDto dto) throws IOException;

  List<Brand> getAllBrands();

  Page<Brand> findAllBrandByPage(Integer pageNumber);

  List<Product> findProductByFkBrand(Brand id);


  List<Product> findProductsWithCurrentActivity();

  Map<String, String> ableCheckProduct(
      LocalDate startDate, LocalDate endDate,
      Integer productId, Integer activityId
  );

  Map<String, Integer> getCurrentDiscountStringMap(Integer productId);


  // 用product id 當Map 的 key
  Map<Integer, Integer> getCurrentDiscountIntegerMap(List<ShoppingCard> cart);

  List<ProductAndDiscount> getProductsWithCurrentDiscount(List<Product> productList);

  Activity getProductsWithCurrentDiscountByActivityId(Integer id);

  Page<Activity> findActivitiesByTimePaged(LocalDate startDate, LocalDate endDate,
      String sortStr, Integer pageNumber,boolean asc);

  Page<Activity> findActivitiesByTimePaged(LocalDate startDate, LocalDate endDate,
      String subject, String sortStr, Integer pageNumber,boolean asc);


  List<String> findActivitiesSubBySubject(String subject);
}
