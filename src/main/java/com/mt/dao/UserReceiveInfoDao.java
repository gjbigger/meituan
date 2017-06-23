package com.mt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mt.pojo.UserReceiveInfo;

@Repository
public interface UserReceiveInfoDao {

	/**
	 * 添加收餐信息
	 * @param info
	 * @return
	 */ 
	public int insert(UserReceiveInfo userReceiveInfo);
	
	
	/**
	 * 根据id删除收餐信息
	 * @param receiveId
	 * @return
	 */
	public int delete(@Param("id") Integer id);
	
	
	/**
	 * 根据用户id查询用户收餐信息的列表
	 * @param userId
	 * @return
	 */
	public List<UserReceiveInfo> selectByUserId(@Param("userId") Integer userId);
	
	
	/**
	 * 根据receiveId查询送餐信息
	 * @param receiveId
	 * @return
	 */
	public UserReceiveInfo selectById(@Param("id") Integer id);
	
	
	/**
	 * 跟新送餐信息
	 * @param info
	 * @return
	 */
	public int update(UserReceiveInfo userReceiveInfo);
}
