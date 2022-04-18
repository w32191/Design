package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Service.ActivityService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Slf4j
public class ActivityController {

  @Autowired
  private ActivityService service;

  @Autowired
  private EntityManager entityManager;

  @Autowired
  private Jackson2ObjectMapperBuilder objectMapperBuilder;


  @GetMapping("/B/Activity/findAll")
  public ModelAndView findAll(ModelAndView modelAndView) {
    List<Activity> list = service.findAll();
    modelAndView.addObject("activities", list);
    modelAndView.setViewName("/B/Activity/Activity");
    return modelAndView;
  }

  @GetMapping("/B/Activity/findAllAjax")
  @ResponseBody
  public String findAllAjax() throws JsonProcessingException {
    ObjectMapper mapper = objectMapperBuilder.build();
    List<Activity> result = service.findAll();
    for (Activity activity : result) {
      for (Product product : activity.getProducts()) {
        entityManager.detach(product);
      }
    }
    Map<String, List<Activity>> map = new HashMap<>();
    map.put("data", result);
    return mapper.writeValueAsString(map);
  }

  @GetMapping("/B/Activity/deleteApi/{id}")
  @ResponseBody
  public String deleteById(@PathVariable Integer id) throws MalformedURLException {
    if (service.deleteByID(id)) {
      return "DeleteSuccess";
    }
    return "DeleteFail";
  }

  @PostMapping(value = "/B/Activity/insertActivity")
  @ResponseBody
  public Activity insertActivity(
      @RequestParam(name = "file", required = false) MultipartFile file,
      @RequestParam("data") String dataJsonStr) throws IOException {

    System.out.println(dataJsonStr);
    ObjectMapper objectMapper = objectMapperBuilder.build();
    ActivityDto dto = objectMapper.readValue(dataJsonStr, ActivityDto.class);
    Map<String, byte[]> imgs;

    //  若前端有傳MultipartFile來
    if (file != null) {
      imgs = new HashMap<String, byte[]>();
      imgs.put(file.getOriginalFilename(), file.getBytes());
      dto.setImgs(imgs);
    }

    return service.insertActivity(dto);
//    return service.insertActivity(activity, file);
  }


}
