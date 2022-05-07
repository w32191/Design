package com.eeit40.design.Controller.FrontSide;

import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.Member;
import com.eeit40.design.Service.AccountService;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RestController
public class AccountFrontController {

  @Autowired
  private AccountService accountService;

  //登入帳號頁面
  @GetMapping("/F/Flogin")
  public ModelAndView login(ModelAndView mav, @ModelAttribute("Flogin") Account account) {

    mav.setViewName("F/Account/Flogin");

    return mav;
  }

  //登入帳號中並存入session
  @PostMapping("/F/Flogin")
  public ModelAndView doLogin(ModelAndView mav,
      @Valid @ModelAttribute(name = "Flogin") Account account,
      BindingResult br, HttpSession session) {
    mav.setViewName("F/Account/Flogin");

    if (!br.hasErrors()) {
      Account login = accountService.login(account.getEmail(), account.getPwd());
      if (login != null) {
        session.setAttribute("Faccount", login);
        System.out.println(login);
        mav.setViewName("/F/Activity/ActivityIndex");
        return mav;
      }
      br.addError(new FieldError("Flogin","email","無此帳號"));
      return mav;
    }
    return mav;

  }

  @GetMapping("/F/Findex")
  public ModelAndView index(ModelAndView mav) {

    mav.setViewName("F/Account/Findex");

    return mav;
  }

  //註冊帳號頁面
  @GetMapping("/F/Fregister")
  public ModelAndView register(ModelAndView mav) {

    Account account = new Account();

    mav.getModel().put("doRegister", account);

    mav.setViewName("F/Account/Fregister");

    return mav;
  }

  //註冊帳號中
  @PostMapping("/F/Fregister")
  public ModelAndView doRegister(ModelAndView mav, @Valid @ModelAttribute(name = "FdoRegister")
  Account account, @RequestParam(name = "email") String email,
      @RequestParam(name = "pwd") String pwd,
      HttpSession session, BindingResult br) {

    if (!br.hasErrors()) {
      Account accountregister = accountService.register(account);
      session.setAttribute("member", accountregister);
      System.out.println(accountregister);

      Member member = new Member();
      mav.addObject(member);
      mav.setViewName("F/Member/Fmemberregister");

      return mav;
    }
    return null;

  }


  @GetMapping("/F/Fdologout")
  public ModelAndView doLogout(HttpSession session, ModelAndView mav, SessionStatus sessionStatus) {

    session.invalidate();

    Account account = new Account();

    mav.addObject("login", account);
    mav.setViewName("F/Account/Flogin");
    return mav;

  }
}


