package com.eeit40.design.Controller.BackSide;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
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
			 BindingResult br,
		@RequestParam(name = "names") String names, @RequestParam(name = "phone") String phone,
		@RequestParam(name = "address") String address, Account id, HttpSession session ) {
		
		if(!br.hasErrors()) {
			Account accre = (Account) session.getAttribute("member");
			member.setFkAccount(accre);
			member.setServiceArea(-1);
			Member memberResult = memberService.memberRegister(member);
			System.out.println(member);
			if(session != null) {
				session.invalidate();
				System.out.println(session);
			}
			if(memberResult != null) {
				mav.addObject("RegisterResult", "Success");
			}else {
				mav.addObject("RegisterResult", "Error");
			}
			
			mav.setViewName("B/Account/login");
			return mav;
		}
		return null;
		
	}
	
	@GetMapping("/B/memberupdate")
	public ModelAndView memberupdatejsp(ModelAndView mav,  HttpSession session) {
		
		Account acc = (Account) session.getAttribute("Baccount");
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
			Account acc = (Account) session.getAttribute("Baccount");
			Integer accid = acc.getId();
			Integer accpre = acc.getPermission();
			String accpwd = acc.getPwd();
			Member member1 = memberService.findMemberById(accid);
			Integer memser = member1.getServiceArea();
			
			member.setId(member1.getId());
			member.setFkAccount(acc);
			member.setServiceArea(memser);
			Member newMember = memberService.save(member);
			
			Account accountid = accountService.findAccountById(accid);
			account.setId(accountid.getId());
			account.setPermission(accpre);
			account.setPwd(accpwd);
			Account newAccount = accountService.save(account);
			session.setAttribute("Baccount", newAccount);
			
			mav.addObject("memberupdate",newAccount);
			mav.addObject("memberupdate",newMember);
			mav.setViewName("B/Member/member");
			return mav;
		}
		
		return null;
		
	}
	
	
	@GetMapping("/B/add2")
	public ModelAndView addMemberPage(ModelAndView mav) {
		
		Member message = new Member(); 
		mav.getModel().put("Member", message);
		
		Member lastmag = memberService.getLastest();
		mav.getModel().put("lastmag", lastmag);
		
		mav.setViewName("/B/Member/showall");
		return mav;
		
		
	}
	
	
	
	@GetMapping("/B/view")
	public ModelAndView viewMember(ModelAndView mav, @RequestParam(name= "p", defaultValue = "1") Integer PageNumber) {
		
		Page<Member> page = memberService.findByPage(PageNumber);
		
		
		mav.getModel().put("page", page);
		mav.setViewName("/B/Member/showall");
		
		return mav;
		
	}
	
	
	
	@GetMapping("/B/edit")
	public ModelAndView edit(ModelAndView mav, Model model, @RequestParam(name = "id") Integer id, HttpSession session) {
		Member mem = memberService.findMemberById(id);
		
		model.addAttribute("member", mem);
		session.setAttribute("Bmember", mem);
		mav.setViewName("/B/Member/edit");
		
		return mav;
	}
	
	@PostMapping("/B/edit")
	public ModelAndView edit(ModelAndView mav, Model model, @ModelAttribute(name = "editMember") Member inputMember,
			@RequestParam("accountId") Integer accountId ,HttpSession session ) {
		

		
		Account account  = new Account();
		account.setId(accountId);
		
		Member oldMember = (Member) session.getAttribute("Bmember");

		inputMember.setId(oldMember.getId());
		inputMember.setFkAccount(account);
		
		
		memberService.save(inputMember);
		mav.setViewName("redirect:/B/view");
		
		return mav;
		
	}
	
	
	
	
	
	
	
	
	
}