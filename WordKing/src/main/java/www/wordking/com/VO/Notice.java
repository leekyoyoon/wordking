package www.wordking.com.VO;

public class Notice {
	private int num;
	private String noticeNum;		// 공지사항 번호
	private	String noticeTitle;		// 공지사항 제목
	private String noticeContents;	// 공지사항 내용
	private String noticeDate;		// 공지사항 등록일자
	private String adminId;			// 공지사항 등록자
	private int noticeCount;		// 공지사항 조회수
	
	public Notice(){};
	
	public Notice(int num, String noticeNum, String noticeTitle, String noticeContents, String noticeDate,
			String adminId, int noticeCount) {
		this.num = num;
		this.noticeNum = noticeNum;
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
		this.noticeDate = noticeDate;
		this.adminId = adminId;
		this.noticeCount = noticeCount;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(String noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContents() {
		return noticeContents;
	}

	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	@Override
	public String toString() {
		return "Notice [num=" + num + ", noticeNum=" + noticeNum + ", noticeTitle=" + noticeTitle + ", noticeContents="
				+ noticeContents + ", noticeDate=" + noticeDate + ", adminId=" + adminId + ", noticeCount=" + noticeCount
				+ "]";
	}
	
	

	
	
	
} 
