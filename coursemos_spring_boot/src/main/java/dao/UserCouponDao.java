package dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.example.demo.domain.UserCoupon;

public interface UserCouponDao {
	
	List<UserCoupon> getUserCouponByUserId(int userId) throws DataAccessException;
	List<UserCoupon> getUserCouponByCouponId(int couponId) throws DataAccessException;
	int useUserCoupon(int userCouponId) throws DataAccessException;
	void insertUserCoupon(UserCoupon userCoupon) throws DataAccessException;
}
