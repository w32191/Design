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

import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.Member;
import com.eeit40.design.Service.MemberService;

@RestController
public class MemberFrontController {

	@Autowired
	private MemberService memberService;
	
	
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
	
	
	
	
	
	
	
	
}
