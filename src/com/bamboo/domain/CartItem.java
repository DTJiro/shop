package com.bamboo.domain;

public class CartItem {
	private Product product;

	private Double subtotal;

	private Integer count;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Double getSubtotal() {
		return product.getShop_price()*count;
	}


	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public CartItem(Product product, Integer count) {
		super();
		this.product = product;
		this.count = count;
	}
	
	
}
