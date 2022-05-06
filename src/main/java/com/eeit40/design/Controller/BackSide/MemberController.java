package com.eeit40.design.Controller.BackSide;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.Member;
import com.eeit40.design.Service.AccountService;
import com.eeit40.design.Service.MemberService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AccountService accountService;
	
	@GetMapping("/B/memberregister")
	public ModelAndView member(ModelAndView mav) {
		
		Member member = new Member();
		
		mav.getModel().put("memberregister", member);
		
		mav.setViewName("B/Member/memberregister");
		
		return mav;
	}
	
	@PostMapping("/B/memberregister")
	public ModelAndView memberregister(ModelAndView mav, @Valid @ModelAttribute(name = "memberregister") Member member,
		@RequestParam(name = "names") String names, @RequestParam(name = "phone") String phone,
		@RequestParam(name = "address") String address, Account id, HttpSession session , BindingResult br) {
		
		if(!br.hasErrors()) {
			Account accre = (Account) session.getAttribute("member");
			member.setFkAccount(accre);
			memberService.memberRegister(member);
			System.out.println(member);
			if(session != null) {
				session.invalidate();
				System.out.println(session);
			}
			mav.setViewName("B/Account/login");
			return mav;
		}
		return null;
		
	}
	
	@GetMapping("/B/memberupdate")
	public ModelAndView memberupdatejsp(ModelAndView mav,  HttpSession session) {
		
		Account acc = (Account) session.getAttribute("account");
		Integer accid = acc.getId();
		Member member = memberService.findMemberById(accid);
		
		
		mav.getModel().put("memberupdate", member);
		
		mav.setViewName("B/Member/member");
		
		return mav;
	}
	
	
	
	
	@PostMapping("/B/memberupdate")
	public ModelAndView memberupdate(ModelAndView mav, @Valid @ModelAttribute(name = "memberupdate") Member member, Account account,
			HttpSession session, BindingResult br)  {

		
		
		if(!br.hasErrors()) {
			Account acc = (Account) session.getAttribute("account");
			Integer accid = acc.getId();
			Integer accpre = acc.getPermission();
			Member member1 = memberService.findMemberById(accid);
			
			member.setId(member1.getId());
			member.setFkAccount(acc);
			Member newMember = memberService.save(member);
			
			Account accountid = accountService.findAccountById(accid);
			account.setId(accountid.getId());
			account.setPermission(accpre);
			Account newAccount = accountService.save(account);
			
			mav.addObject("memberupdate",newAccount);
			mav.addObject("memberupdate",newMember);
			mav.setViewName("B/Member/member");
			return mav;
		}
		
		return null;
		
		
	}
	
	
	
	
	
	
	
	
}
