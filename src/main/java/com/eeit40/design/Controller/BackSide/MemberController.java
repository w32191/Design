package com.eeit40.design.Controller.BackSide;

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
import com.eeit40.design.Service.MemberService;

@RestController
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
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
		@RequestParam(name = "address") String address, @RequestParam(name = "serviceArea") String serviceArea, Account id,BindingResult br) {
		
		if(!br.hasErrors()) {
			memberService.memberRegister(member, id);
			
			mav.setViewName("B/Account/login");
			return mav;
		}
		return null;
		
	}
	
	
	
	
	
	
	
	
}
