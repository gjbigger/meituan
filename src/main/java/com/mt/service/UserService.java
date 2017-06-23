package com.mt.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mt.dao.UserDao;
import com.mt.pojo.User;

import utils.AssertUtil;

@Service
public class UserService {

	@Resource
	private UserDao userDao;
	
	
	
	/**
	 * 登陆判断方法  
	 * @param userName
	 * @param userPwd
	 */
	public User login(String userName, String userPwd) {
		User temp = userDao.selectByUserName(userName);
		AssertUtil.isTrue(temp == null, "用户不存在");
		
		AssertUtil.isTrue(!temp.getUserPwd().equals(userPwd), "密码不匹配");
		return temp;
	}
	
	
	
	/**
	 * 用户注册
	 * @param userName
	 * @param userPwd
	 */
	public void register(String userName, String userPwd) {
		User temp = userDao.selectByUserName(userName);
		AssertUtil.isTrue(temp!=null, "用户名已存在");
		
		User user = new User();
		user.setUserName(userName);
		user.setUserPwd(userPwd);
		int result = userDao.insert(user);
		AssertUtil.isTrue(result<1, "注册失败");
	}
	
}
