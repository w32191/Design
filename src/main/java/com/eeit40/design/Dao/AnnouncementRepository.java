package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Announcement;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AnnouncementRepository extends JpaRepository<Announcement, Integer> {

}
