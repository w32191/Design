package com.eeit40.design.Service;

import java.util.List;

import com.eeit40.design.Entity.Account;


public interface AccountService {


	Account findAccountByemail(String email);

	public void save(Account account);

	Account findAccountBypwd(String pwd);

	
	
}
