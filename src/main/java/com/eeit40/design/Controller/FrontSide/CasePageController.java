package com.eeit40.design.Controller.FrontSide;


import com.eeit40.design.Dto.CaseQueryParams;
import com.eeit40.design.Entity.Case;
import com.eeit40.design.Service.CaseService;
import com.eeit40.design.Util.ImgurUtil;
import com.eeit40.design.Util.Page;
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
import org.springframework.web.servlet.ModelAndView;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.util.List;

@RestController
//@PropertySource("classpath:imgurConfigs.properties")
public class CasePageController {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

//    @Value("${AU_Kenny}")
//    private String authorization;

    @Autowired
    private ImgurUtil imgurUtil;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private CaseService caseService;


    @GetMapping("/F/Case")
    public ModelAndView index(ModelAndView mav) {
        mav.setViewName("F/Case/Case");
        return mav;
    }

    //使用@Max @Min 要加@Validated 才會真的生效
    @Validated
    @GetMapping("/F/Cases")
    public ResponseEntity<Page<Case>> getCases(

            //------查詢條件 Filtering------
            @RequestParam(required = false) String search,

            //------排序Sorting------
            //根據什麼欄位來排序
            @RequestParam(defaultValue = "date_time") String orderBy,
            //使用何種排序
            @RequestParam(defaultValue = "desc") String sort,

            //------分頁 Pagination------
            @RequestParam(defaultValue = "20") @Max(100) @Min(0) Integer fetchNext,
            @RequestParam(defaultValue = "0") @Min(0) Integer offset
    ) {

        CaseQueryParams caseQueryParams = new CaseQueryParams();
        caseQueryParams.setSearch(search);
        caseQueryParams.setOrderBy(orderBy);
        caseQueryParams.setSort(sort);
        caseQueryParams.setFetchNext(fetchNext);
        caseQueryParams.setOffset(offset);

        // 取得 case list
        List<Case> caseList = caseService.getCases(caseQueryParams);
        System.out.println("caseList:" + caseList);
        // 取得 case 總數
        Integer total = caseService.countCase(caseQueryParams);

        // 分頁
        Page<Case> page = new Page<>();
        page.setFetchNext(fetchNext);
        page.setOffset(offset);
        page.setTotal(total);
        page.setResults(caseList);

//        return ResponseEntity.status(HttpStatus.OK).body(caseList);
        return ResponseEntity.status(HttpStatus.OK).body(page);
//        return "/B/Case/Case";

    }

    @GetMapping("/F/Case/{id}")
    public ResponseEntity<List<Case>> getCase(@PathVariable Integer id) {
        List<Case> aCase = caseService.getCaseById(id);
        if (aCase != null) {
            return ResponseEntity.status(HttpStatus.OK).body(aCase);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }


//    @GetMapping("/F/Case")
//    public ModelAndView casePage(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
//        Page<Case> page = caseService.findByPage(pageNumber);
//        mav.getModel().put("page", page);
//
//        List<Case> latestCase = caseService.findAllByOrderByDateTimeDesc();
//        mav.getModel().put("lastCase", latestCase);
//
//        mav.setViewName("/F/Case/Case");
//        return mav;
//    }
//    @GetMapping("/F/viewCase")
//    public String viewCase() {
//
//        return "/F/Case/viewCase";
//
//    }
//
//    @GetMapping("/F/api/postCaseMessageApi")
//    @ResponseBody
//    public List<Case> postCaseApi(@RequestBody CaseDto caseDto){
//        String text = caseDto.getTitleDto();
//
//        Case caseMsg = new Case();
//        caseMsg.setTitle(text);
//        caseService.insert(caseMsg);
//
//        Page<Case> page = caseService.findByPage(1);
//        List<Case> list = page.getContent();
//
//        return list;
//    }
//

}
