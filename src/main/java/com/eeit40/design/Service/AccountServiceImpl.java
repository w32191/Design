package com.eeit40.design.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.utils.ValidFormat;
import com.eeit40.design.vo.AccountVO;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountRepository accountDao;
	
	@Autowired
	private AccountService accountService;
	
	private String getmd5pwd(String pwd , Account account) {
		
		//對pwd+salt 進行三次加密
		String str = pwd + account;
		for(int i = 0; i < 3; i++) {
			str = DigestUtils.md5DigestAsHex(str.getBytes()).toUpperCase();
		}
		return str;
	}

	@Override
	public AccountVO login(Account account) {
		
		Optional<Account> optionsalt = accountDao.findBySalt(account.getSalt());
		
		//檢查帳號是否存在
		Optional<Account> optionemail = accountDao.findByEmail(account.getEmail());
		if(optionemail == null) {
			return null;
		}
		
		String md5pwd = getmd5pwd(account.getPwd(), optionsalt.get());
		
		AccountVO accountvo = new AccountVO();
		accountvo.setEmail(account.getEmail());
		
		return accountvo;
	}
	
	public Optional<String> register(AccountVO accountvo){
		
		//驗證欄位是否填寫及格式相等
		if(!ValidFormat.isEmail(accountvo.getEmail())) return Optional.of("帳號必需是Email格式");
		if(!ValidFormat.isPassword(accountvo.getPwd())) return Optional.of("密碼長度必須為6~16位碼大小寫英文加數字");
		if(!accountvo.getPwd().equals(accountvo.getCheckpwd())) return Optional.of("兩次輸入密碼不相符");
		
		//檢查帳號是否重複註冊
		Optional<Account> option = accountDao.findByEmail(accountvo.getEmail());
		if(option != null) {
			return Optional.of("該帳號已被使用");
		}
		return null;
		
		
	}

	
	
	
	
	
}
