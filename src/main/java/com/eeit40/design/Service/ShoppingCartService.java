package com.eeit40.design.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.eeit40.design.Dao.DiscountCouponRepository;
import com.eeit40.design.Dao.ShoppingCardRepository;
import com.eeit40.design.Entity.DiscountCoupon;
import com.eeit40.design.Entity.ShoppingCard;

@Service
public class ShoppingCartService {

	@Autowired
	private ShoppingCardRepository shoppingCardDao;

	@Autowired
	private DiscountCouponRepository discountCoupon;

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

	// 查詢是否有coupon
	public DiscountCoupon checkCoupon(String coupon) {
		DiscountCoupon couponData = discountCoupon.checkCoupon(coupon);
		return couponData;
	}

	// 確認Coupon日期是否開始
	public DiscountCoupon checkCouponStarDate(String coupon) {
		DiscountCoupon couponStarDate = discountCoupon.checkCouponStarDate(coupon);
		return couponStarDate;
	}

	// 確認Coupon日期是否開始
	public DiscountCoupon checkCouponEndDate(String coupon) {
		DiscountCoupon couponEndDate = discountCoupon.checkCouponEndDate(coupon);
		return couponEndDate;
	}

}
