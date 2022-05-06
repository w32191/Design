package com.eeit40.design.rowmapper;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import org.springframework.jdbc.core.RowMapper;

public class DiscountRowMapper implements RowMapper<Map<Integer, Integer>> {

  @Override
  public Map<Integer, Integer> mapRow(ResultSet rs, int rowNum) throws SQLException {
    Map<Integer, Integer> map = new HashMap();
    map.put(rs.getInt("productId"), rs.getInt("dis"));

    return map;
  }
}
