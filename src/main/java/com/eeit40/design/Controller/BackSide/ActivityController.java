package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Service.ActivityService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.List;
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
    List<ActivityDto> list = service.findAllDto();

    modelAndView.addObject("activities", list);
    modelAndView.setViewName("/B/Activity/Activity");
    return modelAndView;
  }

  @GetMapping("/B/Activity/findAllList")
  @ResponseBody
  public String findAllList() throws JsonProcessingException {
    ObjectMapper mapper = objectMapperBuilder.build();
    List<Activity> result = service.findAll();
    for (Activity activity : result) {
      for (Product product : activity.getProducts()) {
        entityManager.detach(product);
      }
      log.info(activity.getStartDate().toString());
    }

    return mapper.writeValueAsString(result);
  }


  @GetMapping("/B/Activity/deleteApi/{id}")
  @ResponseBody
  public String deleteById(@PathVariable Integer id) {
    if (service.deleteByID(id)) {
      return "DeleteSuccess";
    }
    return "DeleteFail";
  }


  @PostMapping(value = "/B/Activity/insertActivity")
  @ResponseBody
  public Activity insertActivity(
//      @RequestParam("file") MultipartFile file,
      @RequestParam("data") String dataJsonStr) throws IOException {

    ObjectMapper objectMapper = new ObjectMapper();
    Activity activity = objectMapper.readValue(dataJsonStr, Activity.class);
//    service.insertActivity(dto, file);

    log.info(activity.toString());
    return activity;
  }
}
