package com.mt.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mt.pojo.User;
import com.mt.service.StoreService;
import com.mt.service.UserService;

import utils.ConstData;
import utils.MessageModel;

@Controller
@RequestMapping("user")
public class UserController {

	@Resource
	private UserService userService;
	@Resource
	private StoreService storeService;
	
	
	/**
	 * 用户登陆
	 * @return
	 */
	@RequestMapping("login")
	@ResponseBody
	public MessageModel login(HttpServletRequest req, String userName, String userPwd) {
		User login = userService.login(userName, userPwd);
		
		req.getSession().setAttribute("user", login);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("登录成功");
		return mm;
	}
	
	
	
	/**
	 * 注册
	 * @return
	 */
	@RequestMapping("register")
	@ResponseBody
	public MessageModel register(String userName, String userPwd) {
		userService.register(userName, userPwd);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("注册成功");
		return mm;
	}
	
	
	/**
	 * 登出
	 * @return
	 */
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest req) {
		req.getSession().setAttribute("user", null);
		req.getSession().setAttribute("stores", null);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/user_login");
		return mv;
	}
}
