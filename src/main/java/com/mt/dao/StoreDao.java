package com.mt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mt.pojo.Store;
import com.mt.query.StoreQuery;

@Repository
public interface StoreDao {

	/**
	 * 添加商店信息   地址
	 * @param store
	 * @return
	 */
	public int insert(Store store);
	
	
	
	
	
	/**
	 * 更新相应的字段
	 * @param store
	 * @return
	 */
	public int update(Store store);
	
	
	
	
	
	/**
	 * 营业和打烊的设置	map   storeId--?	num--? 1营业  0休息
	 * @param num
	 * @return
	 */
	public int updateSetOpenOrClose(@Param("id") Integer id,@Param("openOrClose") Integer openOrClose);
	
	
	/**
	 * 更新月销量和平均送餐时间
	 * @param map
	 * @return
	 */
	public int updateSetMonthSellAndStoreAvgSendTime(@Param("id") Integer id,@Param("monthSell") Integer monthSell,@Param("avgSendTime") Double avgSendTime);
	
	
	/**
	 * 根据商店名称查询商店信息
	 * @param storeAddress
	 * @return
	 */
	public Store selectByStoreLoginName(@Param("storeLoginName") String storeLoginName);
	
	
	/**
	 * 根据商店id查询商店信息
	 * @param storeId
	 * @return
	 */
	public Store selectById(@Param("id") Integer id);
	
	
	/**
	 * 动态查询并分页
	 * @param map	openOrClose--	storeName--		offset--  pageSize--
	 * @return
	 */
	public List<Store> selectByParams(StoreQuery storeQuery);
	
	
	
}
