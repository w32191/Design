package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dto.CaseDto;
import com.eeit40.design.Dto.CaseQueryParams;
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
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.io.IOException;
import java.util.List;

@RestController
@PropertySource("classpath:imgurConfigs.properties")
//@RequestMapping("/B/Case/Case")
public class BackCasePageController {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Value("${AU_Kenny}")
    private String authorization;

    @Autowired
    private ImgurUtil imgurUtil;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private Jackson2ObjectMapperBuilder builder;

    @Autowired
    private CaseService caseService;

    @GetMapping("/B/Case")
    public ModelAndView index(ModelAndView mav) {
        mav.setViewName("/B/Case/Case");
        return mav;
    }
    //使用@Max @Min 要加@Validated 才會真的生效
    @Validated
    @GetMapping("/B/Cases")
    //  public ResponseEntity<List<Case>> getCases(
    public ResponseEntity<Page<Case>>  getCases(

            //------查詢條件 Filtering------
//            @RequestParam(required = false) CaseCaregory category,
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

    @GetMapping("/B/Case/{id}")
    public ResponseEntity<List<Case>> getCase(@PathVariable Integer id) {
        List<Case> aCase = caseService.getCaseById(id);
        if (aCase != null) {
            return ResponseEntity.status(HttpStatus.OK).body(aCase);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

//    @PostMapping("/B/Case/createCase")
//    //@Valid DTO有@NOTNULL的註解時要加
//    public ResponseEntity<Case> createCase(@RequestBody @Valid CaseDto caseDto){
//        Integer id = caseService.createCase(caseDto);
//
//        Case acase = caseService.getCaseById(id);
//
//        return ResponseEntity.status(HttpStatus.CREATED).body(acase);
//    }

    @PostMapping("/B/Case/createCase")
    //@Valid DTO有@NOTNULL的註解時要加
    public ResponseEntity<List<Case>> createCase(@RequestParam("data") String jsonStr) throws JsonProcessingException {

        CaseDto caseDto = mapper.readValue(jsonStr, CaseDto.class);
        Integer id = caseService.createCase(caseDto);

        List<Case> acase = caseService.getCaseById(id);

        return ResponseEntity.status(HttpStatus.CREATED).body(acase);
    }

    @PostMapping("/B/Case/updatedCase/{id}")
    public ResponseEntity<List<Case>> updatedCase(@PathVariable Integer id,
                                            @RequestParam("data") String jsonStr,
                                            @RequestParam(name = "file", required = false) MultipartFile multipartFile) throws JsonProcessingException {

        CaseDto caseDto = mapper.readValue(jsonStr, CaseDto.class);
        caseService.updatedCase(id, caseDto);
//        System.out.println(caseDto.getList());
        //判定商品 id 是否存在
        List<Case> aCase = caseService.getCaseById(id);

        if (aCase == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        //修改商品的數據
        caseService.updatedCase(id, caseDto);
        List<Case> updatedCase = caseService.getCaseById(id);
        return ResponseEntity.status(HttpStatus.OK).body(updatedCase);
    }

    @DeleteMapping("/B/Case/deleteCase/{id}")
    public ResponseEntity<?> deleteCase(@PathVariable Integer id) {
        caseService.deleteCaseById(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }


    //------新增照片開始------
    @PostMapping("/B/Case/uploadImg")
    public String uploadImg(@RequestParam("file") MultipartFile multipartFile) throws IOException {

        imgurUtil.setAuthorization(authorization);
        ImgurImg img = imgurUtil.uploadImg(multipartFile.getOriginalFilename(), multipartFile.getBytes());

        return  img.getLink();
    }
    //------新增照片結束------



//    @GetMapping("/B/CaseMessage")
//    public ModelAndView caseMessage(ModelAndView mav , @RequestParam(name="page",defaultValue = "1") Integer pageNumber){
//        Page<Case> page = caseService.findByPage(pageNumber);
//        mav.getModel().put("page",page);
//
//        Case lastestCase = caseService.getLastest();
//        mav.getModel().put("lastCase",lastestCase);
//
//        mav.setViewName("/B/Case/CaseMessage");
//        return mav;
//    }

    //列出全部資料
//    @GetMapping("/B/Case/CaseMessage")
//    public ModelAndView findAllCases(ModelAndView modelAndView) {
//        List<Case> list = caseService.findAllCases();
//        System.out.println(list);
//        modelAndView.addObject("findAll", list);
//        modelAndView.setViewName("/B/Case/CaseMessage");
//        return modelAndView;
//    }

    //按"時間"尋找
    //1.Decs
//    @GetMapping("/B/Case/CaseMessagedatetimeDesc")
//    public ModelAndView findFirstByOrderByDateTimeDesc(ModelAndView modelAndView) {
//        List<Case> list = caseService.findAllByOrderByDateTimeDesc();
//        modelAndView.addObject("lastest", list);
//        modelAndView.setViewName("/B/Case/CaseMessagedatetimeDesc");
//        return modelAndView;
//    }

    //2.Acs
//    @GetMapping("/B/Case/CaseMessagedatetimeAsc")
//    public ModelAndView findFirstByOrderByDateTimeAsc(ModelAndView modelAndView) {
//        List<Case> list = caseService.findAllByOrderByDateTimeAsc();
//        modelAndView.addObject("oldest", list);
//        modelAndView.setViewName("/B/Case/CaseMessagedatetimeAsc");
//        return modelAndView;
//    }

    //按"類別"尋找
//    @ResponseBody
//    @GetMapping("/B/Case/orderByClassification")
//    public String orderByClassification(@RequestParam("classification") String classification) throws JsonProcessingException {
//        List<Case> list = caseService.orderByClassification(classification);
////        ObjectMapper mapper = builder.build();
////        modelAndView.addObject("orderByClassification",list);
////        modelAndView.setViewName("/B/Case/caseOrderByClassification");
////        System.out.println(mapper.writeValueAsString(list));
//        return mapper.writeValueAsString(list);
//    }

    //按"地區"尋找
//    @ResponseBody
//    @GetMapping("/B/Case/orderByLocation")
//    public String orderByLocation(@RequestParam("location") String location) throws JsonProcessingException {
//        List<Case> orderByLocationList = caseService.orderByLocation(location);
////
//        ObjectMapper mapper = builder.build();
//        return mapper.writeValueAsString(orderByLocationList);
//    }

    //頁面
//    @GetMapping(value = "B/Case/page/{pageNumber}")
//    public List<Case> findByCasePage(@PathVariable Integer pageNumber){
//        Pageable pgb = PageRequest.of(pageNumber -1, 2, Sort.Direction.ASC,"id");
//        Page<Case> page = caseRepository.findAll(pgb);
//        List<Case> list = page.getContent();
//        return list;
//    }


    //修改
//    @RequestMapping("/Design/B/Case/edit/page")
//    public String toEditPage(
//                @RequestParam("id") Integer id,
//                @RequestParam("title") String title,
//                @RequestParam("name") String name,
//                @RequestParam("classification") String classification,
//                @RequestParam("location") String location,
//                @RequestParam("caseEmail") String caseEmail,
//                @RequestParam("message") String message,
//                @RequestParam("dateTime") Date dateTime,
//                ModelMap modelMap){
//
//        Case aCase = caseService.findById(id);
//
//        modelMap.addAttribute("acase",aCase);
//
//
//        return "CaseEdit";
//    }

    //刪除
//    @GetMapping("/B/Case/delete/{id}")
//    @ResponseBody
//    public String deleteCaseById(@PathVariable Integer id) {
//        //測試用建議加入
//        System.out.println(id);
//        Integer r = caseService.deleteCaseById(id);
//        System.out.println(r);
//        //沒刪除為0
//        //刪除為1
//
//        if (r > 0) {
//            return "刪除成功！";
//        }
////        modelAndView.setViewName("redirect:/B/Case/CaseMessage");
//        return "刪除失敗！";
//    }

    //新增
//    @PostMapping("/B/Case/api/postCase")
////    @ResponseBody
//    public List<Case> postCaseApi(@RequestParam("data") String dataStr,@RequestParam(name = "file", required = false) MultipartFile file) throws IOException {
//        log.info(dataStr);
//        CaseDto caseDto = mapper.readValue(dataStr, CaseDto.class);
//        // @RequestBody CaseDto caseDto
//        String title = caseDto.getTitle();
//        String name = caseDto.getName();
//        String classification = caseDto.getClassification();
//        String location = caseDto.getLocation();
//        String caseEmail = caseDto.getCaseEmail();
//        String message = caseDto.getMessage();
//        Date expiryDate = caseDto.getExpiryDate();
//
//        Map<String ,byte[]> map= new HashMap<>();
//        map.put(file.getOriginalFilename(), file.getBytes());
//        caseDto.setInsertImg(map);
//
//        Case caseMsg = new Case();
//        caseMsg.setTitle(title);
//        caseMsg.setName(name);
//        caseMsg.setClassification(classification);
//        caseMsg.setLocation(location);
//        caseMsg.setCaseEmail(caseEmail);
//        caseMsg.setMessage(message);
//        caseMsg.setExpiryDate(expiryDate);
//        caseService.insert(caseMsg);
//
//        Page<Case> page = caseService.findByPage(1);
//        List<Case> list = page.getContent();
//
//        return list;
//    }
}
