package com.mt.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mt.pojo.Dish;
import com.mt.pojo.Store;
import com.mt.query.DishQuery;
import com.mt.service.DishService;

import utils.ConstData;
import utils.MessageModel;

@Controller
@RequestMapping("dish")
public class DishController {

	@Autowired
	private DishService dishService;
	
	
	/**
	 * 添加菜品
	 * @return
	 */
	@RequestMapping("insert")
	@ResponseBody
	public MessageModel insert(Dish dish, HttpServletRequest req) {
		Store store =(Store) req.getSession().getAttribute("store");
		dish.setStoreId(store.getId());
		
		dishService.insert(dish);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("添加菜品成功");
		return mm;
	}
	
	
	
	/**
	 * 更改菜品
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public MessageModel update(Dish dish, HttpServletRequest req) {
		Store store =(Store) req.getSession().getAttribute("store");
		dish.setStoreId(store.getId());
		
		dishService.update(dish);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("更改菜品成功");
		return mm;
	}
	
	
	/**
	 * 删除菜品
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public MessageModel delete(Integer id) {
		dishService.delete(id);
		
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("删除菜品成功");
		return mm;
	}
	
	
	/**
	 * 查询
	 * @param req
	 * @param dishQuery
	 * @return
	 */
	@RequestMapping("selectByParam")
	@ResponseBody
	public Map<String, Object> selectByParam(HttpServletRequest req,DishQuery dishQuery) {
		Store store =(Store) req.getSession().getAttribute("store");
		
		dishQuery.setQueryStoreId(store.getId());
		return dishService.selectByParam(dishQuery);
	}
}
