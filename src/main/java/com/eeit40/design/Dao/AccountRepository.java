package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Account;

import java.util.Optional;

import com.eeit40.design.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AccountRepository {

	public Integer update(Account account);

	public Integer insert(Account account);

	public Account findByemail(String email);


//	@Query("from Account where id = :id")
//	public Account findAccountById(@Param("id") Integer id );
//


}
