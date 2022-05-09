package com.eeit40.design.Dao;

import com.eeit40.design.Entity.OrderList;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderListRepository extends JpaRepository<OrderList, Integer> {

    //查詢
    @Modifying
    @Query(value = "select * from order_list where fk_order_imformation_id = :imforId", nativeQuery = true)
    public List<OrderList> selectByImforId(@Param("imforId") int fkOrderImformation);

    //備貨中訂單的缺貨商品品牌列表
    @Query(value = "SELECT DISTINCT  b.id,b.name,b.img " +
            "from (" +
            "select p.id,p.name,p.image01,p.stock,p.fk_brand_id,temp.amount " +
            "from product p " +
            "join (select o.fk_product_id ,sum(o.order_mount) as amount " +
            "FROM order_information oi " +
            "join order_list o on oi.id = o.fk_order_imformation_id " +
            "where oi.ship_state = '備貨中'" +
            "group by o.fk_product_id ) as temp " +
            "on p.id = temp.fk_product_id " +
            "Where p.stock < temp.amount) " +
            "as temp2 JOIN brand b " +
            "on temp2.fk_brand_id = b.id ", nativeQuery = true)
    List<Map<Integer, Map<Integer, Integer>>> doSomethingGetBrand();


    //備貨中訂單的缺貨商品品牌內的商品
    @Query(value = "select p.id,p.name,p.image01,p.stock,p.fk_brand_id,temp.amount " +
            "from product p " +
            "join ( select o.fk_product_id, sum(o.order_mount) as amount " +
            "FROM order_information oi " +
            "join order_list o on oi.id = o.fk_order_imformation_id " +
            "where oi.ship_state = '備貨中'" +
            "group by o.fk_product_id ) as temp " +
            "on p.id = temp.fk_product_id " +
            "Where p.fk_brand_id = :id AND p.stock < temp.amount", nativeQuery = true)
    List<Map<Integer, Map<Integer, Integer>>> doSomethingGetPorduct(@Param("id") Integer id);
}
