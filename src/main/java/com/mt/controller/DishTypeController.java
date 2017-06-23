package com.mt.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mt.pojo.DishType;
import com.mt.pojo.Store;
import com.mt.service.DishTypeService;

import utils.ConstData;
import utils.MessageModel;

@Controller
@RequestMapping("dishType")
public class DishTypeController {
	
	@Autowired
	private DishTypeService dishTypeService;
	
	
	/**
	 * 根据storeId查询菜品类别
	 * @return
	 */
	@RequestMapping("selectByStoreId")
	@ResponseBody
	public List<DishType> selectByStoreId(HttpServletRequest req) {
		Store store =(Store) req.getSession().getAttribute("store");
		
		return dishTypeService.selectByStoreId(store.getId());
	}
	
	
	/**
	 * 添加类别
	 * @param req
	 * @param dishType
	 * @return
	 */
	@RequestMapping("insert")
	@ResponseBody
	public MessageModel insert(HttpServletRequest req, DishType dishType) {
		Store store =(Store) req.getSession().getAttribute("store");
		
		dishType.setStoreId(store.getId());
		dishTypeService.insert(dishType);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("添加类别成功");
		return mm;
	}
	
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public MessageModel delete(Integer id) {
		dishTypeService.delete(id);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("删除成功");
		return mm;
	}
	
	

	/**
	 * 根据storeId查询菜品类别
	 * @return
	 */
	@RequestMapping("selectForCombobox")
	@ResponseBody
	public List<Map<String, Object>> selectForCombobox(HttpServletRequest req) {
		Store store =(Store) req.getSession().getAttribute("store");
		
		return dishTypeService.selectForCombobox(store.getId());
	}

}
