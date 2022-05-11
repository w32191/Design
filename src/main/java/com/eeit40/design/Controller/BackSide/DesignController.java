package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dto.DesignDto;
import com.eeit40.design.Dto.DesignQueryParams;
import com.eeit40.design.Entity.Design;
import com.eeit40.design.Entity.ImgurImg;
import com.eeit40.design.Service.DesignService;
import com.eeit40.design.Util.ImgurUtil;
import com.eeit40.design.Util.Page;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.io.IOException;
import java.util.List;

@RestController
@PropertySource("classpath:imgurConfigs.properties")
public class DesignController {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Value("${AU_Kenny}")
    private String authorization;

    @Autowired
    private ImgurUtil imgurUtil;

    @Autowired
    private DesignService designService;

    @Autowired
    private  ObjectMapper mapper;

    @GetMapping("/B/Design")
    public ModelAndView index(ModelAndView mav){
        mav.setViewName("/B/DesignService/DesignService");
        return mav;
    }


    @Validated
    @GetMapping("/B/Designs")
    public ResponseEntity<Page<Design>> getDesigns(

            //------查詢條件 Filtering------
//            @RequestParam(required = false) CaseCaregory category,
            @RequestParam(required = false) String search,

            //------排序Sorting------
            //根據什麼欄位來排序
            @RequestParam(defaultValue = "create_time") String orderBy,
            //使用何種排序
            @RequestParam(defaultValue = "desc") String sort,

            //------分頁 Pagination------
            @RequestParam(defaultValue = "10") @Max(100) @Min(0) Integer fetchNext,
            @RequestParam(defaultValue = "0") @Min(0) Integer offset
    ){
        DesignQueryParams designQueryParams = new DesignQueryParams();
        designQueryParams.setSearch(search);
        designQueryParams.setOrderBy(orderBy);
        designQueryParams.setSort(sort);
        designQueryParams.setFetchNext(fetchNext);
        designQueryParams.setOffset(offset);

        List<Design> designList = designService.getDesigns(designQueryParams);

        Integer total = designService.countDesign(designQueryParams);

        Page<Design> page = new Page<>();
        page.setFetchNext(fetchNext);
        page.setOffset(offset);
        page.setTotal(total);
        page.setResults(designList);

        return ResponseEntity.status(HttpStatus.OK).body(page);
    }


    @GetMapping("B/getDesign/{id}")
    public ResponseEntity<Design> getDesign(@PathVariable Integer id){
        Design design = designService.getDesignById(id);

        if(design != null){
            return ResponseEntity.status(HttpStatus.OK).body(design);
        }else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("B/getDesignByMember/{fk_member_id}")
    public ResponseEntity<List<Design>> getDesignByMemberId(@PathVariable Integer fk_member_id) {
        List<Design> design = designService.getDesignByMemberId(fk_member_id);
//        System.out.println(design);
        if (design != null) {
            return ResponseEntity.status(HttpStatus.OK).body(design);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }


    @PostMapping("B/createDesign")
    public ResponseEntity<Design> createDesign(@RequestParam("data") String jsonStr) throws JsonProcessingException {

        log.info(jsonStr);
        DesignDto designDto = mapper.readValue(jsonStr, DesignDto.class);
        Integer id = designService.createDesign(designDto);

        Design design = designService.getDesignById(id);

        return ResponseEntity.status(HttpStatus.CREATED).body(design);
    }

    @DeleteMapping("B/deleteDesign/{id}")
    public ResponseEntity<?> deleteDesign(@PathVariable Integer id){
        designService.deleteDesign(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @PostMapping("B/updateDesign/{id}")
    public ResponseEntity<Design> updateDesign(@PathVariable Integer id,
                                               @RequestParam("data") String jsonStr,
                                               @RequestParam(name = "file", required = false) MultipartFile multipartFile) throws JsonProcessingException {

        DesignDto designDto = mapper.readValue(jsonStr, DesignDto.class);
        designService.updateDesign(id, designDto);

        Design design = designService.getDesignById(id);

        if(design == null){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        designService.updateDesign(id, designDto);
        Design updateDesign = designService.getDesignById(id);
        return ResponseEntity.status(HttpStatus.OK).body(updateDesign);
    };



    //------新增照片開始------
    @PostMapping("B/uploadImg")
    public String uploadImg(@RequestParam("file") MultipartFile multipartFile) throws IOException {

        imgurUtil.setAuthorization(authorization);
        ImgurImg img = imgurUtil.uploadImg(multipartFile.getOriginalFilename(), multipartFile.getBytes());

        return  img.getLink();
    }
    //------新增照片結束------



}
