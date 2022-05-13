package com.eeit40.design.Controller.FrontSide;


import com.eeit40.design.Dto.DesignDto;
import com.eeit40.design.Dto.DesignQueryParams;
import com.eeit40.design.Entity.Account;
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

import javax.servlet.http.HttpSession;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.io.IOException;
import java.util.List;

@RestController
@PropertySource("classpath:imgurConfigs.properties")
public class FrontDesignController {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Value("${AU_Kenny}")
    private String authorization;

    @Autowired
    private ImgurUtil imgurUtil;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private DesignService designService;

    @GetMapping("/F/Design")
    public ModelAndView getDesigns(ModelAndView modelAndView, HttpSession session) {
        Account account = (Account) session.getAttribute("Faccount");
        modelAndView.addObject("account", account);

        DesignQueryParams designQueryParams = new DesignQueryParams();
        designQueryParams.setOrderBy("create_time");
        designQueryParams.setSort("desc");
        designQueryParams.setFetchNext(11);
        designQueryParams.setOffset(0);

        List<Design> designStyleList = designService.getDesigns(designQueryParams);


        modelAndView.addObject("DesignStyleList",designStyleList);
        modelAndView.setViewName("/F/DesignService/DesignService");
        return modelAndView;
    }

    @GetMapping("/F/addDesignService")
    public ModelAndView addDesignService(ModelAndView modelAndView) {
        modelAndView.setViewName("/F/DesignService/AddDesignService");
        return modelAndView;
    }

    @GetMapping("/F/editDesignService/{id}")
    public ModelAndView editDesignService(ModelAndView modelAndView, @PathVariable Integer id) {
        Design design = designService.getDesignById(id);
        modelAndView.addObject("Design", design);
        modelAndView.setViewName("/F/DesignService/EditDesignService");
        return modelAndView;
    }

    @GetMapping("/F/viewDesignService/{id}")
    public ModelAndView viewDesignService(ModelAndView modelAndView, @PathVariable Integer id, HttpSession session) {
        Design design = designService.getDesignById(id);
        Account account = (Account) session.getAttribute("Faccount");
        if (account != null) {
            modelAndView.addObject("memberId", account.getMembers().getId());
        } else {
            modelAndView.addObject("memberId", -1);
        }
        String[] styleList = new String[]{
                "所有風格",
                "現代風格",
                "工業風格",
                "北歐風格",
                "鄉村風格",
                "地中海風",
                "古典風格",
                "奢華風格",
                "美式風格",
                "日式風格",
                "中式風格",
                "其他風格"};

        DesignQueryParams designQueryParams = new DesignQueryParams();
        designQueryParams.setSearch(design.getStyle());
        designQueryParams.setOrderBy("create_time");
        designQueryParams.setSort("desc");
        designQueryParams.setFetchNext(10);
        designQueryParams.setOffset(0);

        List<Design> designStyleList = designService.getDesigns(designQueryParams);
        List<Design> designList = designService.getDesignByMemberId(design.getFkMember().getId());
        modelAndView.addObject("DesignList", designList);
        modelAndView.addObject("StyleList",styleList);
        modelAndView.addObject("Design", design);
        modelAndView.addObject("DesignStyleList", designStyleList);

        modelAndView.setViewName("/F/DesignService/ViewDesignService");
        return modelAndView;
    }

    @Validated
    @GetMapping("/F/Designs")
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
    ) {
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


    @GetMapping("F/getDesign/{id}")
    public ResponseEntity<Design> getDesign(@PathVariable Integer id) {
        Design design = designService.getDesignById(id);

        if (design != null) {
            return ResponseEntity.status(HttpStatus.OK).body(design);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("F/getDesignByMember/{fk_member_id}")
    public ResponseEntity<List<Design>> getDesignByMemberId(@PathVariable Integer fk_member_id) {
        List<Design> design = designService.getDesignByMemberId(fk_member_id);

        if (design != null) {
            return ResponseEntity.status(HttpStatus.OK).body(design);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @PostMapping("F/createDesign")
    public ResponseEntity<Design> createDesign(@RequestParam("data") String jsonStr, HttpSession session) throws JsonProcessingException {

        log.info(jsonStr);
        DesignDto designDto = mapper.readValue(jsonStr, DesignDto.class);

        // 取當前帳號資料
        Account account = (Account) session.getAttribute("Faccount");
        if (account != null) {
            designDto.setFk_member_id(account.getMembers().getId());
        }

        Integer id = designService.createDesign(designDto);


        Design design = designService.getDesignById(id);

        return ResponseEntity.status(HttpStatus.CREATED).body(design);
    }

    @DeleteMapping("F/deleteDesign/{id}")
    public ResponseEntity<?> deleteDesign(@PathVariable Integer id) {
        designService.deleteDesign(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @PostMapping("F/updateDesign/{id}")
    public ResponseEntity<Design> updateDesign(@PathVariable Integer id,
                                               @RequestParam("data") String jsonStr,
                                               @RequestParam(name = "file", required = false) MultipartFile multipartFile) throws JsonProcessingException {

        DesignDto designDto = mapper.readValue(jsonStr, DesignDto.class);
        designService.updateDesign(id, designDto);

        Design design = designService.getDesignById(id);

        if (design == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        designService.updateDesign(id, designDto);
        Design updateDesign = designService.getDesignById(id);
        return ResponseEntity.status(HttpStatus.OK).body(updateDesign);
    }

    ;


    //------新增照片開始------
    @PostMapping("F/uploadImg")
    public String uploadImg(@RequestParam("file") MultipartFile multipartFile) throws IOException {

        imgurUtil.setAuthorization(authorization);
        ImgurImg img = imgurUtil.uploadImg(multipartFile.getOriginalFilename(), multipartFile.getBytes());

        return img.getLink();
    }
    //------新增照片結束------


}
