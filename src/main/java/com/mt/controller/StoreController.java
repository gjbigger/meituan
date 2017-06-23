package com.mt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mt.pojo.Dish;
import com.mt.pojo.DishType;
import com.mt.pojo.Store;
import com.mt.query.StoreQuery;
import com.mt.service.DishService;
import com.mt.service.DishTypeService;
import com.mt.service.StoreService;

import utils.ConstData;
import utils.MessageModel;

@Controller
@RequestMapping("store")
public class StoreController {

	@Autowired
	private StoreService storeService;
	@Autowired
	private DishTypeService dishTypeService;
	@Autowired
	private DishService dishService;
	
	/**
	 * 登出
	 * @return
	 */
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest req) {
		req.getSession().setAttribute("store", null);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("store/store_login");
		return mv;
	}
	
	
	/**
	 * 登陆
	 * @return
	 */
	@RequestMapping("login")
	@ResponseBody
	public MessageModel login(String storeLoginName, String storePwd, HttpServletRequest req) {
		Store store = storeService.login(storeLoginName, storePwd);
		
		req.getSession().setAttribute("store", store);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE );
		return mm;
	}
	
	
	/**
	 * 注册
	 * @return
	 */
	@RequestMapping("register")
	@ResponseBody
	public MessageModel register(String storeLoginName, String storePwd) {
		storeService.register(storeLoginName, storePwd);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		return mm;
	}
	
	
	
	/**
	 * 更新商家基础信息
	 * @param store
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public MessageModel update(Store store ,HttpServletRequest req) {
		Store temp =(Store) req.getSession().getAttribute("store");
		store.setId(temp.getId());
		storeService.update(store);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("保存成功");
		return mm;
	}
	
	
	/**
	 * 根据id查询
	 * @return
	 */
	@RequestMapping("selectById")
	@ResponseBody
	public Store selectById(HttpServletRequest req) {
		Store store =(Store)req.getSession().getAttribute("store");
		
		return storeService.selectById(store.getId());
	}
	
	
	
	/**
	 * 更改状态
	 * @param req
	 * @param openOrClose
	 * @return
	 */
	@RequestMapping("updateSetOpenOrClose")
	@ResponseBody
	public MessageModel updateSetOpenOrClose(HttpServletRequest req, Integer openOrClose) {
		Store store =(Store)req.getSession().getAttribute("store");
		
		storeService.updateSetOpenOrClose(store.getId(), openOrClose);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("更改状态成功");
		return mm;
	}
	
	
	
	/**
	 * 到详情页
	 * @return
	 */
	@RequestMapping("toStoreDetailJsp")
	public ModelAndView toStoreDetailJsp(Integer id, HttpServletRequest req) {
		Store store = storeService.selectById(id);
		List<DishType> dishTypeList = dishTypeService.selectByStoreId(id);
		List<Dish> dishList = dishService.selectByStoreId(id);
		
		req.setAttribute("store", store);
		req.setAttribute("dishTypeList", dishTypeList);
		req.setAttribute("dishList", dishList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index/index_store");
		return mv;
	}
	
	
	/**
	 * 加载商店
	 * @param req
	 */
	@RequestMapping("loadOpenStore")
	public ModelAndView loadOpenStore(HttpServletRequest req) {
		StoreQuery storeQuery = new StoreQuery();
		storeQuery.setQueryOpenOrClose(1);
		List<Store> list = storeService.selectByParams(storeQuery);
		req.setAttribute("stores", list);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index/index");
		return mv;
	}
}
