package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Service.ActivityService;
import com.eeit40.design.Service.BrandService;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
public class ActivityRestController {

  @Autowired
  private ActivityService service;

  @Autowired
  private BrandService brandService;

  @Autowired
  private ObjectMapper objectMapper;

  // 暫未使用
  @GetMapping("/B/Activity/findAllApi")
  public Map<String, List<Activity>> findAllAjax() {
    List<Activity> result = service.findAll();
    for (Activity activity : result) {
      log.info("Activity ID:"+activity.getId());
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
    // SamWang To-Do: 產品未處理
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
    // SamWang To-Do: 產品未處理
    Activity result = service.updateActivity(service.setImg(file, dto));

    if (result != null) {
      return "Update Success!";
    }
    return "Update Fail!";
  }

  @GetMapping("/B/Activity/getBrandsPage")
  public Page<Brand> findBrandByPage(
      @RequestParam(name = "page", defaultValue = "1") String page) {

    return brandService.findAllByPage(Integer.valueOf(page));
  }


}
