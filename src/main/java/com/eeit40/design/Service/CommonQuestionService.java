package com.eeit40.design.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.Part;
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
	
	public void insert(CommonQuestion questions) {
	  cqrDao.save(questions);
    }
	
	public void deleteById(Integer id) {
	  cqrDao.deleteById(id);
    }
	
	// 修改
    public void updateQuestion(String pName, int pPrice, String pSpecs, String pDes, int pType, int pCountry,
            String pAvailable, int pID, Part part) {

        try {
            File file = new File("");
            String absolutePath = file.getAbsolutePath();
            String path = absolutePath + "\\src\\main\\webapp\\src\\productimg\\" + pID + "\\";
            String filename = "main.jpg";
            // 有無上傳圖檔判斷是否寫入
            if (part.getSubmittedFileName() != "") {
                InputStream in = part.getInputStream();
                OutputStream out = new FileOutputStream(path + filename);
                byte[] buf = new byte[256];
                while (in.read(buf) != -1)
                    out.write(buf);
                out.close();
                in.close();
            }
        } catch (Exception e) {

        }
        SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
        Date date = new Date();
        String strDate = sdFormat.format(date);
        cqrDao.updateProduct(pName, pPrice, pSpecs, pDes, pType, pCountry, pAvailable, strDate, pID);
    }
	
	
}
