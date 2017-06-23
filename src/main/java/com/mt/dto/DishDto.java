package com.mt.dto;

import com.mt.pojo.Dish;

public class DishDto extends Dish{

	private String typeName;
	
	public DishDto() {
		// TODO Auto-generated constructor stub
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "DishDto [typeName=" + typeName + "]";
	}
	 
	
	
	
	
}
