package com.eeit40.design.Controller.FrontSide;

import com.eeit40.design.Service.ActivityService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Dto.CheckoutCartListDto;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.OrderInformation;
import com.eeit40.design.Entity.OrderList;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Entity.ShoppingCard;
import com.eeit40.design.Service.OrderImformationService;
import com.eeit40.design.Service.ShoppingCartService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrderInformationController {

  @Autowired
  private ShoppingCartService shoppingCartService;

  @Autowired
  private OrderImformationService orderImformationService;

  @Autowired
  private ActivityService activityService;

  public int accountId() {

    Account account = new Account();
    account.setId(2);
    account.setEmail("admin@gmail.com");
    account.setPwd("admin");

    int fkAccount = account.getId();
    return fkAccount;

  }

  //傳送shoppingcart data 到 CheckoutCartListDto
  public List<CheckoutCartListDto> checkoutCartList() {

    // 假的account
//		Account account = new Account();
//		account.setId(1);
//		account.setEmail("admin@gmail.com");
//		account.setPwd("admin");

    List<ShoppingCard> cart = shoppingCartService.findShoppingCratByAccountId(accountId());
    List<CheckoutCartListDto> checkoutCartList = new ArrayList<>();

    Map<Integer, Integer> discountMap = activityService.getCurrentDiscountIntegerMap(cart);
    log.info(discountMap.toString());
    for (ShoppingCard sc : cart) {

      int cartId = sc.getId();
      String productName = sc.getFkProduct().getName();
      int productPrice;
      if (discountMap.containsKey(sc.getFkProduct().getId())) {
        double discount = (100 - discountMap.get(sc.getFkProduct().getId())) / 100.00;
        productPrice = (int)(sc.getFkProduct().getPrice() * discount);
      } else {
        productPrice = sc.getFkProduct().getPrice();
      }
      int quantity = sc.getTempMount();
      int tPrice = productPrice * quantity;

      CheckoutCartListDto checkoutCartListDto = new CheckoutCartListDto();

      checkoutCartListDto.setName(productName);
      checkoutCartListDto.setTempMount(quantity);
      checkoutCartListDto.setPrice(productPrice);
      checkoutCartListDto.setTprice(tPrice);

      checkoutCartList.add(checkoutCartListDto);

    }
    return checkoutCartList;
  }

  @ResponseBody
  @PostMapping("F/checkoutorderlist")
  public ModelAndView checkoutOrderList(ModelAndView mav, HttpServletRequest request,
      HttpSession session) {

    String discount = request.getParameter("discount");

    mav.getModel().put("discount", discount);
    mav.getModel().put("checkoutCartList", checkoutCartList());

    mav.setViewName("/F/shoppingCart/checkout");
//		mav.setViewName("redirect:/F/checkoutorderlist?fkAccount=" + accountId());
    return mav;
  }

  //checkout data存到db
  @ResponseBody
  @PostMapping("F/orderimforlist")
  public String addOrderImfor(ModelAndView mav, HttpServletRequest request) {

    // 假的account
    Account account = new Account();
    account.setId(4);

		//新增OrderInformation
		OrderInformation orderInfo = new OrderInformation();
		orderInfo.setFkAccount(account);
		orderInfo.setName(request.getParameter("recipient"));
		orderInfo.setPhone(request.getParameter("phone"));
		orderInfo.setAdd(request.getParameter("address"));
		orderInfo.setNotes(request.getParameter("notes"));
		orderInfo.setShipState("未付款");
//		System.out.println("note"+request.getParameter("notes"));
//		String coupondiscount = request.getParameter("discount");
//		int discount = Integer.valueOf(coupondiscount);
//		orderInfo.setDiscount(discount);

    //total有含discount
    String orderTotal = request.getParameter("orderTotal");
    int total = Integer.valueOf(orderTotal);
    orderInfo.setTotal(total);
    orderImformationService.addOrderImformation(orderInfo);

    //新增orderList
    List<ShoppingCard> cart = shoppingCartService.findShoppingCratByAccountId(accountId());
    List<OrderList> orderListDetail = new ArrayList<>();

    for (ShoppingCard sc : cart) {

      int orderMount = sc.getTempMount();
      Product fkProduct = sc.getFkProduct();
      int price = sc.getFkProduct().getPrice();
      int subTotal = price * orderMount;

      OrderList orderList = new OrderList();

      orderList.setOrderMount(orderMount);
      orderList.setFkProduct(fkProduct);
      orderList.setPrice(price);
      orderList.setSubTotal(subTotal);
      orderList.setFkOrderImformation(orderInfo);
      orderListDetail.add(orderList);
      orderImformationService.addOrderList(orderList);

    }

    //訂單成立後刪除購物車
    shoppingCartService.deleteByAccountId(accountId());

    return "success";

  }


  //會員訂單查詢
  @GetMapping("F/orderrecord")
  public ModelAndView selectByAccountId(ModelAndView mav) {

    mav.setViewName("F/shoppingCart/orderRecord");

    List<OrderInformation> orderRecord = orderImformationService.selectByAccountId(accountId());
    System.out.println(orderRecord);

    mav.getModel().put("orderRecord", orderRecord);
    return mav;
  }

  //會員訂單明細查詢
  @ResponseBody
  @GetMapping("F/orderProduct")
  public List<OrderList> selectByImforId(HttpServletRequest request) {

    String fkOrderImformation = request.getParameter("fkOrderImformation");

    int imfroId = Integer.valueOf(fkOrderImformation);

    List<OrderList> orderProduct = orderImformationService.selectByImforId(imfroId);

    return orderProduct;
  }

}
