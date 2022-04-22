package com.eeit40.design.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.eeit40.design.Entity.Account;
import com.eeit40.design.vo.AccountVO;

@Service
public interface AccountService {


	List<Account> findAccountByemail(String email);

	public void save(Account account);

	
	
}
