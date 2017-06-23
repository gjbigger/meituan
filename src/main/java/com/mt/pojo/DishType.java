package com.mt.pojo;

public class DishType {

	//类别id
	private Integer id;
	//类别名称
	private String name;
	//所属商店id
	private Integer storeId;
	
	
	public DishType() {
		// TODO Auto-generated constructor stub
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Integer getStoreId() {
		return storeId;
	}


	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}


	@Override
	public String toString() {
		return "DishType [id=" + id + ", name=" + name + ", storeId=" + storeId + "]";
	}

	
}
