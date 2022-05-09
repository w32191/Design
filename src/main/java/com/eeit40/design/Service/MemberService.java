package com.eeit40.design.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Dao.MemberRepository;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.Member;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberDao;
	
	@Autowired
	private AccountRepository AccountDao;

	public Member save(Member member) {
		return memberDao.save(member);
	}
	

	public Member findMemberById(Integer id) {

		return memberDao.findMemberById(id);
	}
	

	public List<Member> findMemberAllId(Integer id) {

		return memberDao.findAllById(id);

	}
	

	public void deleteMemberId(Integer id) {

		memberDao.deleteById(id);
	}
	
	
	
	public Member memberRegister(Member member) {
		
			Member savemember = memberDao.save(member);
			return savemember;
		
	}
	
	public Member findMemberByfkAccount(int fkAccount){
		
		return  findMemberByfkAccount(fkAccount);
	}


}
