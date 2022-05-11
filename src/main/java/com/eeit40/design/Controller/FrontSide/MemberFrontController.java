package com.eeit40.design.Controller.FrontSide;

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

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.Member;
import com.eeit40.design.Service.AccountService;
import com.eeit40.design.Service.MemberService;

@RestController
public class MemberFrontController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AccountService accountService;
	
	
	@GetMapping("/F/Fmemberregister")
	public ModelAndView member(ModelAndView mav) {
		
		Member member = new Member();
		
		mav.getModel().put("memberregister", member);
		
		mav.setViewName("F/Member/Fmemberregister");
		
		return mav;
	}
	
	@PostMapping("/F/Fmemberregister")
	public ModelAndView memberregister(ModelAndView mav, @Valid @ModelAttribute(name = "Fmemberregister") Member member,
		@RequestParam(name = "names") String names, @RequestParam(name = "phone") String phone,
		@RequestParam(name = "address") String address,HttpSession session , BindingResult br) {
		
		if(!br.hasErrors()) {
			Account accre = (Account) session.getAttribute("member");
			member.setFkAccount(accre);
			memberService.memberRegister(member);
			System.out.println(member);
			if(session != null) {
				session.invalidate();
				System.out.println(session);
			}
			mav.setViewName("F/Account/Flogin");
			return mav;
		}
		return null;
		
	}
	@GetMapping("/F/Fmemberupdate")
	public ModelAndView memberupdatejsp(ModelAndView mav,  HttpSession session) {
		
		Account acc = (Account) session.getAttribute("Faccount");
		Integer accid = acc.getId();
		Member member = memberService.findMemberById(accid);
		
		
		mav.getModel().put("Fmemberupdate", member);
		
		mav.setViewName("F/Member/Fmember");
		
		return mav;
	}
	
	
	
	
	@PostMapping("/F/Fmemberupdate")
	public ModelAndView Fmemberupdate(ModelAndView mav, @Valid @ModelAttribute(name = "Fmemberupdate") Member member, Account account,
			HttpSession session, BindingResult br)  {

		
		
		if(!br.hasErrors()) {
			Account acc = (Account) session.getAttribute("Faccount");
			Integer accid = acc.getId();
			Integer accpre = acc.getPermission();
			String accpwd = acc.getPwd();
			Member member1 = memberService.findMemberById(accid);
			
			//前台 member 修改
			member.setId(member1.getId());
			member.setFkAccount(acc);
			Member newMember = memberService.save(member);
			
			//前台 account 修改
			Account accountid = accountService.findAccountById(accid);
			account.setId(accountid.getId());
			account.setPermission(accpre);
			account.setPwd(accpwd);
			Account newAccount = accountService.save(account);
			session.setAttribute("Faccount", newAccount);
			
			mav.addObject("Fmemberupdate",newAccount);
			mav.addObject("Fmemberupdate",newMember);
			mav.setViewName("F/Member/Fmember");
			return mav;
		}
		
		return null;
		
		
	}
	
	
	
	
	
	
	
	
}
