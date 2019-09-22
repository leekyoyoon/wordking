package www.wordking.com.VO;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Voca {
	private int seq;			//seq number primary key,
	private int word_seq;    	//word_seq number REFERENCES wk_words(word_seq) not null,
	private int user_seq;   	//user_seq number REFERENCES wk_users(seq) not null,
	private int category_seq;   //category_seq number REFERENCES wk_favorites(favorite_seq) not null,
	private String title; 	   //title varchar2(128) not null,
	private String contents;
	private int visible;  		  //visible number default 1,
	private Date registerdate;    //registerdate date default sysdate,
	private Date updatedate;    //updatedate date default sysdate
	private String userid;		//userid ¿ë
}
