package com.eeit40.design.Dao;

import java.awt.print.Pageable;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit40.design.Entity.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, Integer>{


	public Member findMemberById(Integer id);

	public Member findFirstByOrderById();



	
}
