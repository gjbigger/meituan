package com.mt.query;

import utils.BaseQuery;

public class StoreQuery extends BaseQuery{

	private Integer queryOpenOrClose;
	private String queryName;
	
	public StoreQuery() {
		// TODO Auto-generated constructor stub
	}

	public Integer getQueryOpenOrClose() {
		return queryOpenOrClose;
	}

	public void setQueryOpenOrClose(Integer queryOpenOrClose) {
		this.queryOpenOrClose = queryOpenOrClose;
	}

	public String getQueryName() {
		return queryName;
	}

	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}

	@Override
	public String toString() {
		return "StoreQuery [queryOpenOrClose=" + queryOpenOrClose + ", queryName=" + queryName + "]";
	}
	
	
}
