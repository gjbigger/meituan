package com.mt.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mt.dao.UserReceiveInfoDao;
import com.mt.pojo.UserReceiveInfo;

import utils.AssertUtil;


@Service
public class UserReceiveInfoService {

	@Resource
	private UserReceiveInfoDao userReceiveInfoDao;
	
	
	/**
	 * 添加收餐信息
	 * @param info
	 * @return
	 */
	public void insert(UserReceiveInfo userReceiveInfo) {
		int result = userReceiveInfoDao.insert(userReceiveInfo);
		AssertUtil.isTrue(result<1, "添加失败");
	}
	
	
	/**
	 * 删除收餐信息
	 * @param receiveId
	 * @return
	 */
	public void delete(Integer id) {
		int delete = userReceiveInfoDao.delete(id);
		AssertUtil.isTrue(delete<1, "删除失败");
	}
	
	
	/**
	 * 查询收餐信息
	 * @param userId
	 * @return
	 */
	public List<UserReceiveInfo> selectByUserId(Integer userId) {
		return userReceiveInfoDao.selectByUserId(userId);
	}
	
	
	/**
	 * 根据收餐信息id查询用户的送餐信息
	 * @return
	 */
	public UserReceiveInfo selectById(Integer id) {
		return userReceiveInfoDao.selectById(id);
	}
	
	
	/**
	 * 根据receiveId更新userReceiveInfo
	 * @param info
	 * @return
	 */
	public void update(UserReceiveInfo userReceiveInfo) {
		int update = userReceiveInfoDao.update(userReceiveInfo);
		AssertUtil.isTrue(update<1, "修改成功");
	}
}
