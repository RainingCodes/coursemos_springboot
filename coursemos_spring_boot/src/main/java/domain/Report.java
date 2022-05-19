package domain;

import java.util.Date;
import lombok.*;

@Getter @Setter @ToString
public class Report {
	private int reportId;
	private Date writtenDate;
	private int courseId;
	private int reviewId;
	private int userId;
	private String reportCategory;
	private boolean state;
}
