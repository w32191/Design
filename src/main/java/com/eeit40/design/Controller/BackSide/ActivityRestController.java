package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Exception.ActivityException;
import com.eeit40.design.Exception.NullInputException;
import com.eeit40.design.Service.ActivityService;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@Slf4j
public class ActivityRestController { // 給前端Ajax提供JSON 資料的RestController

  @Autowired
  private ActivityService service;

  @Autowired
  private ObjectMapper objectMapper;

  // 暫未使用
  @GetMapping("/B/Activity/findAllApi")
  public Map<String, List<Activity>> findAllAjax() {
    List<Activity> result = service.findAll();
    for (Activity activity : result) {
      log.info("Activity ID:" + activity.getId());
    }

    Map<String, List<Activity>> map = new HashMap<>();
    map.put("data", result);
    return map;
  }


  @DeleteMapping("/B/Activity/delete/{id}")
  public String deleteById(@PathVariable Integer id) {
    if (service.deleteByID(id)) {
      return "DeleteSuccess";
    }
    return "DeleteFail";
  }

  @PutMapping("/B/Activity/insertActivity")
  public String insertActivity(
      @RequestParam(name = "file", required = false) MultipartFile file,
      @RequestParam("data") String dataJsonStr) throws IOException {

    log.info("Insert Json:" + dataJsonStr);
    ActivityDto dto = objectMapper.readValue(dataJsonStr, ActivityDto.class);
    Activity insertResult = service.insertActivity(service.setImg(file, dto));

    if (insertResult != null) {
      return "Insert Success!";
    }
    return "Insert Fail!";
  }

  @PostMapping("/B/Activity/updateActivity")
  public String updateActivity(
      @RequestParam(name = "file", required = false) MultipartFile file,
      @RequestParam("data") String dataJsonStr
  ) throws IOException {

    log.info("Update Json:" + dataJsonStr);
    ActivityDto dto = objectMapper.readValue(dataJsonStr, ActivityDto.class);
    Activity result = service.updateActivity(service.setImg(file, dto));

    if (result != null) {
      return "Update Success!";
    }
    return "Update Fail!";
  }

  @GetMapping("/B/Activity/getBrandsPage")
  public Page<Brand> findBrandByPage(
      @RequestParam(name = "page", defaultValue = "1") String page) {
    return service.findAllBrandByPage(Integer.valueOf(page));
  }

  @GetMapping("/B/Activity/findAlreadyCheckedProductId/{activityId}")
  public List<Integer> findAlreadyCheckedProductId(@PathVariable("activityId") Integer id) {
    Activity editActivity = service.findById(id);
    List<Integer> checkedProductId = new ArrayList<>();
    if (editActivity == null) {
      return checkedProductId;
    }
    // 如果原本產品已經有勾選折扣商品
    if (!editActivity.getProducts().isEmpty()) {
      // 取得原本已經有勾選的品牌id
      for (Product product : editActivity.getProducts()) {
        checkedProductId.add(product.getId());
      }
    }
    return checkedProductId;
  }

  // 取得該品牌的全部產品
  @PostMapping(value = "/B/Activity/findProductByBrand")
  public List<Product> findProductByBrand(
      @RequestParam(name = "brandId") Integer brandId) {
    Brand brand = new Brand();
    brand.setId(brandId);

    return service.findProductByFkBrand(brand);
  }

  // 勾選產品時，檢查是否與其他日期衝突
  @PostMapping("/B/Activity/checkProductAbleCheck")
  public ResponseEntity<String> checkProductAbleCheck(
      @RequestParam(name = "startDate") String startDateStr,
      @RequestParam(name = "endDate") String endDateStr,
      @RequestParam(name = "activityID") Integer activityId,
      @RequestParam(name = "productID") Integer productId
  ) {
    if ((startDateStr == null || startDateStr.length() == 0) && (endDateStr == null
        || endDateStr.length() == 0)) {
      throw new NullInputException("請輸入開始日期、結束日期");
    } else if (startDateStr == null || startDateStr.length() == 0) {
      throw new NullInputException("請輸入開始日期");
    } else if (endDateStr == null || endDateStr.length() == 0) {
      throw new NullInputException("請輸入結束日期");
    }
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate startDate = LocalDate.parse(startDateStr, formatter);
    LocalDate endDate = LocalDate.parse(endDateStr, formatter);

    Map<String, String> map = service.ableCheckProduct(startDate, endDate, productId, activityId);
    ResponseEntity<String> result;

    if (map.get("status").equals("OK")) {
      result = new ResponseEntity<>(HttpStatus.OK);
    } else {
      result = new ResponseEntity<>(map.get("content"), HttpStatus.BAD_REQUEST);
    }

    return result;
  }


}
