package com.mt.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Order {
	//订单的属性
	private Integer id;			//订单id
	private Integer status;		//订单状态	0未接单	1已接单	2已送到	-1已取消
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date startSendTime;		//起送时间
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date endSendTime;		//送到时间
	
	private Integer payOrNot;			//是否已付款		在线支付1   货到付款0
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date createTime;		//创建时间 
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date updateTime;		//更改时间
	
	private String message;
	
	//菜品的属性
	private Integer storeId;			//商店id
	private String dishDetail;		//菜品详情
	private Double totalMoney;		//总价
	
	//用户的属性
	private Integer userReceiveInfoId;	//用户收餐信息id
	
	
	public Order() {
		// TODO Auto-generated constructor stub
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}


	public Date getStartSendTime() {
		return startSendTime;
	}


	public void setStartSendTime(Date startSendTime) {
		this.startSendTime = startSendTime;
	}


	public Date getEndSendTime() {
		return endSendTime;
	}


	public void setEndSendTime(Date endSendTime) {
		this.endSendTime = endSendTime;
	}


	public Integer getPayOrNot() {
		return payOrNot;
	}


	public void setPayOrNot(Integer payOrNot) {
		this.payOrNot = payOrNot;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public Date getUpdateTime() {
		return updateTime;
	}


	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}


	public Integer getStoreId() {
		return storeId;
	}


	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}


	public String getDishDetail() {
		return dishDetail;
	}


	public void setDishDetail(String dishDetail) {
		this.dishDetail = dishDetail;
	}


	public Double getTotalMoney() {
		return totalMoney;
	}


	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}


	public Integer getUserReceiveInfoId() {
		return userReceiveInfoId;
	}


	public void setUserReceiveInfoId(Integer userReceiveInfoId) {
		this.userReceiveInfoId = userReceiveInfoId;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	@Override
	public String toString() {
		return "Order [id=" + id + ", status=" + status + ", startSendTime=" + startSendTime + ", endSendTime="
				+ endSendTime + ", payOrNot=" + payOrNot + ", createTime=" + createTime + ", updateTime=" + updateTime
				+ ", message=" + message + ", storeId=" + storeId + ", dishDetail=" + dishDetail + ", totalMoney="
				+ totalMoney + ", userReceiveInfoId=" + userReceiveInfoId + "]";
	}




	
}
