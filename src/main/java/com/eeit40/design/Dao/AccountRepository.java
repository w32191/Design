package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Account;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account, Integer>{

	public Optional<Account> findByEmail(String email);
	
	public Optional<Account> findBySalt(String salt);

}
