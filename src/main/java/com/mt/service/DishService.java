package com.mt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mt.dao.DishDao;
import com.mt.dto.DishDto;
import com.mt.pojo.Dish;
import com.mt.query.DishQuery;

import utils.AssertUtil;

@Service
public class DishService {
	
	@Autowired
	private DishDao dishDao;
	
	
	/**
	 * 添加菜品
	 * @param dish
	 * @returno
	 */
	public void insert(Dish dish){
		Dish temp = dishDao.selectByNameAndStoreId(dish.getName(), dish.getStoreId());
		AssertUtil.isTrue(temp != null, "菜品名不能重复");
		
		dish.setMonthSales(0);
		
		
		int result = dishDao.insert(dish);
		AssertUtil.isTrue(result<1, "添加菜品失败");
		
	}
	
	
	
	/**
	 * 更新菜品
	 * @param dish
	 * @return
	 */
	public void update(Dish dish){
		Dish temp = dishDao.selectByNameAndStoreId(dish.getName(), dish.getStoreId());
		if(temp != null) {
			AssertUtil.isTrue(!temp.getId().equals(dish.getId()), "菜品名已存在");
		}
		
		int result = dishDao.update(dish);
		AssertUtil.isTrue(result<1, "更新菜品失败");
	}
	
	
	/**
	 * 删除菜品
	 * @param dishId
	 * @return
	 */
	public void	delete(Integer id){
		AssertUtil.isTrue(dishDao.delete(id)<1, "删除菜品失败");
	}
	
	
	/**
	 * 根据storeId查询菜品
	 * @param storeId
	 * @return
	 */
	public List<Dish> selectByStoreId(Integer storeId){
		return dishDao.selectByStoreId(storeId);
	}
	
	
	/**
	 * 根据类别查询菜品
	 * @param typeId
	 * @return
	 */
	public List<Dish> selectByTypeId(Integer typeId){
		return dishDao.selectByTypeId(typeId);
	}
	
	
	/**
	 * 查询菜品
	 * @param dishQuery
	 * @return
	 */
	public Map<String, Object> selectByParam(DishQuery dishQuery) {
		PageHelper.startPage(dishQuery.getPage(), dishQuery.getRows());
		List<DishDto> list = dishDao.selectByParam(dishQuery);
		PageInfo<DishDto> pageInfo = new PageInfo<DishDto>(list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageInfo.getTotal());
		map.put("rows", pageInfo.getList());
		map.put("currPage", dishQuery.getPage());
		map.put("pages",(pageInfo.getTotal()+dishQuery.getPage()-1)/dishQuery.getPage());
		return map;
	}
	
	
	
	
}
