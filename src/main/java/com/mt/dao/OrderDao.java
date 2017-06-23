package com.mt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mt.dto.OrderDto;
import com.mt.pojo.Order;
import com.mt.query.OrderQuery;

@Repository
public interface OrderDao {

	/**
	 * 增加一个订单
	 * @param order
	 * @return
	 */
	public int insert(Order order);
	
	
	
	/**
	 * 跟新订单状态
	 * @param map
	 * @return
	 */
	public int updateSetStatus(@Param("id") Integer id,@Param("status") Integer status);
	
	
	
	/**
	 * 动态查询订单,并按照创建时间逆序排序分页
	 * @param 
	 * @return
	 */
	public List<OrderDto> selectByParams(OrderQuery orderQuery);
	
	
	
	
	/**
	 * 根据订单id查询订单  ，用于获取storeId  startSendTime  receiveTime
	 * @param orderId
	 * @return
	 */
	public Order selectById(@Param("id") Integer id);
	
}
