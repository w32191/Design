package com.eeit40.design.Controller.FrontSide;


import com.eeit40.design.Dto.CaseDto;
import com.eeit40.design.Dto.CaseQueryParams;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.Case;
import com.eeit40.design.Entity.ImgurImg;
import com.eeit40.design.Service.CaseService;
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
public class CasePageController {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Value("${AU_Kenny}")
    private String authorization;

//    @Value("${AU_Kenny}")
//    private String authorization;

    @Autowired
    private ImgurUtil imgurUtil;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private CaseService caseService;

    @PostMapping("/F/updatedCase/{id}")
    public ResponseEntity<Case> updatedCase(@PathVariable Integer id,
                                            @RequestParam("data") String jsonStr,
                                            @RequestParam(name = "file", required = false) MultipartFile multipartFile) throws JsonProcessingException {

        log.info(jsonStr);
        CaseDto caseDto = mapper.readValue(jsonStr, CaseDto.class);
        caseService.updatedCase(id, caseDto);
//        System.out.println(caseDto.getList());
        //判定商品 id 是否存在
        Case aCase = caseService.getCaseById(id);

        if (aCase == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        //修改商品的數據
        caseService.updatedCase(id, caseDto);
        Case updatedCase = caseService.getCaseById(id);
        return ResponseEntity.status(HttpStatus.OK).body(updatedCase);
    }


    @GetMapping("/F/Case")
    public ModelAndView index(ModelAndView mav, HttpSession session) {
        Account account = (Account) session.getAttribute("Faccount");
        mav.addObject("account", account);
        mav.setViewName("F/Case/Case");
        return mav;
    }

    @GetMapping("/F/EditCase/{id}")
    public ModelAndView editCase(ModelAndView modelAndView, @PathVariable Integer id) {
        Case aCase = caseService.getCaseById(id);
        modelAndView.addObject("Case", aCase);
        modelAndView.setViewName("/F/Case/EditCase");
        return modelAndView;
    }

    @GetMapping("/F/ViewCase/{id}")
    public ModelAndView viewCase(ModelAndView mav,
                                 @PathVariable Integer id,
                                 HttpSession session) {
        Case aCase = caseService.getCaseById(id);
        Account account = (Account) session.getAttribute("Faccount");
        if (account != null) {
            mav.addObject("memberId", account.getMembers().getId());
        } else {
            mav.addObject("memberId", -1);
        }
        mav.addObject("aCase", aCase);
        mav.setViewName("F/Case/ViewCase");
        return mav;
    }

    @PostMapping("/F/Case/createCase")
    //@Valid DTO有@NOTNULL的註解時要加
    public ResponseEntity<Case> createCase(@RequestParam("data") String jsonStr, HttpSession session) throws JsonProcessingException {
        log.info(jsonStr);

        Account account = (Account) session.getAttribute("Faccount");


        CaseDto caseDto = mapper.readValue(jsonStr, CaseDto.class);
        caseDto.setFk_member_id(account.getMembers().getId());
        Integer id = caseService.createCase(caseDto);

        Case acase = caseService.getCaseById(id);

        return ResponseEntity.status(HttpStatus.OK).body(acase);
    }

    @GetMapping("/F/UpdateCase")
    public ModelAndView UpdateCase(ModelAndView mav) {
        mav.setViewName("F/Case/UpdateCase");
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
            @RequestParam(defaultValue = "99") @Max(100) @Min(0) Integer fetchNext,
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
    public ResponseEntity<Case> getCase(@PathVariable Integer id) {
        Case aCase = caseService.getCaseById(id);
        if (aCase != null) {
            return ResponseEntity.status(HttpStatus.OK).body(aCase);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/F/CaseByMemberId/{fk_member_id}")
    public ResponseEntity<List<Case>> getCaseByMemberId(@PathVariable Integer fk_member_id) {
        List<Case> aCase = caseService.getCaseByMemberId(fk_member_id);
        if (aCase != null) {
            return ResponseEntity.status(HttpStatus.OK).body(aCase);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    //------新增照片開始------
    @PostMapping("/F/Case/uploadImg")
    public String uploadImg(@RequestParam("file") MultipartFile multipartFile) throws IOException {

        imgurUtil.setAuthorization(authorization);
        ImgurImg img = imgurUtil.uploadImg(multipartFile.getOriginalFilename(), multipartFile.getBytes());

        return img.getLink();
    }
    //------新增照片結束------

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
