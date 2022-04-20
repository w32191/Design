package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Entity.Account;
import com.eeit40.design.Service.AccountService;
import com.eeit40.design.vo.AccountVO;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RestController
public class AccountController {

    @Autowired
    private AccountService accountService;
    
    //登入帳號頁面
    @RequestMapping(value = {"/" , "/login"}, method = RequestMethod.GET)
    public String login(@ModelAttribute Account account,
    		@ModelAttribute(value = "MESSAGE") String message) {
		
    	return "login";
    }
    
    //登入帳號中並存入session
    @PostMapping("/login")
    public String doLogin(@Valid @ModelAttribute Account account,
    		HttpSession session,RedirectAttributes redirectAttributes) {
    	
    	account = accountService.login(account);
    	session.setAttribute("member", account);
    	
    	return "/login";

    }
    
    //註冊帳號頁面
    @GetMapping("/register")
    public String register(@ModelAttribute AccountVO accountvo) {
    	
    	return "register";
    }
    
    //註冊帳號中
    @PostMapping("/register")
    public String doRegister(@Valid @ModelAttribute AccountVO accountvo,
    		RedirectAttributes redirectAttributes) {
    	
    	accountService.register(accountvo);
    	redirectAttributes.addFlashAttribute("MESSAGE", "註冊成功");
    	return "/login";
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session, SessionStatus sessionStatus ) {
    	
    	if(session.getAttribute("member") != null) {
    		session.removeAttribute("member");
			sessionStatus.setComplete();
		}		
		return "/login";
    	
    }







}


