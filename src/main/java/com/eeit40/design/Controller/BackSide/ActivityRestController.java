package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Dto.EventDto;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.Product;
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

  // fullcalendar 用events
  @GetMapping("/B/Activity/findAllEventApi")
  public List<EventDto> findEvents() {
    return service.findAllEvent();
  }

  @DeleteMapping("/B/Activity/delete/{id}")
  public String deleteById(@PathVariable Integer id) {
    if (service.deleteByID(id)) {
      return "DeleteSuccess";
    }
    return "DeleteFail";
  }

  @DeleteMapping("/B/Activity/deleteBatch")
  public String deleteBatch(@RequestParam("dataArray") List<Integer> idList) {
    log.info(idList.toString());
    for (Integer integer : idList) {
      service.deleteByID(integer);
    }
    return "DeleteSuccess";
  }


  @PutMapping("/B/Activity/insertActivity")
  public ResponseEntity<String> insertActivity(
      @RequestParam(name = "file", required = false) MultipartFile file,
      @RequestParam("data") String dataJsonStr) throws IOException {

    log.info("Insert Json:" + dataJsonStr);
    ActivityDto dto = objectMapper.readValue(dataJsonStr, ActivityDto.class);
    ResponseEntity<String> check = checkInputData(dto);
    if (check.getStatusCodeValue() != 200) {
      return check;
    }
    Activity insertResult = service.insertActivity(service.setImg(file, dto));

    if (insertResult != null) {
      return new ResponseEntity<>(HttpStatus.OK);
    }
    return new ResponseEntity<>("新增時發生錯誤！", HttpStatus.INTERNAL_SERVER_ERROR);
  }

  @PostMapping("/B/Activity/updateActivity")
  public ResponseEntity<String> updateActivity(
      @RequestParam(name = "file", required = false) MultipartFile file,
      @RequestParam("data") String dataJsonStr
  ) throws IOException {

    log.info("Update Json:" + dataJsonStr);
    ActivityDto dto = objectMapper.readValue(dataJsonStr, ActivityDto.class);
    ResponseEntity<String> check = checkInputData(dto);
    if (check.getStatusCodeValue() != 200) {
      return check;
    }

    Activity result = service.updateActivity(service.setImg(file, dto));
    System.out.println(new ResponseEntity<>(HttpStatus.OK).getStatusCode().value());

    if (result != null) {
      return new ResponseEntity<>(HttpStatus.OK);
    }
    return new ResponseEntity<>("更新時發生錯誤！", HttpStatus.INTERNAL_SERVER_ERROR);
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


  // 用時間名字搜尋 並分頁
  @PostMapping("/B/Activity/searchByTime")
  public Page<Activity> searchByTimeOrSubject(
      @RequestParam(value = "start", defaultValue = "2000-01-01") String start,
      @RequestParam(value = "end", defaultValue = "2100-12-30") String end,
      @RequestParam(value = "subject", required = false) String subject,
      @RequestParam(value = "sortBy", defaultValue = "startDate") String sortStr,
      @RequestParam(value = "order", defaultValue = "asc") String order,
      @RequestParam(value = "page", defaultValue = "1") Integer pageNumber) {

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate startDate = LocalDate.parse(start, formatter);
    LocalDate endDate = LocalDate.parse(end, formatter);
    boolean orderBy;
    if (order.equals("asc")) {
      orderBy = true;
    } else {
      orderBy = false;
    }

    if (subject == null) {
      return service.findActivitiesByTimePaged(startDate, endDate, sortStr, pageNumber, orderBy);
    } else {
      return service.findActivitiesByTimePaged(startDate, endDate, subject, sortStr, pageNumber,
          orderBy);
    }
  }


  // 取得名字
  @GetMapping("/B/Activity/searchBySubject/{subject}")
  public List<String> getSubject(@PathVariable String subject) {
    return service.findActivitiesSubBySubject(subject);
  }


  // 檢查新增、更新時輸入的資料是否完善
  private ResponseEntity<String> checkInputData(ActivityDto dto) {
    LocalDate now = LocalDate.now();
    System.out.println(dto);
    if (dto.getSubject().length() < 2) {
      return new ResponseEntity<>("請輸入 活動主題！", HttpStatus.BAD_REQUEST);
    } else if (dto.getDiscountPercentage() == null) {
      return new ResponseEntity<>("請輸入 折扣％！", HttpStatus.BAD_REQUEST);
    } else if (dto.getStartDate() == null) {
      return new ResponseEntity<>("請輸入 開始日期！", HttpStatus.BAD_REQUEST);
    } else if (dto.getStartDate().isBefore(now)) {
      return new ResponseEntity<>("開始日期 不可早於 今日！", HttpStatus.BAD_REQUEST);
    } else if (dto.getEndDate() == null) {
      return new ResponseEntity<>("請輸入 結束日期！", HttpStatus.BAD_REQUEST);
    } else if (dto.getStartDate().isAfter(dto.getEndDate())) {
      return new ResponseEntity<>("開始日期 不可晚於 結束日期！", HttpStatus.BAD_REQUEST);
    } else {
      return new ResponseEntity<>(HttpStatus.OK);
    }
  }

}
