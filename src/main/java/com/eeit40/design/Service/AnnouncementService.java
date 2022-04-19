package com.eeit40.design.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.eeit40.design.Dao.AnnouncementRepository;
import com.eeit40.design.Entity.Announcement;


@Service
@Transactional
public class AnnouncementService {
	
	@Autowired
	private AnnouncementRepository announcementDao;
	
	public void insert(Announcement announcement) {
		announcementDao.save(announcement);
	}
	
	public Announcement findById(Integer id) {
		Optional<Announcement> option = announcementDao.findById(id);
		
		if(option.isPresent()) {
			return option.get();
		}
		
		return null;
	}
	
	public void deleteById(Integer id) {
		announcementDao.deleteById(id);
	}
	
	public List<Announcement> findAllMessages(){
		return announcementDao.findAll();
	}
	
	public Page<Announcement> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "added");
		
		Page<Announcement> page = announcementDao.findAll(pgb);
		
		return page;
	}
	
	public Announcement getLatest() {
		// test
		return announcementDao.findFirstByOrderByIdDesc();
	}

}
