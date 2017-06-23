package com.mt.pojo;

public class UserReceiveInfo {
	
	//收餐信息id
	private Integer id;
	//用户id
	private Integer userId;
	//用户联系电话
	private String tel;
	//用户的送餐地址
	private String address;

	public UserReceiveInfo() {
		// TODO Auto-generated constructor stub
	}

	


	public Integer getId() {
		return id;
	}




	public void setId(Integer id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "UserReceiveInfo [id=" + id + ", userId=" + userId + ", tel=" + tel + ", address=" + address + "]";
	}

	
}
