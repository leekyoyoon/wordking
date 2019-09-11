package www.wordking.com.Mapper;

import java.util.ArrayList;

import www.wordking.com.VO.Faq;
import www.wordking.com.VO.Notice;

public interface CsMapper {
	
	public ArrayList<Notice> selectNoticeList();
	public ArrayList<Notice> selectFaqList();
	public Notice selectOneNotice();
	public Faq selectOneFaq();
	
}
