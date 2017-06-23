package com.mt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mt.pojo.Order;
import com.mt.pojo.Store;
import com.mt.pojo.User;
import com.mt.query.OrderQuery;
import com.mt.service.OrderService;

import utils.ConstData;
import utils.MessageModel;

@Controller
@RequestMapping("order")
public class OrderController {

	@Resource
	private OrderService orderService;
	
	
	/**
	 * 下单
	 * @return
	 */
	@RequestMapping("insert")
	@ResponseBody
	public MessageModel insert(Order order) {
		orderService.insert(order);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("下单成功");
		return mm;
	}
	
	
	/**
	 * 跳转到订单页面
	 * @return
	 */
	@RequestMapping("toOrderAddJsp")
	public ModelAndView toOrderAddJsp(HttpServletRequest req,Double totalMoney, String dishDetail, Integer storeId) {
		ModelAndView mv = new ModelAndView();
		User user = (User) req.getSession().getAttribute("user");
		if(user == null) {
			mv.setViewName("error");
			return mv;
		}
		
		
		//id-菜品名*价格/数量，
		String[] dishArray = dishDetail.split(",");
		List<Map<String, String>> dishList = new ArrayList<Map<String, String>>();
		for(String str : dishArray) {
			String[] temp = str.split("\\*");
			Map<String, String> map = new HashMap<String, String>();
			map.put("dishName", temp[0]);
			map.put("dishMoney", temp[1]);
			dishList.add(map);
		}
		
		
		
		Map<String, Object> model = mv.getModel();
		model.put("dishNames", dishDetail );
		model.put("dishList", dishList);
		model.put("totalMoney", totalMoney);
		model.put("storeId", storeId);
		
		mv.setViewName("order/order_add");
		return mv;
	}
	
	/**
	 * 改变状态
	 * @param id
	 * @param status
	 * @return
	 */
	@RequestMapping("updateSetStatus")
	@ResponseBody
	public MessageModel updateSetStatus(Integer id, Integer status) {
		orderService.updateSetStatus(id, status);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("改变状态成功");
		return mm;
	}
	
	
	/**
	 * 动态查询订单
	 * @param req
	 * @param orderQuery
	 * @return
	 */
	@RequestMapping("selectByParams")
	@ResponseBody
	public Map<String, Object> selectByParams(HttpServletRequest req, OrderQuery orderQuery) {
		User user = (User)req.getSession().getAttribute("user");
		if(user != null) {
			orderQuery.setQueryUserId(user.getId());
			return orderService.selectByParams(orderQuery);
		}
		
		Store store = (Store)req.getSession().getAttribute("store");
		if(store != null) {
			orderQuery.setQueryStoreId(store.getId());
			return orderService.selectByParams(orderQuery);
		}
		
		return null;
	}
	
	
	
	
	/**
	 * 根据userId查询
	 * @return
	 */
	@RequestMapping("selectByUserId")
	public ModelAndView selectByUserId(HttpServletRequest req, Integer page) {
		ModelAndView mv = new ModelAndView();
		
		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			mv.setViewName("error");
			return mv;
		}
		
		if(page == null) {
			page = 1;
		}
		
		OrderQuery orderQuery = new OrderQuery();
		orderQuery.setQueryUserId(user.getId());
		orderQuery.setPage(page);
		orderQuery.setRows(10);
		Map<String, Object> map = orderService.selectByParams(orderQuery);
		mv.getModel().put("pageInfo", map);
		mv.getModel().put("user_change", "user_order_all.jsp");
		mv.setViewName("user/user_info");
		return mv;
	}
}
