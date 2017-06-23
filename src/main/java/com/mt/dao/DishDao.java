package com.mt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mt.dto.DishDto;
import com.mt.pojo.Dish;
import com.mt.query.DishQuery;

@Repository
public interface DishDao {

	/**
	 * 添加一个菜品
	 * 
	 * @param dish
	 * @return
	 */
	public int insert(Dish dish);

	
	/**
	 * 更新一个菜品
	 * 
	 * @param dish
	 * @return
	 */
	public int update(Dish dish);

	
	
	/**
	 * 根据商店id和菜品名跟新菜品销量
	 * @param sellCount
	 * @return
	 */
	public int updateMonthSalesById(@Param("id")Integer id, @Param("num")Integer num);
	
	
	
	
	/**
	 * 根据dishId删除菜品
	 * 
	 * @param dishId
	 * @return
	 */
	public int delete(@Param("id")Integer id);

	
	
	/**
	 * 根据菜品名和商店id查询菜品
	 * 
	 * @param map
	 *            dishName-- storeId--
	 * @return
	 */
	public Dish selectByNameAndStoreId(@Param("name")String name,@Param("storeId") Integer storeId);

	
	/**
	 * 根据商店id查询菜品
	 * 
	 * @param storeId
	 * @return
	 */
	public List<Dish> selectByStoreId(@Param("storeId") Integer storeId);
	
	
	/**
	 * 根据类别id查询所有的菜
	 * @param typeId
	 * @return
	 */
	public List<Dish> selectByTypeId(@Param("typeId") Integer typeId);
	
	
	/**
	 * 查询
	 * @param dishQuery
	 * @return
	 */
	public List<DishDto> selectByParam(DishQuery dishQuery);
}
