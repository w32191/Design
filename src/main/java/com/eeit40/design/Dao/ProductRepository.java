package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Product;
import java.util.List;
import java.util.Properties;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProductRepository extends JpaRepository<Product, Integer> {

  @Query("from Product where categories= :categories")
  List<Product> findProductByCategories(@Param("categories") String categories);

  @Query("from Product where name = :name")
  List<Product> findProductByName(@Param("name") String name);

  @Query("from Product  where id = :id")
  Product findProductById(@Param("id")Integer Id);



//  @Query("update from Product set name= :name ,  where id = :id")
//  public Product updateProductById(Product pro);

//  @Query("from Customer where name = :name")
//  public List<Customer> findCustomerByName(@Param("name") String name)＝
//
//  @Query(value="select * from Customer where name = :name", nativeQuery = true)
//  public List<Customer> findCustomerByName2(@Param("name") String name);
//
//  @Transactional
//  @Modifying
//  @Query(value="delete from customer where id =?1", nativeQuery = true)
//  public void deleteCustomerById(Integer id);
//
//  public List<Customer> findByLevelOrderByName(Integer level);


}
