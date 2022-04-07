package com.eeit40.design.Dao;

import com.eeit40.design.Entity.OrderInformation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderInformationRepository extends JpaRepository<OrderInformation, Integer> {

}
