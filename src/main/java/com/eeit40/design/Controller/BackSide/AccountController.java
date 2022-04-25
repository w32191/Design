package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Entity.Account;
import com.eeit40.design.Service.AccountService;
import com.eeit40.design.Util.Result;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RestController
public class AccountController {

    @Autowired
    private AccountService accountService;
    
    //登入帳號頁面
    @GetMapping("/login")
    public ModelAndView login(ModelAndView mav,@ModelAttribute Account account) {
		
    	mav.setViewName("/B/Account/login");
    	
    	return mav;
    }
    
    //登入帳號中並存入session
    @PostMapping("/login")
    public ModelAndView doLogin(@Valid @ModelAttribute(name = "login")
    		ModelAndView mav,Account account ,String email ,String pwd , HttpSession session, RedirectAttributes redirectAttributes, BindingResult br) {
    	
    	if(!br.hasErrors()) {
    		Account login = accountService.login(email, pwd);
    		if(login != null) {
    		session.setAttribute("account", account);
    		mav.setViewName("/B/Account/logout");
    		return mav;
    		}
    	}
			return null;
    	

    }
    
    //註冊帳號頁面
    @GetMapping("/register")
    public ModelAndView register(ModelAndView mav) {
    	
    	Account account = new Account();
    	
    	mav.getModel().put("doRegister", account);
    	
    	
    	mav.setViewName("/B/Account/register");
    	
    	return mav;
    }
    
    //註冊帳號中
    @PostMapping("/register")
    public ModelAndView doRegister(ModelAndView mav, @Valid @ModelAttribute(name = "doRegister")
    Account account, String email , String pwd, BindingResult br) {
    	
    	if(!br.hasErrors()) {
    		accountService.register(account);
    		
    		mav.setViewName("B/Account/login");
    		
    		return mav;
    		
    	}
    	
    	return null;
    	
    }
    
    
    
    
    
//    public boolean registeremail(String email) {
//    	boolean a = true;
//    	if(accountService.findAccountByemail(email).) {
//    		return a;
//    	}else {
//    		return false;
//    	}
//    }
    
    @GetMapping("/logout")
    public ModelAndView logout(ModelAndView mav) {
    	
    	mav.setViewName("/B/Account/logout");
    	return mav;
    }
    
    
    @PostMapping("/logout")
    public String logout(@ModelAttribute(name = "loginout") HttpSession session, SessionStatus sessionStatus ) {
    	
    	if(session.getAttribute("account") != null) {
    		session.removeAttribute("account");
			sessionStatus.setComplete();
		}		
		return "/B/Account/login";
    	
    }
}


