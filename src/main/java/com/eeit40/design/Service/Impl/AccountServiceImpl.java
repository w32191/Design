package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.Service.AccountService;
import com.eeit40.design.Util.ValidFormat;
import com.eeit40.design.vo.AccountVO;
import java.util.Optional;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountRepository accountDao;
	
	@Autowired
	private AccountService accountService;
	
	private String getmd5pwd(String pwd , String salt) {
		
		//對pwd+salt 進行三次加密
		String str = pwd + salt;
		for(int i = 0; i < 3; i++) {
			str = DigestUtils.md5DigestAsHex(str.getBytes()).toUpperCase();
		}
		return str;
	}

	@Override
	public AccountVO login(Account account) {
		
		//檢查帳號是否存在
		Account accountemail = accountDao.findByemail(account.getEmail());
		if(accountemail == null) {
			return null;
		}
		
		//使用資料庫鹽值對輸入密碼進行加密
		String md5pwd = getmd5pwd(account.getPwd(), accountemail.getSalt());
		
		//比對密碼是否相等
		if(!md5pwd.equals(accountemail.getPwd())) {
			return null;
		}
		
		
		AccountVO accountvo = new AccountVO();
		accountvo.setEmail(account.getEmail());
		
		return accountvo;
	}
	

	@Override
	public Optional<String> register(AccountVO accountvo){
		
		//驗證欄位是否填寫及格式相等
		if(!ValidFormat.isEmail(accountvo.getEmail())) return Optional.of("帳號必需是Email格式");
		if(!ValidFormat.isPassword(accountvo.getPwd())) return Optional.of("密碼長度必須為6~16位碼大小寫英文加數字");
		if(!accountvo.getPwd().equals(accountvo.getCheckpwd())) return Optional.of("兩次輸入密碼不相符");
		
		//檢查帳號是否重複註冊
		Account dataemail = accountDao.findByemail(accountvo.getEmail());
		if(dataemail != null) {
			return Optional.of("該帳號已被使用");	
		}
		
		//產生鹽值
		String salt = UUID.randomUUID().toString().toUpperCase().replaceAll("-","");
		
		// 新增MemberAccount 資料
		Account account = new Account();
		account.setEmail(accountvo.getEmail());
		account.setPwd(accountvo.getPwd());
		account.setSalt(salt);
		Integer id = accountDao.insert(account);
		if(id == 0) {
			return Optional.of("新增會員時發生錯誤");
		}
		return Optional.empty();
		
	}

	
	
	
	
	
}
