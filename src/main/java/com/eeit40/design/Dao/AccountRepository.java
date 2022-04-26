package com.eeit40.design.Dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.eeit40.design.Entity.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, Integer>{

	public Account findAccountByemail(String email);
	
	public Account findAccountBypwd(String pwd);
	
	@Query(value = "select email , pwd from account where email pwd =  :email, :pwd", nativeQuery = true)
	public boolean findAccountByemailandpwd(String email, String pwd);
	
	Optional<Account> findById(Integer id);




}
