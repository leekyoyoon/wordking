package www.wordking.com.VO;

public class Faq {
	
	private int faqnum;
	private String category1;
	private String category2;
	private String category3;
	private String faqTitle;
	private String faqContent;
	private String adminId;
	private int faqCount;
	
	public Faq(){}

	public Faq(int faqnum, String category1, String category2, String category3, String faqTitle, String faqContent,
			String adminId, int faqCount) {
		this.faqnum = faqnum;
		this.category1 = category1;
		this.category2 = category2;
		this.category3 = category3;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.adminId = adminId;
		this.faqCount = faqCount;
	}

	public int getFaqnum() {
		return faqnum;
	}

	public void setFaqnum(int faqnum) {
		this.faqnum = faqnum;
	}

	public String getCategory1() {
		return category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
	}

	public String getCategory2() {
		return category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
	}

	public String getCategory3() {
		return category3;
	}

	public void setCategory3(String category3) {
		this.category3 = category3;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public int getFaqCount() {
		return faqCount;
	}

	public void setFaqCount(int faqCount) {
		this.faqCount = faqCount;
	}

	@Override
	public String toString() {
		return "Faq [faqnum=" + faqnum + ", category1=" + category1 + ", category2=" + category2 + ", category3="
				+ category3 + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", adminId=" + adminId
				+ ", faqCount=" + faqCount + "]";
	};
	
	
		
}
