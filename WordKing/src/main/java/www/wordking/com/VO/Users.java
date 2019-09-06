package www.wordking.com.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class Users {


	private int seq;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private int job_seq;
	private String image;
	private String favorite;
	private Date birthDate;
	private Date registerDate;
}
