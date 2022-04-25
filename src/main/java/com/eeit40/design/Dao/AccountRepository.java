package com.eeit40.design.Dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.eeit40.design.Entity.Account;

public interface AccountRepository extends JpaRepository<Account, Integer>{

	public Account findAccountByemail(String email);
	
	public Account findAccountBypwd(String pwd);
	
	Optional<Account> findById(Integer id);




}
