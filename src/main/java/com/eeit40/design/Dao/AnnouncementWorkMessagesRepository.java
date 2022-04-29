package com.eeit40.design.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eeit40.design.Entity.AnnouncementWorkMessages;

public interface AnnouncementWorkMessagesRepository extends JpaRepository<AnnouncementWorkMessages, Integer> {
       
	public AnnouncementWorkMessages findFirstByOrderByAddedDesc();
}
