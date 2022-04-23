package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Entity.Account;
import com.eeit40.design.Service.AccountService;
import com.eeit40.design.vo.AccountVO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RestController
public class AccountController {

//    @Autowired
//    private AccountService accountService;
    
    //登入帳號頁面
//    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
//    public ModelAndView login(
//    		ModelAndView modelAndView,
//    		@ModelAttribute Account account,
//    		@ModelAttribute(value = "MESSAGE") String message) {
//		
//    	modelAndView.setViewName("/B/Account/login");
//    	
//    	return modelAndView;
//    }
    
    //登入帳號中並存入session
//    @PostMapping("/login")
//    public String doLogin(@Valid @ModelAttribute List<Account> account,
//    		HttpSession session,RedirectAttributes redirectAttributes) {
//    	
//    	account = accountService.findAccountByemail(null);
//    	session.setAttribute("member", account);
//		return null;
//    	
//    	
//
//    }
    
    //註冊帳號頁面
//    @GetMapping("/register")
//    public ModelAndView register(
//    		ModelAndView mav,
//    		@ModelAttribute Account account) {
//    	
//    	mav.setViewName("/B/Account/register");
//    	
//    	return mav;
//    }
//    
    //註冊帳號中
//    @PostMapping("/register")
//    public ModelAndView doRegister(ModelAndView mav, @Valid @ModelAttribute(name = "doRegister")
//    HttpServletRequest request, Account account) {
//    	String email = request.getParameter("email");
//    	String pwd = request.getParameter("pwd");
//    	String checkpwd = request.getParameter("checkpwd");
//    	
//    	if(pwd.equals(checkpwd)) {
//    		if(registeremail(email) == true) {
//    			Account account1 = new Account();
//    			account1.setEmail(email);
//    			account1.setPwd(pwd);
//    			accountService.save(account1);
//    			
//    			mav.setViewName("/B/Account/login");
//    			return mav;
//    		}else {
//    			mav.setViewName("/B/Account/register");
//    			return mav;
//    		}
//    	}
//    	mav.setViewName("/B/Account/login");
//    	
//    	return mav;
//    }
//    
//    
//    public boolean registeremail(String email) {
//    	boolean a = true;
//    	if(accountService.findAccountByemail(email).isEmpty()) {
//    		return a;
//    	}else {
//    		return false;
//
//    	}
//    }
    
//    @RequestMapping("/logout")
//    public String logout(HttpSession session, SessionStatus sessionStatus ) {
//    	
//    	if(session.getAttribute("member") != null) {
//    		session.removeAttribute("member");
//			sessionStatus.setComplete();
//		}		
//		return "redirect:login";
//    	
//    }







}


