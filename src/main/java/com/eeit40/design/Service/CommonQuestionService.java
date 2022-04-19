package com.eeit40.design.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit40.design.Dao.CommonQuestionRepository;
import com.eeit40.design.Entity.CommonQuestion;

@Service
public class CommonQuestionService {

	@Autowired
	private CommonQuestionRepository cqrDao;
	
	public List<CommonQuestion> selectAll() {
		
		List<CommonQuestion> cq = cqrDao.findAll();
		
		
		
		return cq;
	}
	
}
