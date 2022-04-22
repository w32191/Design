package com.eeit40.design.Dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit40.design.Entity.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, Integer>{

	List<Account> findAccountByemail(String email);
	
	public Account findByemailandpwd(String email, String pwd);

//	public Integer insert(Account account);
//	
//	Optional<Account> findById(Integer id);

//	public Integer update(Account account);
//
//	public Integer insert(Account account);
//
//	public Account findByemail(String email);



}
