package com.eeit40.design.Dao;

import com.eeit40.design.Entity.Case;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CaseRepository extends JpaRepository<Case, Integer> {

}
