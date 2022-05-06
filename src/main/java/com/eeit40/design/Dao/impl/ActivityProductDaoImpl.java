package com.eeit40.design.Dao.impl;

import com.eeit40.design.Dao.ActivityProductDao;
import com.eeit40.design.rowmapper.DiscountRowMapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ActivityProductDaoImpl implements ActivityProductDao {

  @Autowired
  private NamedParameterJdbcTemplate namedParameterJdbcTemplate;


  @Override
  public List<Map<Integer, Integer>> getProductsWithCurrentDiscount() {
    String sql = "Select ap.fk_product_id productId,a.discount_percentage dis from product p " +
        " inner join (activities_product ap inner join activities a on ap.fk_activities_id = a.id) on ap.fk_product_id = p.id "
        + " WHERE DateDiff(Day,a.start_date,getdate()) >= 0 AND DateDiff(Day,a.end_date,getdate()) <= 0";

    Map<String, String> paramMap = new HashMap<>();
    List<Map<Integer, Integer>> resultList = namedParameterJdbcTemplate.query(sql, paramMap,
        new DiscountRowMapper());
//
//    Map<Integer, Integer> returnList = new HashMap<>();
//
//    if (resultList.size() > 0) {
//      for (Map<Integer, Integer> map : resultList) {
//        for (Integer key : map.keySet()) {
//          returnList.put(key, map.get(key));
//        }
//      }
//
//    }

    return resultList;
  }


}
