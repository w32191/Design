package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dto.ActivityDto;
import com.eeit40.design.Entity.ImgurImg;
import com.eeit40.design.Service.ActivityService;
import com.eeit40.design.util.ImgurUtil;

import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ActivityController {

  @Autowired
  private ActivityService service;

  @Autowired
  private ImgurUtil imgurUtil;

  @GetMapping("/B/Activity/findAll")
  public ModelAndView findAll(ModelAndView modelAndView) {
    List<ActivityDto> list = service.findAllDto();

    modelAndView.addObject("activities", list);
    modelAndView.setViewName("/B/Activity/Activity");
    return modelAndView;
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
  public ImgurImg insertActivity(@RequestParam("file") MultipartFile file
      ) throws IOException {

    return imgurUtil.uploadImg(file);
  }
}
