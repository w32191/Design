package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AccountController {

    @Autowired
    private AccountRepository dao;







}


