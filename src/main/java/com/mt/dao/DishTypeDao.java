package com.mt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mt.pojo.DishType;

@Repository
public interface DishTypeDao {

	/**
	 * 添加一个类别
	 * @param dishType
	 * @return
	 */
	public int insert(DishType dishType);
	
	
	
	
	/**
	 * 更新一个类别	typeName
	 * @param dishType
	 * @return
	 */
	public int update(DishType dishType);
	
	
	
	
	/**
	 * 根据类别id删除类别
	 * @param typeId
	 * @return
	 */
	public int delete(@Param("id") Integer id);
	
	
	/**
	 * 根据商店id和类别名称查询类别
	 * @param dishType
	 * @return
	 */
	public DishType selectByStoreIdAndName(@Param("name")String name,@Param("storeId") Integer storeId);
	
	
	
	
	/**
	 * 根据商店id查询该商店的所有类别，然后制作成菜单
	 * @param storeId
	 * @return
	 */
	public List<DishType> selectByStoreId(@Param("storeId") Integer storeId);
}
