package com.eeit40.design.Dao;

import com.eeit40.design.Entity.ImgurImg;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ImgurImgRepository extends JpaRepository<ImgurImg, Integer> {

  @Modifying
  @Query(value = "DELETE FROM imgurImg WHERE fk_activity_id = :id",nativeQuery = true)
  void deleteImgurImgByFkActivity(Integer id);

  @Query(value = "SELECT delete_hash FROM imgurImg WHERE fk_activity_id = :id",nativeQuery = true)
  String findDeleteHashById(Integer id);

}
