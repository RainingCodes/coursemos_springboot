package domain;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Store implements Serializable {
	private String storeId;
	private String address;
	private String phone;
	private String Storename;
	private String Storecontents;
	private int price;
	private int time;
	private String photos;
	private String operatingHours;
	
	public String getStoreId() { return storeId; }
	public void setStoreId(String storeId) { this.storeId = storeId; }
	
	public String getAddress() { return address; }
	public void setAddress(String address) { this.address = address; }
	
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
	
	public String getStorename() { return Storename; }
	public void setStorename(String storename) { Storename = storename; }
	
	public String getStorecontents() { return Storecontents; }
	public void setStorecontents(String storecontents) { Storecontents = storecontents; }
	
	public int getPrice() { return price; }
	public void setPrice(int price) { this.price = price; }
	
	public int getTime() { return time; }
	public void setTime(int time) { this.time = time; }
	
	public String getPhotos() { return photos; }
	public void setPhotos(String photos) { this.photos = photos; }
	
	public String getOperatingHours() { return operatingHours; }
	public void setOperatingHours(String operatingHours) { this.operatingHours = operatingHours; }
	
	public Store(String storeId, String storename) {
		super();
		this.storeId = storeId;
		Storename = storename;
	}
	public Store(String storeId, String address, String phone, String storename, String storecontents, int price,
			int time, String photos, String operatingHours) {
		super();
		this.storeId = storeId;
		this.address = address;
		this.phone = phone;
		Storename = storename;
		Storecontents = storecontents;
		this.price = price;
		this.time = time;
		this.photos = photos;
		this.operatingHours = operatingHours;
	}
	

}
