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


  @GetMapping(path = {"/B/","B/index.html"})
  public String indexPage() {
    return "B/demoPage/index";
  }

  @GetMapping("B/app-email.html")
  public String appEmailPage() {
    return "B/demoPage/app-email";
  }

  @GetMapping("B/app-event-calender.html")
  public String appEventCalenderPage() {
    return "B/demoPage/app-event-calender";
  }

  @GetMapping("B/app-profile.html")
  public String appProfilePage() {
    return "B/demoPage/app-profile";
  }

  @GetMapping("B/app-widget-card.html")
  public String appWidgetCardPage() {
    return "B/demoPage/app-widget-card";
  }

  @GetMapping("B/blank.html")
  public String blankPage() {
    return "B/demoPage/blank";
  }


  @GetMapping("B/chart-flot.html")
  public String chartFlotPage() {
    return "B/demoPage/chart-flot";
  }

  @GetMapping("B/font-themify.html")
  public String fontThemifyPage() {
    return "B/demoPage/font-themify";
  }

  @GetMapping("B/form-basic.html")
  public String formBasicPage() {
    return "B/demoPage/form-basic";
  }

  @GetMapping("B/form-validation.html")
  public String formValidationPage() {
    return "B/demoPage/form-validation";
  }

  @GetMapping("B/page-login.html")
  public String loginPage() {
    return "B/demoPage/page-login";
  }

  @GetMapping("B/page-register.html")
  public String registerPage() {
    return "B/demoPage/page-register";
  }

  @GetMapping("B/page-reset-password.html")
  public String resetPasswordPage() {
    return "B/demoPage/page-reset-password";
  }

  @GetMapping("B/table-basic.html")
  public String tableBasicPage() {
    return "B/demoPage/table-basic";
  }

  @GetMapping("B/table-export.html")
  public String tableExportPage() {
    return "B/demoPage/table-export";
  }

  @GetMapping("B/table-jsgrid.html")
  public String tableJsgridPage() {
    return "B/demoPage/table-jsgrid";
  }

  @GetMapping("B/table-row-select.html")
  public String tableRowSelectPage() {
    return "B/demoPage/table-row-select";
  }

  @GetMapping("B/uc-calendar.html")
  public String ucCalendarPage() {
    return "B/demoPage/uc-calendar";
  }

  @GetMapping("B/ui-alerts.html")
  public String uiAlertsPage() {
    return "B/demoPage/ui-alerts";
  }

  @GetMapping("B/ui-button.html")
  public String uiButtonPage() {
    return "B/demoPage/ui-button";
  }

  @GetMapping("B/ui-dropdown.html")
  public String uiDropdownPage() {
    return "B/demoPage/ui-dropdown";
  }

  @GetMapping("B/ui-images.html")
  public String uiImagesPage() {
    return "B/demoPage/ui-images";
  }

  @GetMapping("B/ui-navbar.html")
  public String uiNavbarPage() {
    return "B/demoPage/ui-navbar";
  }

  @GetMapping("B/ui-panels.html")
  public String uiPanelsPage() {
    return "B/demoPage/ui-panels";
  }

  @GetMapping("B/ui-progressbar.html")
  public String uiProgressbarPage() {
    return "B/demoPage/ui-progressbar";
  }

  @GetMapping("B/ui-timeline.html")
  public String uiTimelinePage() {
    return "B/demoPage/ui-timeline";
  }

  @GetMapping("B/ui-typography.html")
  public String uiTypographyPage() {
    return "B/demoPage/ui-typography";
  }

  @GetMapping("B/ui-user-card.html")
  public String uiUserCardPage() {
    return "B/demoPage/ui-user-card";
  }

  @GetMapping("B/vector-map.html")
  public String vectorMapPage() {
    return "B/demoPage/vector-map";
  }

}
