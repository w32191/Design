package com.eeit40.design.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Entity.Account;

@Service
public class AccountService {

	
	@Autowired
	private AccountRepository accountRepository;
	
	
	private String getMd5Password(String password, String salt) {
		// 對password + salt 進行三次加密
		String str = password + salt;
		for (int i = 0; i < 3; i++) {
			str = DigestUtils.md5DigestAsHex(str.getBytes()).toUpperCase();
		}
		return str;
	}
	

	public void save(Account account) {
		accountRepository.save(account);
	}
	
	
	public Account findAccountBypwd(String pwd) {
		Account pwd1 = accountRepository.findAccountBypwd(pwd);
	
		return accountRepository.findAccountBypwd(pwd);

	}
	
	
	public Account findAccountByemail(String email) {

		return accountRepository.findAccountByemail(email);
		
	}
	
	
	public Account register(Account account) {
		
		if(accountRepository.findAccountByemail(account.getEmail())!=null) {
			return null;
		}else {
			Account newacc = accountRepository.save(account);
			if(newacc != null) {
				newacc.setPwd("");
			}
			return newacc;
		} 
	}
	
	
	public boolean login (String email, String pwd) {
		
		Account email1 = accountRepository.findAccountByemail(email);
		Account pwd1 = accountRepository.findAccountBypwd(pwd);
		
		if(email1 != null && pwd1.getPwd().equals(pwd)) {
			return true;
		}
		
		return false;
			
	}
			
		
		
}
