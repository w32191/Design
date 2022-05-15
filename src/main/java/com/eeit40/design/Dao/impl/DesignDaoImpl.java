package com.eeit40.design.Dao.impl;

import com.eeit40.design.Dto.DesignDto;
import com.eeit40.design.Dto.DesignQueryParams;
import com.eeit40.design.Entity.Design;
import com.eeit40.design.rowmapper.DesignRowMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@Slf4j
public class DesignDaoImpl {


  @Autowired
  private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

  public Integer countDesign(DesignQueryParams designQueryParams) {

    String sql = "SELECT count(*) FROM design_service ";

    Map<String, Object> map = new HashMap<>();

    // 1.未提煉查詢條件
//        if(caseQueryParams.getSearch() != null){
//            sql = sql + " WHERE CONCAT (classification , location , title) LIKE :search";
//            map.put("search", "%" + caseQueryParams.getSearch() + "%");
//        }
    // 2.提煉程式後的查詢條件
    sql = addFilteringSql(sql, map, designQueryParams);

    Integer total = namedParameterJdbcTemplate.queryForObject(sql, map, Integer.class);

    return total;
  }

  public List<Design> getDesigns(DesignQueryParams designQueryParams) {

    String sql = " SELECT * FROM design_service ";

    Map<String, Object> map = new HashMap<>();

    sql = addFilteringSql(sql, map, designQueryParams);

    sql = sql + " ORDER BY " + designQueryParams.getOrderBy() + " " + designQueryParams.getSort();

    sql = sql + " OFFSET :offset ROWS FETCH NEXT :fetchNext ROWS ONLY ";
    map.put("fetchNext", designQueryParams.getFetchNext());
    map.put("offset", designQueryParams.getOffset());

    List<Design> designList = namedParameterJdbcTemplate.query(sql, map, new DesignRowMapper());

    return designList;
  }

  public Design getDesignById(Integer id) {
    String sql = "SELECT * FROM design_service WHERE id=:id";

    Map<String, Object> map = new HashMap<>();
    map.put("id", id);

    List<Design> designList = namedParameterJdbcTemplate.query(sql, map, new DesignRowMapper());

    if (designList.size() > 0) {
      return designList.get(0);
    } else {
      return null;
    }
  }

  public List<Design> getDesignByMemberId(Integer fk_member_id) {
    String sql = " SELECT * FROM design_service WHERE fk_member_id=:memberId ORDER BY create_time desc ";

    Map<String, Object> map = new HashMap<>();
    map.put("memberId", fk_member_id);

    List<Design> designList = namedParameterJdbcTemplate.query(sql, map, new DesignRowMapper());

    if (designList.size() > 0) {
      return designList;
    } else {
      return null;
    }
  }

  public Integer createDesign(DesignDto designDto) {
    String sql =
        " INSERT INTO design_service (name, style, location, message, price, cover_photo, title, create_time, photo_1, photo_2, fk_member_id) "
            +
            " VALUES (:name, :style, :location, :message, :price, :coverPhoto, :title ,:createTime ,:photo_1 ,:photo_2 ,:memberId ) ";
    Map<String, Object> map = new HashMap<>();
    map.put("name", designDto.getName());
    map.put("style", designDto.getStyle());
    map.put("message", designDto.getMessage());
    map.put("price", designDto.getPrice());
    map.put("title", designDto.getTitle());
    map.put("createTime", designDto.getCreateTime());

    if (designDto.getCoverPhoto().length() < 10) {
      map.put("coverPhoto", null);
    } else {
      map.put("coverPhoto", designDto.getCoverPhoto());
    }
    if (designDto.getPhoto_1().length() < 10) {
      map.put("photo_1", null);
    } else {
      map.put("photo_1", designDto.getPhoto_1());
    }
    if (designDto.getPhoto_2().length() < 10) {
      map.put("photo_2", null);
    } else {
      map.put("photo_2", designDto.getPhoto_2());
    }
    if (designDto.getFk_member_id() != null) {
      map.put("memberId", designDto.getFk_member_id());
    } else {
      map.put("memberId", null);
    }
    map.put("location", designDto.getLocation());

//        if (designDto.getCoverPhoto().length() < 10) {
//            map.put("coverPhoto", null);
//        } else {
//            map.put("coverPhoto", designDto.getCoverPhoto());
//        }

    Date now = new Date();
    map.put("createTime", now);

    KeyHolder keyHolder = new GeneratedKeyHolder();
    namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(map), keyHolder);

    int id = keyHolder.getKey().intValue();

    return id;
  }

  public void deleteDesign(Integer id) {
    String sql = " DELETE FROM design_service WHERE id=:id ";

    Map<String, Object> map = new HashMap<>();
    map.put("id", id);

    namedParameterJdbcTemplate.update(sql, map);
  }

  public void updateDesign(Integer id, DesignDto designDto) {

    String sql = "UPDATE design_service " +
        " SET name = :name, title = :title ,style = :style ,location = :location ,message = :message, "
        +
        " price = :price, cover_photo = :coverPhoto, photo_1 = :photo_1, photo_2 = :photo_2 " +
        //冒號後的文字要跟ＭＡＰ的ＫＥＹ是一樣
        " WHERE id = :id ";

    Map<String, Object> map = new HashMap<>();
    map.put("id", id);
    map.put("name", designDto.getName());
    map.put("title", designDto.getTitle());
    map.put("style", designDto.getStyle());
    map.put("message", designDto.getMessage());
    map.put("price", designDto.getPrice());
    map.put("coverPhoto",designDto.getCoverPhoto());
    map.put("photo_1",designDto.getPhoto_1());
    map.put("photo_2",designDto.getPhoto_2());

//    if (designDto.getCoverPhoto() != null) {
//      if (designDto.getCoverPhoto().length() < 10) {
//        map.put("coverPhoto", null);
//      }else {
//        map.put("coverPhoto", designDto.getCoverPhoto());
//      }
//      map.put("coverPhoto", null);
//    } else {
//      map.put("coverPhoto", designDto.getCoverPhoto());
//    }
//    if (designDto.getPhoto_1() != null) {
//      if (designDto.getPhoto_1().length() < 10) {
//        map.put("photo_1", null);
//      }
//    } else {
//      map.put("photo_1", designDto.getPhoto_1());
//    }
//    if (designDto.getPhoto_2() != null) {
//      if (designDto.getPhoto_2().length() < 10) {
//        map.put("photo_2", null);
//      }
//    } else {
//      map.put("photo_2", designDto.getPhoto_2());
//    }
    map.put("location", designDto.getLocation());

    namedParameterJdbcTemplate.update(sql, map);
  }

  //提煉程式 將 sql 重複利用
  private String addFilteringSql(String sql, Map<String, Object> map,
      DesignQueryParams designQueryParams) {

    // 查詢條件
    if (designQueryParams.getSearch() != null) {
      sql = sql + " WHERE CONCAT (style , location , name ) LIKE :search ";

//            map.put("search", caseQueryParams.getSearch());
      map.put("search", "%" + designQueryParams.getSearch() + "%");
    }

    return sql;
  }
}
