package com.mt.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mt.pojo.User;

@Repository
public interface UserDao {

	/**
	 * 添加用户   用户名 密码
	 * @param user
	 * @return
	 */
	public int insert(User user);
	
	
	
	
	/**
	 * 用用户名查询用户
	 * @param userName
	 * @return
	 */
	public User selectByUserName(@Param("userName") String userName);
	
}
