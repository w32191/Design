package com.eeit40.design.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Entity.Account;

@Repository
public class AccountRepositoryDaoImpl implements AccountRepository {


	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private NamedParameterJdbcTemplate jdbcnameTemplate;
	
	
	@Override
	public Integer insert(Account account) {
		String sql = "insert into account("
				+ "email, pwd, salt, permission,)"
				+ "value(:eamil, :pwd, :salt, :permission)";
				
		SqlParameterSource  parameterSource = new BeanPropertySqlParameterSource(account);
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcnameTemplate.update(sql, parameterSource, keyHolder);
		return keyHolder.getKey().intValue();
	}
	
	
	
	@Override
	public Account findByemail(String email) {
		String sql = "select id, email, password, salt, permission"
				+ "from account where email = ?";
		List<Account> result = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Account>(Account.class), new Object[]{email});
		if(result != null && result.size() > 0) {
			return result.get(0);
		}
		
		return null;
	}
	
	
	
	@Override
	public Integer update(Account account) {
		String sql = "update account set password = :password where id = :id";
		
		SqlParameterSource parameterSource = new BeanPropertySqlParameterSource(account);
	
		return jdbcnameTemplate.update(sql, parameterSource);
	}
	
	
	
	
}
