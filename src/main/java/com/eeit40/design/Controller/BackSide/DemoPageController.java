package com.eeit40.design.Controller.BackSide;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 這隻DemoPageController是放，模板demo用的 url路徑
 * 給大家 測試demo畫面用的
 *
 * */

@Controller("BackDemoPageController")
public class DemoPageController {


  @GetMapping("BackSide/index.html")
  public String indexPage() {
    return "BackSide/demoPage/index";
  }

  @GetMapping("BackSide/app-email.html")
  public String appEmailPage() {
    return "BackSide/demoPage/app-email";
  }

  @GetMapping("BackSide/app-event-calender.html")
  public String appEventCalenderPage() {
    return "BackSide/demoPage/app-event-calender";
  }

  @GetMapping("BackSide/app-profile.html")
  public String appProfilePage() {
    return "BackSide/demoPage/app-profile";
  }

  @GetMapping("BackSide/app-widget-card.html")
  public String appWidgetCardPage() {
    return "BackSide/demoPage/app-widget-card";
  }

  @GetMapping("BackSide/blank.html")
  public String blankPage() {
    return "BackSide/demoPage/blank";
  }

  @GetMapping("BackSide/chart-flot.html")
  public String chartFlotPage() {
    return "BackSide/demoPage/chart-flot";
  }

  @GetMapping("BackSide/font-themify.html")
  public String fontThemifyPage() {
    return "BackSide/demoPage/font-themify";
  }

  @GetMapping("BackSide/form-basic.html")
  public String formBasicPage() {
    return "BackSide/demoPage/form-basic";
  }

  @GetMapping("BackSide/form-validation.html")
  public String formValidationPage() {
    return "BackSide/demoPage/form-validation";
  }

  @GetMapping("BackSide/page-login.html")
  public String loginPage() {
    return "BackSide/demoPage/page-login";
  }

  @GetMapping("BackSide/page-register.html")
  public String registerPage() {
    return "BackSide/demoPage/page-register";
  }

  @GetMapping("BackSide/page-reset-password.html")
  public String resetPasswordPage() {
    return "BackSide/demoPage/page-reset-password";
  }

  @GetMapping("BackSide/table-basic.html")
  public String tableBasicPage() {
    return "BackSide/demoPage/table-basic";
  }

  @GetMapping("BackSide/table-export.html")
  public String tableExportPage() {
    return "BackSide/demoPage/table-export";
  }

  @GetMapping("BackSide/table-jsgrid.html")
  public String tableJsgridPage() {
    return "BackSide/demoPage/table-jsgrid";
  }

  @GetMapping("BackSide/table-row-select.html")
  public String tableRowSelectPage() {
    return "BackSide/demoPage/table-row-select";
  }

  @GetMapping("BackSide/uc-calendar.html")
  public String ucCalendarPage() {
    return "BackSide/demoPage/uc-calendar";
  }

  @GetMapping("BackSide/ui-alerts.html")
  public String uiAlertsPage() {
    return "BackSide/demoPage/ui-alerts";
  }

  @GetMapping("BackSide/ui-button.html")
  public String uiButtonPage() {
    return "BackSide/demoPage/ui-button";
  }

  @GetMapping("BackSide/ui-dropdown.html")
  public String uiDropdownPage() {
    return "BackSide/demoPage/ui-dropdown";
  }

  @GetMapping("BackSide/ui-images.html")
  public String uiImagesPage() {
    return "BackSide/demoPage/ui-images";
  }

  @GetMapping("BackSide/ui-navbar.html")
  public String uiNavbarPage() {
    return "BackSide/demoPage/ui-navbar";
  }

  @GetMapping("BackSide/ui-panels.html")
  public String uiPanelsPage() {
    return "BackSide/demoPage/ui-panels";
  }

  @GetMapping("BackSide/ui-progressbar.html")
  public String uiProgressbarPage() {
    return "BackSide/demoPage/ui-progressbar";
  }

  @GetMapping("BackSide/ui-timeline.html")
  public String uiTimelinePage() {
    return "BackSide/demoPage/ui-timeline";
  }

  @GetMapping("BackSide/ui-typography.html")
  public String uiTypographyPage() {
    return "BackSide/demoPage/ui-typography";
  }

  @GetMapping("BackSide/ui-user-card.html")
  public String uiUserCardPage() {
    return "BackSide/demoPage/ui-user-card";
  }

  @GetMapping("BackSide/vector-map.html")
  public String vectorMapPage() {
    return "BackSide/demoPage/vector-map";
  }

}
