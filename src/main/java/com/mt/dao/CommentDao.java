package com.mt.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mt.pojo.Comment;
import com.mt.query.CommentQuery;

@Repository
public interface CommentDao {

	/**
	 * 添加一条评论
	 * @param comment
	 * @return
	 */
	public int insert(Comment comment);
	
	
	/**
	 *  动态查询 
	 * @param map   storeId--   userId--   star--一般传5或者1，即好评和差评
	 * @return
	 */
	public List<Comment> selectByParams(CommentQuery commentQuery);
	
	
}
