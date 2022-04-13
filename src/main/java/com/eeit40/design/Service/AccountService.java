package com.eeit40.design.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Entity.Account;

@Service
public class AccountService {
	
	@Autowired
	private AccountRepository accountDao;
	

	public void insert(Account account) {
		accountDao.save(account);
	}
	
	public Account findById(Integer id) {
		Optional<Account> option = accountDao.findById(id);
		
		if(option.isPresent()) {
			return option.get();
		}
		return null;
	}
	
	public void deleteById(Integer id) {
		accountDao.deleteById(id);
	}
	
	
	
}
