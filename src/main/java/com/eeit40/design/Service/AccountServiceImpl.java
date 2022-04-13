package com.eeit40.design.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Entity.Account;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountRepository accountDao;
	
	

	public void insertAccount(Account account) {
		accountDao.save(account);
	}
	
	public String getPassword(String pwd) {
		return pwd;
	}
	
	public Optional<Account> findByEmail(String email) {
		
		Optional<Account> option = accountDao.findByEmail(email);
		
		if(option == null ) {
			return null;
		}
		return option;
	}
	

	
	
	
	
	
}
