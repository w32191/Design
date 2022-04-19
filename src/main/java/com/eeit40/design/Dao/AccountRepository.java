package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Account;

import java.util.Optional;

import com.eeit40.design.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AccountRepository extends JpaRepository<Account, Integer>{

	public Optional<Account> findByEmail(String email);

	@Query("from Account where id = :id")
	public Account findAccountById(@Param("id") Integer id );



}
