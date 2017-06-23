package com.mt.query;

import utils.BaseQuery;

public class DishQuery extends BaseQuery{

	private Integer queryStoreId;
	private Integer queryTypeId;
	private String queryName;
	
	public DishQuery() {
		// TODO Auto-generated constructor stub
	}

	public Integer getQueryStoreId() {
		return queryStoreId;
	}

	public void setQueryStoreId(Integer queryStoreId) {
		this.queryStoreId = queryStoreId;
	}

	public Integer getQueryTypeId() {
		return queryTypeId;
	}

	public void setQueryTypeId(Integer queryTypeId) {
		this.queryTypeId = queryTypeId;
	}

	
	
	public String getQueryName() {
		return queryName;
	}

	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}

	@Override
	public String toString() {
		return "DishQuery [queryStoreId=" + queryStoreId + ", queryTypeId=" + queryTypeId + ", queryName=" + queryName
				+ "]";
	}

	
	
}
