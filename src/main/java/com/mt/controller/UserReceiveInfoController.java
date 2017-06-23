package com.mt.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mt.pojo.User;
import com.mt.pojo.UserReceiveInfo;
import com.mt.service.UserReceiveInfoService;

import utils.ConstData;
import utils.MessageModel;

@Controller
@RequestMapping("userReceiveInfo")
public class UserReceiveInfoController {

	@Resource
	private UserReceiveInfoService userReceiveInfoService;
	
	
	
	/**
	 * 添加
	 * @return
	 */
	@RequestMapping("insert")
	@ResponseBody
	public MessageModel insert(UserReceiveInfo userReceiveInfo, HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		
		userReceiveInfo.setUserId(user.getId());
		userReceiveInfoService.insert(userReceiveInfo);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("添加成功");
		return mm;
	}
	
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public MessageModel delete(Integer id) {
		userReceiveInfoService.delete(id);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("删除成功");
		return mm;
	}
	
	
	
	/**
	 * 添加
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public MessageModel update(UserReceiveInfo userReceiveInfo) {
		userReceiveInfoService.update(userReceiveInfo);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("修改成功");
		return mm;
	}
	
	
	/**
	 * 根据userId查询
	 * @return
	 */
	@RequestMapping("selectByUserId")
	@ResponseBody
	public List<UserReceiveInfo> selectByUserId(HttpServletRequest req) {
		User user =(User) req.getSession().getAttribute("user");
		
		return userReceiveInfoService.selectByUserId(user.getId());
		
	}
	
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	@RequestMapping("selectById")
	@ResponseBody
	public UserReceiveInfo selectById(Integer id) {
		return userReceiveInfoService.selectById(id);
	}
}
