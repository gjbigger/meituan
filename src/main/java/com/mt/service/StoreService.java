package com.mt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mt.dao.StoreDao;
import com.mt.pojo.Store;
import com.mt.query.StoreQuery;

import utils.AssertUtil;

@Service
public class StoreService {
	
	@Autowired
	private StoreDao storeDao;
	
	
	
	/**
	 * 登陆
	 * @param storeName
	 * @param storePassword
	 */
	public Store login(String storeLoginName, String storePwd) {
		Store store = storeDao.selectByStoreLoginName(storeLoginName);
		AssertUtil.isTrue(store==null, "该商家不存在");
		
		AssertUtil.isTrue(!store.getStorePwd().equals(storePwd), "密码错误");
		return store;
	}
	
	
	
	/**
	 * 注册
	 * @param store
	 */
	public void register(String storeLoginName, String storePwd){
		Store temp = storeDao.selectByStoreLoginName(storeLoginName);
		AssertUtil.isTrue(temp!=null, "商家登录名已存在");
		
		Store store = new Store();
		store.setStoreLoginName(storeLoginName);
		store.setStorePwd(storePwd);
		
		/*
		 * name,
			address,
			tel,
			hours,
			leastMoney,
			fee,
			notice,
			avgSendTime,
			openOrClose,
			monthSell,
			star
		 */
		store.setOpenOrClose(0);
		store.setStar(0);
		store.setMonthSell(0);
		store.setAvgSendTime(0.0);
		
		int result = storeDao.insert(store);
		AssertUtil.isTrue(result<1, "商家注册失败");
	}
	
	
	/**
	 * 更新商家数据
	 * @param store
	 */
	public void update(Store store){
		int result = storeDao.update(store);
		AssertUtil.isTrue(result<1, "更新商家数据失败");
	}
	
	
	/**
	 * 开张或者打烊
	 * @param id
	 * @param openOrClose
	 */
	public void updateSetOpenOrClose(Integer id, Integer openOrClose) {
		int result = storeDao.updateSetOpenOrClose(id, openOrClose);
		AssertUtil.isTrue(result<1, "开张或者打烊失败");
	}
	
	
	/**
	 * 根据id查询商店信息
	 * @param id
	 * @return
	 */
	public Store selectById(Integer id) {
		return storeDao.selectById(id);
	}
	
	
	/**
	 * 查询
	 * @param storeQuery
	 * @return
	 */
	public List<Store> selectByParams(StoreQuery storeQuery) {
		return storeDao.selectByParams(storeQuery);
	}
	
}
