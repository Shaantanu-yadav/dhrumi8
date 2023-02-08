package com.gulbrandsen;

public class Productmaster {
	private int id;
	private String productGroup;
	private String productCode;
	private String productName;
	private String sap;
	private String status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Productmaster [productGroup=" + productGroup + ", productCode=" + productCode + ", productName="
				+ productName + ", sap=" + sap + ", status=" + status + "]";
	}
	public Productmaster() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Productmaster(String productGroup, String productCode, String productName, String sap, String status) {
		super();
		this.productGroup = productGroup;
		this.productCode = productCode;
		this.productName = productName;
		this.sap = sap;
		this.status = status;
	}
	public String getProductGroup() {
		return productGroup;
	}
	public void setProductGroup(String productGroup) {
		this.productGroup = productGroup;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public  String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSap() {
		return sap;
	}
	public void setSap(String sap) {
		this.sap = sap;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

	

}
