package com.eeit40.design.Service.Impl;

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.Service.AccountService;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountRepository accountRepository;

	@Override
	public void save(Account account) {
		accountRepository.save(account);
	}
	
	
	@Override
	public Account findAccountBypwd(String pwd) {
		Optional<Account> option = accountRepository.findAccountBypwd(pwd);
		
		if(option.isPresent()) {
			return option.get();
		}
		return null;

	}
	
	
	@Override
	public Account findAccountByemail(String email) {
		Optional<Account> option = accountRepository.findAccountByemail(email);
		
		if(option.isPresent()) {
			return option.get();
		}
		return null;
		
	}
			
		
		

	
	
	
	
	
}
