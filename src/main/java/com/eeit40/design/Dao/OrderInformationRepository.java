package com.eeit40.design.Dao;

import com.eeit40.design.Entity.OrderInformation;

import java.time.Instant;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderInformationRepository extends JpaRepository<OrderInformation, Integer> {

	
	
}
