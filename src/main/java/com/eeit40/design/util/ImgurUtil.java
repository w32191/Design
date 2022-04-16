package com.eeit40.design.util;

import com.eeit40.design.Entity.ImgurImg;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.Base64Utils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

/**
 * imgur api https://apidocs.imgur.com/#c85c9dfc-7487-4de2-9ecd-66f727cf3139
 */


@Component
public class ImgurUtil {

  // imgur 的 OAuth2 Token
  private static final String AUTHORIZATION = "Bearer 55e7ff96cd987f5197c864e8a4d48cac7006092d";
  private static final String UPLOAD_URL = "https://api.imgur.com/3/upload";

  private String imgBase64;

  private String imgLink;

  private String imgDeleteHash;

  private MultiValueMap<String, String> map;

  private ImgurImg img;


  public ImgurImg uploadImg(MultipartFile multipartFile) throws IOException {
    this.imgBase64 = Base64Utils.encodeToString(multipartFile.getBytes());
    MultiValueMap<String, String> map = new LinkedMultiValueMap<>();

    map.set("image", imgBase64);
    map.set("type", "base64");
    map.set("name", multipartFile.getOriginalFilename());

    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.MULTIPART_FORM_DATA);
    headers.add("Authorization", AUTHORIZATION);


    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, headers);
    RestTemplate restTemplate = new RestTemplate();
    String result = restTemplate.postForObject(UPLOAD_URL, request, String.class);
    System.out.println(result);
    // {"status":200,"success":true,"data":{"id":"s68wxgI","deletehash":"nZ6s4GOCYLzGwQM","account_id":112836003,"account_url":"w32191w32191","ad_type":null,"ad_url":null,"title":null,"description":null,"name":"平台.png","type":"image/png","width":6036,"height":976,"size":396218,"views":0,"section":null,"vote":null,"bandwidth":0,"animated":false,"favorite":false,"in_gallery":false,"in_most_viral":false,"has_sound":false,"is_ad":false,"nsfw":null,"link":"https://i.imgur.com/s68wxgI.png","tags":[],"datetime":1650097788,"mp4":"","hls":""}}
    ObjectMapper objectMapper = new ObjectMapper();
    JsonNode jsonNode = objectMapper.readTree(result);

    if ((jsonNode.get("status").asText()).equals("200")) {
      img = new ImgurImg();
      img.setImgName(jsonNode.get("data").get("name").asText());
      img.setLink(jsonNode.get("data").get("link").asText());
      img.setType(jsonNode.get("data").get("type").asText());
      img.setDeleteHash(jsonNode.get("data").get("deletehash").asText());
    }

    return img;
  }
}
