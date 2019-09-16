package www.wordking.com.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class Voca {

	private int seq;
	private int word_seq;
	private int user_seq;
	private int category_seq;
	private String title;
	private String contents;
	private int visible;
	private Date registerDate;
	private Date updateDate;
	
}
