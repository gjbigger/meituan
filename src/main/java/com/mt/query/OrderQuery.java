package com.mt.query;

import utils.BaseQuery;

public class OrderQuery extends BaseQuery{
	
	private Integer queryUserId;
	private Integer queryStoreId;
	private Integer queryStatus;
	
	public OrderQuery() {
		// TODO Auto-generated constructor stub
	}

	public Integer getQueryUserId() {
		return queryUserId;
	}

	public void setQueryUserId(Integer queryUserId) {
		this.queryUserId = queryUserId;
	}

	public Integer getQueryStoreId() {
		return queryStoreId;
	}

	public void setQueryStoreId(Integer queryStoreId) {
		this.queryStoreId = queryStoreId;
	}

	public Integer getQueryStatus() {
		return queryStatus;
	}

	public void setQueryStatus(Integer queryStatus) {
		this.queryStatus = queryStatus;
	}

	@Override
	public String toString() {
		return "OrderQuery [queryUserId=" + queryUserId + ", queryStoreId=" + queryStoreId + ", queryStatus="
				+ queryStatus + "]";
	}
	
	

}
