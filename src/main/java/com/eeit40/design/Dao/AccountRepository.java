package com.eeit40.design.Dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.eeit40.design.Entity.Account;

public interface AccountRepository extends JpaRepository<Account, Integer>{

	Optional<Account> findAccountByemail(@Param("email") String email);
	
	@Query("from account where pwd = :pwd ")
	public Optional<Account> findAccountBypwd(@Param("pwd") String pwd);

//	
//	Optional<Account> findById(Integer id);
//
//	public Integer update(Account account);
//
//	public Integer insert(Account account);
//
//	public Account findByemail(String email);



}
