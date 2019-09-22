package www.wordking.com.VO;

import java.util.Date;

import lombok.Data;

@Data
public class Word {
	private String userId;		//user_seqã��� �뵵
	private int word_seq;		//category number REFERENCES wk_favorite(seq)
	private String word;		//word varchar2(256) not null
	private String meaning;		//image varchar2(256)
	private int user_seq;		//user_seq number REFERENCES wk_users(seq) not null
	private Date registerdate;	//registerdate date default sysdate
	private Date updatedate;	//updatedate date default sysdate
	private String title;		//voca ��
}
