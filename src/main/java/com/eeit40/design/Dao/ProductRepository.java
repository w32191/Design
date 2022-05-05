package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Brand;
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
    Product findProductById(@Param("id") Integer Id);

    @Query("from Product where fkBrand = :fkBrand")
    List<Product> findProductByFkBrand(@Param("fkBrand") Brand id);

    List<Product> findAll();

    @Query(value = "from Product ORDER BY price desc ")
    List<Product> findProductOrderByPriceDesc();

    @Query(value = "select * from Product where stock <1", nativeQuery = true)
    List<Product> findProductOutOfStock();

    @Query(value = "select * from Product ORDER BY price", nativeQuery = true)
    List<Product> findProductOrderByPrice();

    @Query(value = "from Product  where  categories= :categories order by price")
    List<Product> findProductByCategoriesOrderByPrice(@Param("categories") String categories);

    @Query(value = "from Product  where  categories= :categories order by price DESC ")
    List<Product> findProductByCategoriesOrderByPriceDesc(@Param("categories") String categories);

    @Query(value = "from Product  where fkBrand= :fkBrand order by price")
    List<Product> findProductByFkBrandOrderByPrice(@Param("fkBrand") Brand id);

    @Query(value = "from Product  where fkBrand= :fkBrand order by price DESC ")
    List<Product> findProductByFkBrandOrderByPriceDesc(@Param("fkBrand") Brand id);

    @Query(value = "from Product order by added")
    List<Product> findProductOrderByAdded();

    @Query(value = "from Product order by added desc ")
    List<Product> findProductOrderByAddedDesc();

    @Query(value = "from  Product where categories = :categories order by added")
    List<Product> findProductByCategoriesOrderByAdded(@Param("categories") String categories);

    @Query(value = "from  Product where categories = :categories order by added desc ")
    List<Product> findProductByCategoriesOrderByAddedDesc(@Param("categories") String categories);

    @Query(value = "from Product  where fkBrand= :fkBrand order by added")
    List<Product> findProductByBrandOrderByAdded(@Param("fkBrand") Brand id);

    @Query(value = "from Product  where fkBrand= :fkBrand order by added desc ")
    List<Product> findProductByBrandOrderByAddedDesc(@Param("fkBrand") Brand id);

    List<Product> findByNameLike(String name);


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
