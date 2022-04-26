package com.eeit40.design.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eeit40.design.Entity.Member;

public interface MemberRepository extends JpaRepository<Member, Integer>{

}
