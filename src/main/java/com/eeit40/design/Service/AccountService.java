package com.eeit40.design.Service;

import java.util.Optional;

import com.eeit40.design.Entity.Account;
import com.eeit40.design.vo.AccountVO;

public interface AccountService {

	AccountVO login(Account account);

	Optional<String> register(AccountVO accountvo);

	
	
}
