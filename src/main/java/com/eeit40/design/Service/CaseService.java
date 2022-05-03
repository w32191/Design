package com.eeit40.design.Service;

import com.eeit40.design.Dto.CaseDto;
import com.eeit40.design.Dto.CaseQueryParams;
import com.eeit40.design.Entity.Case;

import java.util.List;


//@Slf4j
public interface CaseService {

    Integer countCase(CaseQueryParams caseQueryParams);

    List<Case> getCases(CaseQueryParams caseQueryParams);

    List<Case> getCaseById(Integer id);

    Integer createCase(CaseDto caseDto);

    void updatedCase(Integer id, CaseDto caseDto);

    void deleteCaseById(Integer id);

    String uploadImg (CaseDto caseDto);


//    @Autowired
//    private CaseRepository caseDao;
//
//
//
//    public void insert(Case aCase) {
//        caseDao.save(aCase);
//    }
//
//    public Case findById(Integer id) {
//        Optional<Case> option = caseDao.findById(id);
//
//        if (option.isPresent()) {
//            return option.get();
//        }
//        return null;
//    }
//
//    public Page<Case> findByPage(Integer pageNumber) {
//        Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "dateTime");
//
//        Page<Case> page = caseDao.findAll(pgb);
//
//        return page;
//
//    }
//
//    //按"時間"尋找
//    //1.Desc
//    public List<Case> findAllByOrderByDateTimeDesc() {
//        return caseDao.findAllByOrderByDateTimeDesc();
//    }
//
//    //2.Asc
//    public List<Case> findAllByOrderByDateTimeAsc() {
//        return caseDao.findAllByOrderByDateTimeAsc();
//    }
//
//    //按"地區"尋找
//    public List<Case> orderByLocation(String location) {
//        List<Case> orderByLocationList = caseDao.orderByLocation(location);
//        return orderByLocationList;
//    }
//
//    //按"類別"尋找
//    public List<Case> orderByClassification(String classification) {
//        List<Case> orderByClassificationList = caseDao.orderByClassification(classification);
//        return orderByClassificationList;
//    }
//
//    //列出全部資料
//    public List<Case> findAllCases() {
//        return caseDao.findAll();
//    }
//
//    //更新
//    public Case updateCase(CaseDto caseDto) {
//        Optional<Case> findCaseIdResult = caseDao.findById(caseDto.getIdDto());
//        Case aCase = null;
//        if (findCaseIdResult.isPresent()) {
//            aCase = findCaseIdResult.get();
//            aCase.setTitle(caseDto.getTitleDto());
//            aCase.setClassification(caseDto.getClassificationDto());
//            aCase.setLocation(caseDto.getLocationDto());
//            aCase.setCaseEmail(caseDto.getCaseEmailDto());
//            aCase.setMessage(caseDto.getMessageDto());
//            aCase.setExpiryDate(caseDto.getExpiryDateDto());
//        }
//        return caseDao.save(aCase);
//
//    }
//
//    //刪除
//    public Integer deleteCaseById(@PathVariable Integer id) {
//        return caseDao.deleteCaseById(id);
//    }

}
