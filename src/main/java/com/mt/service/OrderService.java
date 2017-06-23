package com.mt.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mt.dao.DishDao;
import com.mt.dao.OrderDao;
import com.mt.dao.StoreDao;
import com.mt.dto.OrderDto;
import com.mt.pojo.Order;
import com.mt.pojo.Store;
import com.mt.query.OrderQuery;

import utils.AssertUtil;
import utils.ConstData;

@Service
public class OrderService {

	@Autowired
	private OrderDao orderDao;
	@Autowired
	private StoreDao storeDao;
	@Autowired
	private DishDao dishDao;
	
	
	/**
	 * 添加订单
	 */
	public void insert(Order order) {
		order.setCreateTime(new Date());
		order.setUpdateTime(new Date());
		
		order.setStatus(0);
		
		AssertUtil.isTrue(orderDao.insert(order)<1, "下单失败");
	}
	
	
	/**
	 * 更改订单状态
	 * @return
	 */
	public void updateSetStatus(Integer id, Integer status) {
		int result = orderDao.updateSetStatus(id, status);
		AssertUtil.isTrue(result<1, "更改订单状态失败");
		
		if(status.equals(ConstData.ORDER_STATUS_SEND)) {
			//已经送到， 即用户单击已收货按钮，更新  相应的 菜品信息, 相应的商店信息
			Order order = orderDao.selectById(id);
			
			refreshStoreWithCompleteOrder(order);
			refreshDishWithCompleteOrder(order);
		}
			
	}
	
	
	
	
	
	//刷新相应商店的信息,菜品信息
	private void refreshStoreWithCompleteOrder(Order order) {
		//成功之后，计算store的相应字段  月销量  菜品月销量  平均送餐时间
		
		//1 根据订单id查询商店相关字段
		int storeId = order.getStoreId();
		Date startSendTime = order.getStartSendTime();
		Date endSendTime = order.getEndSendTime();
		
		// 2根据storeId  的到store的相应字段
		Store store = storeDao.selectById(storeId);
		int monthSell = store.getMonthSell();
		int t = (int) (endSendTime.getTime()-startSendTime.getTime());
		double avgMinute = store.getAvgSendTime();
		avgMinute = (avgMinute*monthSell+t/1000/60)/(monthSell+1);
		
		int result = 0;
		do{
			result = storeDao.updateSetMonthSellAndStoreAvgSendTime(storeId, monthSell+1, avgMinute);
		} while(result < 1);
	}
	
	
	
	//刷新相应的菜品信息     id-菜品名*价格/数量，
	private void refreshDishWithCompleteOrder(Order order) {
		//计算相应菜品的销量信息
		String dishDetail = order.getDishDetail();
		String[] tempArr = dishDetail.split(",");
		for(String str : tempArr) {
			String[] temp = str.split("\\*");
			Integer dishId = Integer.parseInt(temp[0].split("-")[0]);//菜品id
			String sellCountStr = temp[1].split("/")[1];//价格/数量---数量
			Integer sellCount = 1;
			if(!StringUtils.isBlank(sellCountStr)) {
				sellCount = Integer.parseInt(sellCountStr);
			}
			
			int result = 0;
			do {
				result = dishDao.updateMonthSalesById(dishId, sellCount);
			}while(result < 1);
		}
	}
	
	
	
	
	/**
	 * 动态查询订单 
	 * @param map
	 * @return
	 */
	public Map<String, Object> selectByParams(OrderQuery orderQuery) {
		PageHelper.startPage(orderQuery.getPage(), orderQuery.getRows());
		List<OrderDto> list = orderDao.selectByParams(orderQuery);
		PageInfo<OrderDto> pageInfo = new PageInfo<OrderDto>(list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageInfo.getTotal());
		map.put("rows", pageInfo.getList());
		map.put("currPage", orderQuery.getPage());
		map.put("pages",(pageInfo.getTotal()+orderQuery.getRows()-1)/orderQuery.getRows());
		return map;
	}
	
	
	
	
}
