package com.eeit40.design.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import javax.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit40.design.Dao.CommonQuestionRepository;
import com.eeit40.design.Entity.CommonQuestion;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CommonQuestionService {

	@Autowired
	private CommonQuestionRepository cqrDao;
	
	//顯示全部QA
	public List<CommonQuestion> selectAll() {
		List<CommonQuestion> cq = cqrDao.findAll();		
		return cq;
	}
	
	//修改QA
    public void insert(CommonQuestion cq) {
      cqrDao.save(cq);
    }
    
    public CommonQuestion findById(Integer id) {
      Optional<CommonQuestion> option = cqrDao.findById(id);
      
      if(option.isPresent()) {
          return option.get();
      }      
      return null;
  }

	//刪除QA
    public void deleteQA(Integer id) {
      cqrDao.deleteById(id);
      System.out.println("Service -- Delete QA Complete!!");
    }
	
	
	
}
