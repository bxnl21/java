package com.gamingstore.dto;

import java.io.Serializable;
import java.util.HashMap;

public class CartDto implements Serializable {

	private static final long serialVersionUID = -3559399141322908895L;

	private Integer orderId;
	private String fullname;
	private String email;
	private String address;
	private String phone;
	private HashMap<Integer, CartDetailDto> details = new HashMap<>();
	private Integer totalQuantity = 0;
	private Double totalPrice = 0D;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public HashMap<Integer, CartDetailDto> getDetails() {
		return details;
	}

	public void setDetails(HashMap<Integer, CartDetailDto> details) {
		this.details = details;
	}

	public Integer getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(Integer totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
}
