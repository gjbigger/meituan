package com.mt.pojo;

public class Store {
	//商店id
	private Integer id;
	//商店密码
	private String storePwd;
	//商店登录名
	private String storeLoginName;
	
	
	//////////商店相关信息，可自己修改的/////////////////////
	//商店名称
	private String name;
	//商店地址
	private String address;
	//商店联系电话
	private String tel;
	//营业时间
	private String hours;
	//起送价
	private Double leastMoney;
	//配送费
	private Double fee;
	//商店公告
	private String notice;
	
	
	
	//平均送餐时间
	private Double avgSendTime;
	//开张还是休息
	private Integer openOrClose;
	//月销量订单数，即月销多少单
	private Integer monthSell;
	//商店星级
	private Integer star;
		
		
	public Store() {
		// TODO Auto-generated constructor stub
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getStorePwd() {
		return storePwd;
	}


	public void setStorePwd(String storePwd) {
		this.storePwd = storePwd;
	}


	public String getStoreLoginName() {
		return storeLoginName;
	}


	public void setStoreLoginName(String storeLoginName) {
		this.storeLoginName = storeLoginName;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getHours() {
		return hours;
	}


	public void setHours(String hours) {
		this.hours = hours;
	}


	public Double getLeastMoney() {
		return leastMoney;
	}


	public void setLeastMoney(Double leastMoney) {
		this.leastMoney = leastMoney;
	}


	public Double getFee() {
		return fee;
	}


	public void setFee(Double fee) {
		this.fee = fee;
	}


	public String getNotice() {
		return notice;
	}


	public void setNotice(String notice) {
		this.notice = notice;
	}


	public Double getAvgSendTime() {
		return avgSendTime;
	}


	public void setAvgSendTime(Double avgSendTime) {
		this.avgSendTime = avgSendTime;
	}


	public Integer getOpenOrClose() {
		return openOrClose;
	}


	public void setOpenOrClose(Integer openOrClose) {
		this.openOrClose = openOrClose;
	}


	public Integer getMonthSell() {
		return monthSell;
	}


	public void setMonthSell(Integer monthSell) {
		this.monthSell = monthSell;
	}


	public Integer getStar() {
		return star;
	}


	public void setStar(Integer star) {
		this.star = star;
	}


	@Override
	public String toString() {
		return "Store [id=" + id + ", storePwd=" + storePwd + ", storeLoginName=" + storeLoginName + ", name=" + name
				+ ", address=" + address + ", tel=" + tel + ", hours=" + hours + ", leastMoney=" + leastMoney + ", fee="
				+ fee + ", notice=" + notice + ", avgSendTime=" + avgSendTime + ", openOrClose=" + openOrClose
				+ ", monthSell=" + monthSell + ", star=" + star + "]";
	}

	

	
}
