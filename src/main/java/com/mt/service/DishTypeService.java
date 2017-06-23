package com.mt.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mt.dao.DishTypeDao;
import com.mt.pojo.DishType;

import utils.AssertUtil;


@Service
public class DishTypeService {
	
	@Autowired
	private DishTypeDao dishTypeDao;
	
	
	/**
	 * 添加一个类别
	 * */
	public 	void insert(DishType dishType){
		DishType temp = dishTypeDao.selectByStoreIdAndName(dishType.getName(), dishType.getStoreId());
		AssertUtil.isTrue(temp!=null, "类别名已存在");
		
		int insert = dishTypeDao.insert(dishType);
		AssertUtil.isTrue(insert<1, "添加菜品类别失败");
	}
	
	/**
	 * 更新菜品类别
	 * */
	public void update(DishType dishType){
		DishType temp = dishTypeDao.selectByStoreIdAndName(dishType.getName(), dishType.getStoreId());
		AssertUtil.isTrue(temp!=null && !temp.getId().equals(dishType.getId()), "菜品名不能重复");
		
		int result = dishTypeDao.update(dishType);
		AssertUtil.isTrue(result<1, "更新菜品类别失败");
	}
	
	
	/**
	 * 删除菜品类别
	 * @param typeId
	 * @return
	 */
	public void delete(Integer id){
		AssertUtil.isTrue(dishTypeDao.delete(id)<1, "删除类别失败");
	}
	
	
	
	/**
	 * 根据storeId查询类别
	 * @param dishType
	 * @return
	 */
	public List<DishType> selectByStoreId(Integer storeId){
		return dishTypeDao.selectByStoreId(storeId);
	}
	
	
	/**
	 * 查询，用于combobox
	 * @return
	 */
	public List<Map<String, Object>> selectForCombobox(Integer storeId) {
		List<DishType> list = dishTypeDao.selectByStoreId(storeId);
		
		List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
		for(DishType temp : list) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("value", temp.getId());
			map.put("text", temp.getName());
			listMap.add(map);
		}
		
		return listMap;
	}
	
}
