package www.wordking.com.VO;

import java.util.Date;

import lombok.Data;

@Data
public class Word {
	private String userId;		//user_seq찾기는 용도
	private int word_seq;		//word_seq number primary key
	private int category;		//category number REFERENCES wk_favorite(seq)
	private String word;		//word varchar2(256) not null
	private String meaning;		//meaning varchar2(2000) not null
	private String image;		//image varchar2(256)
	private int user_seq;		//user_seq number REFERENCES wk_users(seq) not null
	private Date registerdate;	//registerdate date default sysdate
	private Date updatedate;	//updatedate date default sysdate
}
