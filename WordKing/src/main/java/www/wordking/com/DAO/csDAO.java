package www.wordking.com.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.wordking.com.Mapper.CsMapper;
import www.wordking.com.VO.Faq;
import www.wordking.com.VO.Notice;

@Repository
public class csDAO {

	@Autowired
	SqlSession session;
	
	public ArrayList<Notice> selectNoticeList() {
		ArrayList<Notice> result = null;
		CsMapper mapper = session.getMapper(CsMapper.class);
		try {
			result = mapper.selectNoticeList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<Notice> selectFaqList() {
		ArrayList<Notice> result = null;
		CsMapper mapper = session.getMapper(CsMapper.class);
		try {
			result = mapper.selectFaqList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public Faq selectOneFaq(int faqnum) {
		Faq result = null;
		CsMapper mapper = session.getMapper(CsMapper.class);
		try {
			result = mapper.selectOneFaq();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
