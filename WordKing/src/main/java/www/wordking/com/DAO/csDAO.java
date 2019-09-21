package www.wordking.com.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.wordking.com.Mapper.CsMapper;
import www.wordking.com.VO.Faq;
import www.wordking.com.VO.Inquiry;
import www.wordking.com.VO.Notice;

@Repository
public class csDAO {

	@Autowired
	SqlSession session;
	
	// �������� ����Ʈ ���
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
	
	// FAQ ���ֹ������� ����Ʈ ���
	public ArrayList<Faq> selectFaqList() {
		ArrayList<Faq> result = null;
		CsMapper mapper = session.getMapper(CsMapper.class);
		try {
			result = mapper.selectFaqList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 1��1 ���ǻ��� ���
	public int insertInquiry(Inquiry inquiry) {
		int result = 0;
		CsMapper mapper = session.getMapper(CsMapper.class);
		try {
			result = mapper.insertInquiry(inquiry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 1��1 ���ǻ��� ����Ʈ ���
	public ArrayList<Inquiry> selectInquiryList(String inquiryuserid) {
		ArrayList<Inquiry> result = null;
		CsMapper mapper = session.getMapper(CsMapper.class);
		try {
			result = mapper.selectInquiryList(inquiryuserid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
