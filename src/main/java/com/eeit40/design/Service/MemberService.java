package com.eeit40.design.Service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
	

	public Optional<Member> findMemberAllId(Integer id) {

		return memberDao.findById(id);

	}
	

	public void deleteMemberId(Integer id) {

		memberDao.deleteById(id);
	}
	
	
	
	public Member memberRegister(Member member) {
		
			Member savemember = memberDao.save(member);
			return savemember;
		
	}
	
	public Member findMemberByfkAccount(Account fkAccount){
		
		return  findMemberByfkAccount(fkAccount);
	}
	
	public List<Member> findMemberAll(){
		
		return memberDao.findAll();
	}
	

	public Page<Member> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1 , 5, Sort.Direction.ASC, "names");
		
		Page<Member> page = memberDao.findAll(pgb);
		
		return page;
	}
	

	
	public Member getLastest() {
		
		return memberDao.findFirstByOrderById();
	}
	
}
