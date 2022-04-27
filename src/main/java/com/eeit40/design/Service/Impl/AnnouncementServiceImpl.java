//package com.eeit40.design.Service.Impl;
//
//import com.eeit40.design.Dao.AnnouncementRepository;
//import com.eeit40.design.Dao.ProductRepository;
//import com.eeit40.design.Dto.AnnouncementDto;
//import com.eeit40.design.Entity.Announcement;
//import com.eeit40.design.Entity.ImgurImg;
//import com.eeit40.design.Entity.Product;
//import com.eeit40.design.Service.AnnouncementService;
//import com.eeit40.design.Util.ImgurUtil;
//import java.io.IOException;
//import java.net.MalformedURLException;
//import java.util.LinkedHashSet;
//import java.util.List;
//import java.util.Optional;
//import java.util.Set;
//import javax.annotation.PostConstruct;
//import javax.transaction.Transactional;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.PropertySource;
//import org.springframework.stereotype.Service;
//
////@Service
//@Transactional
//@PropertySource("classpath:imgurConfigs.properties")
//public class AnnouncementServiceImpl implements AnnouncementService {
//
//  private final Logger log = LoggerFactory.getLogger(this.getClass());
//
//  @Autowired
//  private AnnouncementRepository activityRepository;
//
//  @Autowired
//  private ProductRepository productRepository;
//
//  @Autowired
//  private ImgurUtil imgurUtil;
//
//  // 認證放在imgur.properties，class上方要加 @PropertySource("classpath:imgur.properties")
//  // ${ 中間放imgur.properties中的key值 }
//  @Value("${AU_w32191}")
//  private String authorization;
//
//  // 整個Bean初始化中的執行順序：Constructor -> @Autowired/@Value -> @PostConstruct
//  // 若不使用 @PostConstruct則需要在呼叫imgurUtil的方法前，用setter注入
//  @PostConstruct
//  public void init() {
//    // imgurUtil沒有認證字串，setter注入
//    this.imgurUtil.setAuthorization(authorization);
//  }
//
//  @Override
//  public List<Announcement> findAll() {
//    return activityRepository.findAll();
//  }
//
//  @Override
//  public boolean deleteByID(int id) {
//    Optional<Announcement> findResult = announcementRepository.findById(id);
//
//    // 先確認是否有這個ID的Activity
//    if (findResult.isPresent()) {
//
//    	Announcement announcement = findResult.get();
//      for (ImgurImg img : activity.getImgurImgs()) {
//        // 刪除imgur圖床的照片
//        if (imgurUtil.delete(img.getDeleteHash())) {
//          log.info("id:" + img.getId() + " imgur圖床照片刪除成功");
//        } else {
//          log.info("id:" + img.getId() + " imgur圖床照片刪除失敗");
//        }
//      }
//
//      //斷掉商品關聯後刪除
//      announcement.setProducts(null);
//      announcementRepository.deleteById(id);
//
//      // 刪掉後再查一次看看還在不在
//      findResult = announcementRepository.findById(id);
//    } else {
//      //
//      return false;
//    }
//
//    // 查一次結果如果是空的，表示刪除成功
//    return findResult.isEmpty();
//
//  }
//
//  @Override
//  public Announcement insertAnnouncement(AnnouncementDto dto) throws IOException {
//    Set<Product> products = null;
//    Set<ImgurImg> imgs = null;
//    Announcement announcement = new Activity();
//
//    announcement.setSubject(dto.getSubject());
//    announcement.setContent(dto.getContent());
//    announcement.setDiscountPercentage(dto.getDiscountPercentage());
//    announcement.setStartDate(dto.getStartDate());
//    announcement.setEndDate(dto.getEndDate());
//
//    //如果使用者有上傳圖片的話
//    if (dto.getImgs() != null) {
//      imgs = new LinkedHashSet<>();
//      for (String fileName : dto.getImgs().keySet()) {
//        ImgurImg img = imgurUtil.uploadImg(fileName, dto.getImgs().get(fileName));
//        // 圖片關聯活動
//        img.setFknouncement(announcement);
//        imgs.add(img);
//      } // end of img for()
//    } // end of img if()
//
//    //如果使用者有勾選，此活動的商品
//    if (dto.getProductId() != null) {
//      products = new LinkedHashSet<>();
//      for (Integer productId : dto.getProductId()) {
//        Optional<Product> result = productRepository.findById(productId);
//        if (result.isPresent()) {
//          products.add(result.get());
//        }
//      } // end of product for()
//    } // end of product if()
//
//    //活動關聯圖片
//    activity.setImgurImgs(imgs);
//    //活動關聯商品
//    activity.setProducts(products);
//    // 回傳新增後的Activity
//    return activityRepository.save(activity);
//  }
//
//}