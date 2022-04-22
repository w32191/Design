package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.Service.AccountService;
import com.eeit40.design.vo.AccountVO;

import java.util.List;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountRepository accountDao;

	
	private String getmd5pwd(String pwd , String salt) {
		
		//對pwd+salt 進行三次加密
		String str = pwd + salt;
		for(int i = 0; i < 3; i++) {
			str = DigestUtils.md5DigestAsHex(str.getBytes()).toUpperCase();
		}
		return str;
	}


//	@Override
//	public List<Account> login(Account account) {
//		
//		//檢查帳號是否存在
//		List<Account> accountemail = accountDao.findAccountByemail(account.getEmail());
//		if(accountemail == null) {
//			return null;
//		}
//		
//		//使用資料庫鹽值對輸入密碼進行加密
//		String md5pwd = getmd5pwd(account.getPwd(), ((Account) accountemail).getSalt());
//		
//		//比對密碼是否相等
//		if(!md5pwd.equals(((Account) accountemail).getPwd())) {
//			return null;
//		}
//		// 將密碼設為null 後回傳
//		((Account) accountemail).setPwd(null);
//		((Account) accountemail).setSalt(null);
//		return accountemail;
//		
//		
//	}
//	
//
//	@Override
//	public void register(AccountVO accountvo){
//		
//		if(!accountvo.getPwd().equals(accountvo.getCheckpwd())) {
//			
//		}
//		
//		//檢查帳號是否重複註冊
//		List<Account> dataemail = accountDao.findAccountByemail(accountvo.getEmail());
//		if(dataemail != null) {
//				
//		}
//		
//		//產生鹽值
//		String salt = UUID.randomUUID().toString().toUpperCase().replaceAll("-","");
//		
//		String md5Pwd = getmd5pwd(accountvo.getPwd(), salt);
//		
//		
//		// 新增MemberAccount 資料
//		Account account = new Account();
//		account.setEmail(accountvo.getEmail());
//		account.setPwd(md5Pwd);
//		account.setSalt(salt);
//		account.setPermission(2);
//		Integer id = accountDao.insert(account);
//		if(id == 0) {
//			
//		}
//		
//		
//		
//		
//		
//	}
	
	@Override
	public void save(Account account) {
		accountDao.save(account);
	}
	
	public Account findByemailandpwd(String email, String pwd) {
		return accountDao.findByemailandpwd(email, pwd); 
	}
	
	
	@Override
	public List<Account> findAccountByemail(String email) {
		
		return accountDao.findAccountByemail(email);
	}
			
		
		

	
	
	
	
	
}
