package com.eeit40.design.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.eeit40.design.Dao.ShoppingCardRepository;
import com.eeit40.design.Entity.DiscountCoupon;
import com.eeit40.design.Entity.ShoppingCard;

@Service
public class ShoppingCartService {

	@Autowired
	private ShoppingCardRepository shoppingCardDao;

	// 查詢
	public List<ShoppingCard> findShoppingCratByAccountId(int fkAccount) {

		List<ShoppingCard> cart = shoppingCardDao.findShoppingCratByAccountId(fkAccount);

		return cart;
	}

	// 修改
	public void editAmountByCartId(int tempMount, int id) {
		shoppingCardDao.editAmountByCartId(tempMount, id);
	}
	
	// 刪除
	public void deletById(int id) {
		shoppingCardDao.deleteById(id);
	}

	// 新增
	public void addProductToShoppingCart(int tempMount, int fkAccount, int fkProduct) {
		shoppingCardDao.addProductToShoppingCart(tempMount, fkAccount, fkProduct);
	}

	// 新增-確認購物車品項是否重複
	// 以產品id修改數量
	public void checkShoppingCart(int tempMount, int fkAccount, int fkProduct) {

		List<ShoppingCard> rs = shoppingCardDao.checkShoppingCart(fkAccount, fkProduct);

		// CollectionUtils搜尋資料庫
		if (!CollectionUtils.isEmpty(rs)) {
			int num = rs.get(0).getTempMount();
			int plusnum = num + tempMount;

			shoppingCardDao.editAmountByProduct(plusnum, fkAccount, fkProduct);
		} else {
			shoppingCardDao.addProductToShoppingCart(tempMount, fkAccount, fkProduct);
		}
	}
	
	// 以購物車id修改數量
//	public void checkShoppingCart(int fkAccount, int fkProduct, int tempMount, int id){
//
//			List<ShoppingCard> rs = shoppingCardDao.checkShoppingCart(fkAccount, fkProduct);
//
//			// CollectionUtils搜尋資料庫
//			if (!CollectionUtils.isEmpty(rs)) {
//				int num = rs.get(0).getTempMount();
//				int plusnum = num + tempMount;
//				
//				int cardId = rs.get(0).getId();
//
//				shoppingCardDao.editAmountByCartId(plusnum, cardId);
//				
//			} else {
//				shoppingCardDao.addProductToShoppingCart(tempMount, fkAccount, fkProduct);
//			}
//		}
	
	
	//查詢coupon使用日期
	public DiscountCoupon checkCouponDate(String coupon){
		
		List<DiscountCoupon> couponData= shoppingCardDao.checkCouponDate(coupon);
        
		//判斷資料庫是否有此coupon
		if(!CollectionUtils.isEmpty(couponData)) {
		   return couponData.get(0);
		}
		return null;
	}

	
}
