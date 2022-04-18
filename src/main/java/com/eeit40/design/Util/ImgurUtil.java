package com.eeit40.design.Util;

import com.eeit40.design.Entity.ImgurImg;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.MalformedURLException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.Base64Utils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

/*
  參考資料：
 imgur api:
  https://apidocs.imgur.com/#c85c9dfc-7487-4de2-9ecd-66f727cf3139

  imgur 檔案格式限制：
  https://help.imgur.com/hc/en-us/articles/115000083326-What-files-can-I-upload-Is-there-a-size-limit-

  取得imgur OAuth2 Token:
  https://medium.com/front-end-augustus-study-notes/imgur-api-3a41f2848bb8
 */

/*
 程式說明：

 在使用 上傳/刪除 方法前，須先用 setAuthorization()，注入認證的Token。 (可參考ActivityServiceImpl那隻程式中,上面的設定)

 上傳圖片(upload) : 需要傳入參數(String 檔案名稱,byte[] 檔案的byte[])，
 (前端傳入的FormData，可用MultipartFile.getOriginalFilename(),MultipartFile.getBytes()取得)
 回傳：ImgurImg (裡面只有：link、deleteHash、imgName、type、authorizationAccount)

 刪除圖片(delete) : 需要傳入參數(String deleteHash)， 須從DB取出deleteHash字串，串在URL後，發起 DELETE Request
 回傳：boolean
 */


@Component
@PropertySource("classpath:imgurConfigs.properties")
public class ImgurUtil {

  private final Logger log = LoggerFactory.getLogger(this.getClass());

  // 設定值放在imgur.properties
  @Value("${UPLOAD_URL}")
  private String UPLOAD_URL;

  @Value("${DELETE_URL}")
  private String DELETE_URL;

  private String authorization;

  public ImgurUtil() {
  }

  // 可透過Setter給每個人不同的
  public void setAuthorization(String authorization) {
    this.authorization = authorization;
  }

  // 上傳照片至圖床
  public ImgurImg uploadImg(String fileName, byte[] imgBytes) throws IOException {
    log.info("照片上傳中....");
    // 將照片轉為Imgur API支援的base64字串
    String imgBase64 = Base64Utils.encodeToString(imgBytes);

    // 設定requestBody的內容
    MultiValueMap<String, String> requestBody = new LinkedMultiValueMap<>();
    requestBody.set("image", imgBase64);
    requestBody.set("type", "base64");
    requestBody.set("name", fileName);

    // 設定requestHeaders
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.MULTIPART_FORM_DATA);  // multipart/form-data
    headers.add("Authorization", authorization); // 加入Access Token

    // 向ＡＰＩ發起post request,回傳結果轉為String
    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(requestBody, headers);
    RestTemplate restTemplate = new RestTemplate();
    String result = restTemplate.postForObject(UPLOAD_URL, request, String.class);
    // 回傳範例：{"status":200,"success":true,"data":{"id":"s68wxgI","deletehash":"nZ6s4GOCYLzGwQM","account_id":112836003,"account_url":"w32191w32191","ad_type":null,"ad_url":null,"title":null,"description":null,"name":"平台.png","type":"image/png","width":6036,"height":976,"size":396218,"views":0,"section":null,"vote":null,"bandwidth":0,"animated":false,"favorite":false,"in_gallery":false,"in_most_viral":false,"has_sound":false,"is_ad":false,"nsfw":null,"link":"https://i.imgur.com/s68wxgI.png","tags":[],"datetime":1650097788,"mp4":"","hls":""}}

    // 讀取回傳結果的nodetree
    ObjectMapper objectMapper = new ObjectMapper();
    JsonNode jsonNode = objectMapper.readTree(result);

    ImgurImg img = null;

    if ((jsonNode.get("status").asText()).equals("200")) {
      log.info("成功上傳至imgur");
      img = new ImgurImg();
      img.setImgName(jsonNode.get("data").get("name").asText());
      img.setLink(jsonNode.get("data").get("link").asText());
      img.setType(jsonNode.get("data").get("type").asText());
      img.setDeleteHash(jsonNode.get("data").get("deletehash").asText());
      img.setAuthorizationAccount(jsonNode.get("data").get("account_url").asText());
    } else {
      log.info("上傳至imgur失敗，回傳null");
      // SamWang To-Do: 上傳失敗的Exception尚未處理
    }

    return img;
  }


  // 刪除圖床照片
  public boolean delete(String deleteHash) throws MalformedURLException {
    log.info("照片刪除中....");
    // 先將要刪除的deleteHash串好
    String targetUrl = DELETE_URL + deleteHash;

    // 設定requestHeaders
    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", authorization); // 加入Access Token
    HttpEntity<Object> request = new HttpEntity<>(null, headers);

    // 向ＡＰＩ發起Delete Request
    RestTemplate restTemplate = new RestTemplate();
    ResponseEntity<String> result = restTemplate.exchange(targetUrl, HttpMethod.DELETE, request,
        String.class);
    // SamWang To-Do: 刪除失敗的Exception尚未處理
    return result.getStatusCodeValue() == 200;
  }

}
