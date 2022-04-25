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
    @GetMapping("/")
    public ModelAndView login(
    		ModelAndView modelAndView,
    		@ModelAttribute Account account,
    		@ModelAttribute(value = "MESSAGE") String message) {
		
    	modelAndView.setViewName("/B/Account/login");
    	
    	return modelAndView;
    }
    
    //登入帳號中並存入session
    @PostMapping("/login")
    public Result<Account> doLogin(@Valid @ModelAttribute @RequestParam String email, @RequestParam String pwd,
    		Account account, HttpSession session, RedirectAttributes redirectAttributes) {
    	
    	Account login = accountService.login(email, pwd);
    	if(login != null) {
    		return 
    	}
    	
    	account = accountService.findAccountByemail(null);
    	session.setAttribute("member", account);
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
    Account account, String email , String pwd, String checkpwd,BindingResult br) {
    	Account email1 = accountService.findAccountByemail(email);
    	Account pwd1 = accountService.findAccountBypwd(pwd);
		Account checkpwd1 = accountService.findAccountBycheckpwd(checkpwd);
    	
    	if(!br.hasErrors()) {
    		if(pwd1.equals(checkpwd1)) {
    			
    		}
    	
    	}
    	return mav;
    	
    }
    
    
    
    
    
    public boolean registeremail(String email) {
    	boolean a = true;
    	if(accountService.findAccountByemail(email).) {
    		return a;
    	}else {
    		return false;
    	}
    }
    
    
    @RequestMapping("/logout")
    public String logout(HttpSession session, SessionStatus sessionStatus ) {
    	
    	if(session.getAttribute("member") != null) {
    		session.removeAttribute("member");
			sessionStatus.setComplete();
		}		
		return "redirect:login";
    	
    }
}


