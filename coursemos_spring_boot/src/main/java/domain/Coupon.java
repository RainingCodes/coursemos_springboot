package domain;

import java.util.Date;

public class Coupon {
	private int couponId;
	private int companyId;
	private String contents;
	private Date period; // �߱� ���� �Ⱓ
	private int limit; // ���� ����
	private int day; // �߱� �� �̿� �Ⱓ(����ؼ� �������� �Ѱ������)
	private int state; // �߱� ���� ����(�߱��� / �߱��ߴ�)
	
	public int getCouponId() {
		return couponId;
	}
	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getPeriod() {
		return period;
	}
	public void setPeriod(Date period) {
		this.period = period;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	public Coupon(int couponId, int companyId, String contents, Date period, int limit, int day, int state) {
		super();
		this.couponId = couponId;
		this.companyId = companyId;
		this.contents = contents;
		this.period = period;
		this.limit = limit;
		this.day = day;
		this.state = state;
	}
	
	public Coupon(int companyId, String contents, Date period, int limit, int day) {
		super();
		couponId = -1;
		this.companyId = companyId;
		this.contents = contents;
		this.period = period;
		this.limit = limit;
		this.day = day;
		state = 0;
	}
	
	
}