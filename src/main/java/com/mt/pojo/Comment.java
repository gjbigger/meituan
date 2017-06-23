package com.mt.pojo;

public class Comment {

	//评论id
	private Integer id;
	//评论内容
	private String content;
	//订单id
	private Integer orderId;
	//评价的星级
	private Integer star;
	
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Integer getOrderId() {
		return orderId;
	}


	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}


	public Integer getStar() {
		return star;
	}


	public void setStar(Integer star) {
		this.star = star;
	}


	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", orderId=" + orderId + ", star=" + star + "]";
	}

	
		
	
}
