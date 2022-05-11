package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.Member;
import com.eeit40.design.Service.AccountService;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
    @GetMapping("/B/login")
    public ModelAndView login( ModelAndView mav,@ModelAttribute Account account ) {
		
    	mav.setViewName("B/Account/login");
    	
    	return mav;
    }
    
    //登入帳號中並存入session
    @PostMapping("/B/login")
    public ModelAndView doLogin(ModelAndView mav, @Valid @ModelAttribute(name = "login") Account account,
    	 BindingResult br,
    		@RequestParam(name = "email") String email, @RequestParam(name = "pwd") String pwd,
    		HttpSession session, RedirectAttributes redirectAttributes) {
    	
    	if(!br.hasErrors()) {
    		Account login = accountService.login(email, pwd);
//    		Integer accper = login.getPermission();
    		if(login != null) {
    		session.setAttribute("Baccount", login);
    		System.out.println(login);
    		mav.setViewName("B/Account/index");
    		return mav;
    		}
    		mav.setViewName("B/Account/accounterror");
    		return mav;
    	}
    	mav.setViewName("B/Account/accounterror");
		return mav;

    }
    
    @GetMapping("/index")
    public ModelAndView index(ModelAndView mav) {
    	
    	mav.setViewName("B/Account/index");
    	
    	return mav;
    }
    
    //註冊帳號頁面
    @GetMapping("/B/register")
    public ModelAndView register(ModelAndView mav) {
    	
    	Account account = new Account();
    	
    	mav.getModel().put("doRegister", account);
    	
    	mav.setViewName("B/Account/register");
    	
    	return mav;
    }
    
    //註冊帳號中
    @PostMapping("/B/register")
    public ModelAndView doRegister(ModelAndView mav, @Valid @ModelAttribute(name = "doRegister")
    Account account, BindingResult br, @RequestParam(name = "email") String email , @RequestParam(name = "pwd") String pwd,
    HttpSession session) {
    	
    	if(!br.hasErrors()) {
    		account.setPermission(2);
    	 	Account accountregister = accountService.register(account);
    	 	session.setAttribute("member", accountregister);
    	 	System.out.println(accountregister);
    		
    		Member member = new Member();
    		mav.addObject(member);
    		mav.setViewName("redirect:/B/memberregister");
    		
    		return mav;
    	}
    	return null;
    	
    }
    
    
    @GetMapping("/B/dologout")
    public ModelAndView doLogout(HttpSession session, ModelAndView mav) {

    	session.invalidate();
    	
    	Account account  = new Account();
    	
    	mav.addObject("login",account);
    	mav.setViewName("B/Account/login");
    	return mav;
			
    }
    
    @GetMapping("/B/accountError")
    public ModelAndView accountError(ModelAndView mav) {
    	
    	mav.setViewName("/B/Account/accounterror");
    	
    	return mav;
    }
    
    
    @PostMapping("/B/accountError")
    public ModelAndView reaccountError(ModelAndView mav) {
    	
    	mav.setViewName("B/Account/login");
    	
    	return mav;
    	
    }
    
}


