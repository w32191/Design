package com.eeit40.design.Config;

import com.eeit40.design.Interceptor.BackUserLoginInterceptor;
import com.eeit40.design.Interceptor.FrontUserLoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class LoginConfig implements WebMvcConfigurer {

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    //註冊TestInterceptor攔截器
    InterceptorRegistration registrationFront = registry.addInterceptor(new FrontUserLoginInterceptor());
    registrationFront.addPathPatterns("/F/shoppingcart"); // 攔截 路徑
    registrationFront.excludePathPatterns(    // 新增不攔截路徑
        "/F/Flogin",                    // 登入路徑
        "/F/*.html",                // html靜態資源
        "/static/**"              // 靜態資源


    );

    InterceptorRegistration registrationBack = registry.addInterceptor(new BackUserLoginInterceptor());
    registrationBack.addPathPatterns("/B/*"); // 攔截 路徑
    registrationBack.excludePathPatterns(    // 新增不攔截路徑
        "/B/login",                    // 登入路徑
        "/B/register",                // 註冊路徑
        "/B/*.html",                // html靜態資源
        "/static/**"              // 靜態資源
    );


  }

}
