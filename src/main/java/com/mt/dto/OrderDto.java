package com.mt.dto;

import com.mt.pojo.Order;

public class OrderDto extends Order{

	private Integer userId;
	private String userName;
	private String tel;
	private String address;
	
	public OrderDto() {
		// TODO Auto-generated constructor stub
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "OrderDto [userId=" + userId + ", userName=" + userName + ", tel=" + tel + ", address=" + address + "]";
	}
	
	
}
