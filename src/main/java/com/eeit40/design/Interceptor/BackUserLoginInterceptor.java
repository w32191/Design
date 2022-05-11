package com.eeit40.design.Interceptor;

import com.eeit40.design.Entity.Account;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class BackUserLoginInterceptor implements HandlerInterceptor {


  // 在請求處理之前進行呼叫(Controller方法呼叫之前)
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
//    System.out.println("執行了攔截器的preHandle方法");
    try {
      HttpSession session = request.getSession();
      //統一攔截（查詢當前session是否存在user）(這裡user會在每次登入成功後，寫入session)
      Account account = (Account) session.getAttribute("Baccount");
      if (account != null) {
        return true;
      }
      request.setAttribute("errorMsg", "請先登入！");
      RequestDispatcher dispatcher = request.getRequestDispatcher("/B/login");
      dispatcher.forward( request, response );
//      response.sendRedirect(request.getContextPath() + "/B/login");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return false;
    //如果設定為false時，被請求時，攔截器執行到此處將不會繼續操作
    //如果設定為true時，請求將會繼續執行後面的操作
  }

  // 請求處理之後進行呼叫，但是在檢視被渲染之前（Controller方法呼叫之後）
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
  }


  // 整個請求結束之後被呼叫，也就是在DispatchServlet渲染了對應的檢視之後執行（主要用於進行資源清理工作）
  @Override
  public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
      Object handler, Exception ex) throws Exception {
    HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
  }
}
