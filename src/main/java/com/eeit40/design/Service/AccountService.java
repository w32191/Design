package com.eeit40.design.Service;

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
	

	public Account save(Account account) {
		return accountRepository.save(account);
	}
	
	
	public Account findAccountBypwd(String pwd) {
	
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

	
	public Account login (String email, String pwd) {
		
		Account email1 = accountRepository.findAccountByemail(email);
		
		if(email1 != null && email1.getPwd().equals(pwd)){
			return email1;
		}
		
		return null;
			
	}
	
	public Account findAccountById(Integer id) {
		
		return accountRepository.findAccountById(id);
	}
			
		
		
}
