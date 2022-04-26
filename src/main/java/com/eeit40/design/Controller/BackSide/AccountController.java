package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Entity.Account;
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
    @GetMapping("/login")
    public ModelAndView login(ModelAndView mav,@ModelAttribute Account account) {
		
    	mav.setViewName("B/Account/login");
    	
    	return mav;
    }
    
    //登入帳號中並存入session
    @PostMapping("/login")
    public ModelAndView doLogin(@Valid @ModelAttribute(name = "login")
    		ModelAndView mav, Account account, @RequestParam(name = "email") String email, @RequestParam(name = "pwd") String pwd,
    		HttpSession session, RedirectAttributes redirectAttributes, BindingResult br) {
    	
    	if(!br.hasErrors()) {
    		boolean login = accountService.login(email, pwd);
    		if(login == true) {
    		session.setAttribute("account", account);
    		System.out.println(account);
    		mav.setViewName("B/Account/index");
    		return mav;
    		}
    	}
			return null;

    }
    
    @GetMapping("/index")
    public ModelAndView index(ModelAndView mav) {
    	
    	mav.setViewName("B/Account/index");
    	
    	return mav;
    }
    
    //註冊帳號頁面
    @GetMapping("/register")
    public ModelAndView register(ModelAndView mav) {
    	
    	Account account = new Account();
    	
    	mav.getModel().put("doRegister", account);
    	
    	
    	mav.setViewName("B/Account/register");
    	
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
    
    @GetMapping("/doLogout")
    public ModelAndView doLogout(ModelAndView mav,HttpSession session, SessionStatus sessionStatus) {
    	
    	if(session.getAttribute("account") != null) {
    		session.removeAttribute("account");
		}
    	
		mav.setViewName("B/Account/login");
			return mav;
    }
    
    @PostMapping("/doLogout")
    public ModelAndView Returnlogin(ModelAndView mav) {
    	
    	mav.setViewName("B/Account/login");
    	return mav;
    }
    
    
//    @PostMapping("/logout")
//    public ModelAndView logout(ModelAndView mav, @Valid @ModelAttribute(name = "logout") String str,
//    		Account account, HttpSession session, SessionStatus sessionStatus ) {
//    	
//    	System.out.println(str);
//    	if(session.getAttribute("account") != null) {
//    		session.removeAttribute("account");
//			mav.setViewName("B/Account/login");
//			return mav;
//		}
//    	
//    	mav.setViewName("/B/Account/register");
//		return mav;		
//		
//    	
//    }
}


