package com.eeit40.design.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit40.design.Entity.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, Integer>{

	public Member findMemberById(Integer id);

	public List<Member> findAllById(Integer id);
	
}
