package com.eeit40.design.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.eeit40.design.Dao.AnnouncementWorkMessagesRepository;
import com.eeit40.design.Entity.AnnouncementWorkMessages;


@Service
public class AnnouncementWorkMessagesService {
	
	@Autowired
	private AnnouncementWorkMessagesRepository announcementWorkMessagesDao;
	
	public void insert(AnnouncementWorkMessages messages) {
		announcementWorkMessagesDao.save(messages);
	}
	
	public AnnouncementWorkMessages findById(Integer id) {
		Optional<AnnouncementWorkMessages> option = announcementWorkMessagesDao.findById(id);
		
		if(option.isPresent()) {
			return option.get();
		}
		
		return null;
	}
	
	public void deleteById(Integer id) {
		announcementWorkMessagesDao.deleteById(id);
	}
	
	public List<AnnouncementWorkMessages> findAllMessages(){
		return announcementWorkMessagesDao.findAll();
	}
	
	public Page<AnnouncementWorkMessages> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "added");
		
		Page<AnnouncementWorkMessages> page = announcementWorkMessagesDao.findAll(pgb);
		
		return page;
	}
	
	public AnnouncementWorkMessages getLastest() {
		return announcementWorkMessagesDao.findFirstByOrderByAddedDesc();
	}

}
