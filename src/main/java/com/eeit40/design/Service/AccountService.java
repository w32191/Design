package com.eeit40.design.Service;

import com.eeit40.design.Entity.Account;
import com.eeit40.design.vo.AccountVO;

public interface AccountService {

	public Account login(Account account);

	public void register(AccountVO accountvo);

	public Account findByemail(String email);

	
	
}
