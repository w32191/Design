package com.eeit40.design.Dao;

import java.util.List;
import java.util.Map;

public interface ActivityProductDao {

  List<Map<Integer, Integer>> getProductsWithCurrentDiscount();
}
