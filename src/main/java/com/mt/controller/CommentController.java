package com.mt.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mt.pojo.Comment;
import com.mt.pojo.Store;
import com.mt.pojo.User;
import com.mt.query.CommentQuery;
import com.mt.service.CommentService;

import utils.ConstData;
import utils.MessageModel;

@Controller
@RequestMapping("comment")
public class CommentController {

	@Resource
	private CommentService commentService;
	
	
	/**
	 * 添加评论
	 * @return
	 */
	@RequestMapping("insert")
	@ResponseBody
	public MessageModel insert(Comment comment) {
		commentService.insert(comment);
		
		MessageModel mm = new MessageModel();
		mm.setCode(ConstData.SUCCESS_CODE);
		mm.setMsg("添加评论成功");
		return mm;
	}
	
	
	/**
	 * 查询评论
	 * @param commentQuery
	 * @return
	 */
	@RequestMapping("selectByStoreId")
	@ResponseBody
	public Map<String, Object> selectByStoreId(HttpServletRequest req,CommentQuery commentQuery) {
		Store store = (Store)req.getSession().getAttribute("store");
		
		commentQuery.setQueryStoreId(store.getId());
		return commentService.selectByParams(commentQuery);
	}
	
	
	
	/**
	 * 查询评论
	 * @param commentQuery
	 * @return
	 */
	@RequestMapping("selectByUserId")
	public ModelAndView selectByUserId(HttpServletRequest req,Integer page) {
		ModelAndView mv = new ModelAndView();
		
		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			mv.setViewName("error");
			return mv;
		}
		
		if(page == null) {
			page = 1;
		}
		
		CommentQuery commentQuery = new CommentQuery();
		commentQuery.setQueryUserId(user.getId());
		commentQuery.setPage(page);
		commentQuery.setRows(10);
		Map<String, Object> map = commentService.selectByParams(commentQuery);
		mv.getModel().put("pageInfo", map);
		mv.getModel().put("user_change", "user_comment_all.jsp");
		mv.setViewName("user/user_info");
		return mv;
	}
}
