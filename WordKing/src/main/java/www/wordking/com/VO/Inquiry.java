package www.wordking.com.VO;

public class Inquiry {
	private int inquirynum;
	private String inquirycategory;
	private String inquirytitle;
	private String inquirycontent;
	private String inquiryuserid;
	private String inquirydate;
	private String inquiryupload;
	private String replyEmailCheck;

	public Inquiry(){}

	public Inquiry(int inquirynum, String inquirycategory, String inquirytitle, String inquirycontent, String inquiryuserid,
			String inquirydate, String inquiryupload, String replyEmailCheck) {
		this.inquirynum = inquirynum;
		this.inquirycategory = inquirycategory;
		this.inquirytitle = inquirytitle;
		this.inquirycontent = inquirycontent;
		this.inquiryuserid = inquiryuserid;
		this.inquirydate = inquirydate;
		this.inquiryupload = inquiryupload;
		this.replyEmailCheck = replyEmailCheck;
	}

	public String getInquirycontent() {
		return inquirycontent;
	}

	public void setInquirycontent(String inquirycontent) {
		this.inquirycontent = inquirycontent;
	}

	public String getReplyEmailCheck() {
		return replyEmailCheck;
	}

	public void setReplyEmailCheck(String replyEmailCheck) {
		this.replyEmailCheck = replyEmailCheck;
	}

	public int getInquirynum() {
		return inquirynum;
	}

	public void setInquirynum(int inquirynum) {
		this.inquirynum = inquirynum;
	}

	public String getInquirycategory() {
		return inquirycategory;
	}

	public void setInquirycategory(String inquirycategory) {
		this.inquirycategory = inquirycategory;
	}

	public String getInquirytitle() {
		return inquirytitle;
	}

	public void setInquirytitle(String inquirytitle) {
		this.inquirytitle = inquirytitle;
	}

	public String getInquiryuserid() {
		return inquiryuserid;
	}

	public void setInquiryuserid(String inquiryuserid) {
		this.inquiryuserid = inquiryuserid;
	}

	public String getInquirydate() {
		return inquirydate;
	}

	public void setInquirydate(String inquirydate) {
		this.inquirydate = inquirydate;
	}

	public String getInquiryupload() {
		return inquiryupload;
	}

	public void setInquiryupload(String inquiryupload) {
		this.inquiryupload = inquiryupload;
	}

	@Override
	public String toString() {
		return "Inquiry [inquirynum=" + inquirynum + ", inquirycategory=" + inquirycategory + ", inquirytitle="
				+ inquirytitle + ", inquirycontent=" + inquirycontent + ", inquiryuserid=" + inquiryuserid
				+ ", inquirydate=" + inquirydate + ", inquiryupload=" + inquiryupload + ", replyEmailCheck="
				+ replyEmailCheck + "]";
	}
	
}
