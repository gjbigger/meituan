package com.mt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mt.dao.CommentDao;
import com.mt.pojo.Comment;
import com.mt.query.CommentQuery;

import utils.AssertUtil;

@Service
public class CommentService {

	@Autowired
	private CommentDao commentDao;

	
	/**
	 * 添加评论
	 * 
	 * @return
	 */
	public void insert(Comment comment) {
		int result = commentDao.insert(comment);
		AssertUtil.isTrue(result<1, "添加评论失败");
	}
	

	/**
	 * 查询评论
	 * 
	 * @param map
	 * @return
	 */
	public Map<String, Object> selectByParams(CommentQuery commentQuery) {
		PageHelper.startPage(commentQuery.getPage(), commentQuery.getRows());
		List<Comment> list = commentDao.selectByParams(commentQuery);
		PageInfo<Comment> pageInfo = new PageInfo<Comment>(list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageInfo.getTotal());
		map.put("rows", pageInfo.getList());
		map.put("currPage", commentQuery.getPage());
		map.put("pages",(pageInfo.getTotal()+commentQuery.getRows()-1)/commentQuery.getRows());
		return map;
	}
}
