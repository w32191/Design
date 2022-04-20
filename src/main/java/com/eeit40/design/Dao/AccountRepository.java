package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Account;


public interface AccountRepository {

	public Integer update(Account account);

	public Integer insert(Account account);

	public Account findByemail(String email);



}
