package com.eeit40.design.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.vo.AccountVO;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountRepository accountDao;
	
	@Autowired
	private AccountService accountService;

	
	public AccountVO login(Account account) {
		return null;
		
	}

	
	
	
	
	
}
