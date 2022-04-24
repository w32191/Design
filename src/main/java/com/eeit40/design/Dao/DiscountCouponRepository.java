package com.eeit40.design.Dao;

import com.eeit40.design.Entity.DiscountCoupon;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DiscountCouponRepository extends JpaRepository<DiscountCoupon, Integer> {
	
	//查詢是否有coupon
		@Query(value="SELECT * FROM discount_coupon WHERE coupon=:coupon",nativeQuery = true)
		public DiscountCoupon checkCoupon(@Param("coupon") String coupon);
		
	//確認Coupon日期是否開始
		@Query(value="SELECT * FROM discount_coupon WHERE coupon=:coupon AND start_date <= GETDATE()",nativeQuery = true)
		public DiscountCoupon checkCouponStarDate(@Param("coupon") String coupon);
		
	//確認Coupon日期是否結束
		@Query(value="SELECT * FROM discount_coupon WHERE coupon=:coupon AND start_date <= GETDATE() AND end_date >= GETDATE()",nativeQuery = true)
		public DiscountCoupon checkCouponEndDate(@Param("coupon") String coupon);
		
	
}
