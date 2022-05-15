package domain;

import java.util.Date;

public class Report {
	private int reportId;
	private String contents;
	private Date writtenDate;
	private String category;
	private int userId;
	private boolean state;
	
	
	public int getReportId() {
		return reportId;
	}
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getWrittenDate() {
		return writtenDate;
	}
	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	
	public Report(int reportId, String contents, Date writtenDate, String category, int userId, boolean state) {
		super();
		this.reportId = reportId;
		this.contents = contents;
		this.writtenDate = writtenDate;
		this.category = category;
		this.userId = userId;
		this.state = state;
	}
	
	public Report(String contents, Date writtenDate, String category, int userId) {
		this.contents = contents;
		this.writtenDate = writtenDate;
		this.category = category;
		this.userId = userId;
		reportId = -1;
		state = false;
	}
}
