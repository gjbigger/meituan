package com.mt.query;

import utils.BaseQuery;

public class CommentQuery extends BaseQuery{

	private Integer queryStoreId;
	private Integer queryUserId;
	private Integer queryStar;
	
	public CommentQuery() {
		// TODO Auto-generated constructor stub
	}

	public Integer getQueryStoreId() {
		return queryStoreId;
	}

	public void setQueryStoreId(Integer queryStoreId) {
		this.queryStoreId = queryStoreId;
	}

	public Integer getQueryUserId() {
		return queryUserId;
	}

	public void setQueryUserId(Integer queryUserId) {
		this.queryUserId = queryUserId;
	}

	public Integer getQueryStar() {
		return queryStar;
	}

	public void setQueryStar(Integer queryStar) {
		this.queryStar = queryStar;
	}

	@Override
	public String toString() {
		return "CommentQuery [queryStoreId=" + queryStoreId + ", queryUserId=" + queryUserId + ", queryStar="
				+ queryStar + "]";
	}
	
	
}
