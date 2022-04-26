package com.eeit40.design.Controller.BackSide;
import com.eeit40.design.Dto.AnnouncementDto;
import com.eeit40.design.Entity.Announcement;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Service.AnnouncementService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

//@Controller
public class AnnouncementController<publicAnnouncement> {

  private final Logger log = LoggerFactory.getLogger(this.getClass());

//  @Autowired
  private AnnouncementService service;

  @Autowired
  private EntityManager entityManager;

  @Autowired
  private Jackson2ObjectMapperBuilder objectMapperBuilder;


  @GetMapping("/B/Announcement/findAll")
  public ModelAndView findAll(ModelAndView modelAndView) {
    List<Announcement> list = service.findAll();
    modelAndView.addObject("announcement", list);
    modelAndView.setViewName("/B/Announcement/Announcement");
    return modelAndView;
  }


  // 暫未使用
  @GetMapping("/B/Announcement/findAllAjax")
  @ResponseBody
  public String findAllAjax() throws JsonProcessingException {
    ObjectMapper mapper = objectMapperBuilder.build();
//   ObjectMapper mapper = new ObjectMapper();
    List<Announcement> result = service.findAll();

    for (Announcement announcement : result) {

    }
    Map<String, List<Announcement>> map = new HashMap<>();
    map.put("data", result);
    return mapper.writeValueAsString(map);
  }

  @GetMapping("/B/Announcement/delete/{id}")
  public ModelAndView deleteByIdView(ModelAndView mav, @PathVariable("id") Integer id)
      throws MalformedURLException {
    if (service.deleteByID(id)) {
      mav.addObject("result","Success");

    }
    mav.setViewName("/B/Announcement/Result");
    return mav;
  }


  @GetMapping("/B/Announcement/deleteApi/{id}")
  @ResponseBody
  public String deleteById(@PathVariable Integer id){
    if (service.deleteByID(id)) {
      return "DeleteSuccess";
    }
    return "DeleteFail";
  }

  @PostMapping(value = "/B/Announcement/insertAnnouncement")
  @ResponseBody
  Announcement insertAnnouncementy(
      @RequestParam(name = "file", required = false) MultipartFile file,
      @RequestParam("data") String dataJsonStr) throws IOException {

    System.out.println(dataJsonStr);
    ObjectMapper objectMapper = objectMapperBuilder.build();
    AnnouncementDto dto = objectMapper.readValue(dataJsonStr, AnnouncementDto.class);
    Map<String, byte[]> imgs;


    return service.insertAnnouncement(dto);
//    return service.insertActivity(activity, file);
  }


}
