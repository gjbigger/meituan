package com.mt.pojo;

public class Dish {
	//菜品id
	private Integer id;
	//菜品名
	private String name;
	//菜品价格
	private Double price;
	//菜品月销量
	private Integer monthSales;
	//菜品的详细信息 
	private String detail;
	//所属商店id
	private Integer storeId;
	//所属类别id
	private Integer typeId;
	
	public Dish() {
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getMonthSales() {
		return monthSales;
	}

	public void setMonthSales(Integer monthSales) {
		this.monthSales = monthSales;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	@Override
	public String toString() {
		return "Dish [id=" + id + ", name=" + name + ", price=" + price + ", monthSales=" + monthSales + ", detail="
				+ detail + ", storeId=" + storeId + ", typeId=" + typeId + "]";
	}

	
}
