package com.eeit40.design.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit40.design.Dao.ShoppingCardRepository;
import com.eeit40.design.Entity.ShoppingCard;

@Service
public class ShoppingCartService {

	@Autowired
	private ShoppingCardRepository shoppingCardDao;

	//查詢
	public List<ShoppingCard> findShoppingCratByAccountId(int fkAccount) {

		List<ShoppingCard> cart = shoppingCardDao.findShoppingCratByAccountId(fkAccount);

		return cart;
	}
	
	//修改
	public void editAmountByCartId(int tempMount,int id) {
		shoppingCardDao.editAmountByCartId(tempMount, id);
	}

	//刪除
	public void deletById(int id) {
		shoppingCardDao.deleteById(id);
	}
	
	//新增
	public void addProductToShoppingCart(int tempMount,int fkAccount,int fkProduct) {
		shoppingCardDao.addProductToShoppingCart(tempMount, fkAccount, fkProduct);
	}
	
	
	
}
