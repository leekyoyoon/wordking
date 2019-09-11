package www.wordking.com.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.wordking.com.DAO.csDAO;
import www.wordking.com.VO.Faq;
import www.wordking.com.VO.Notice;

@Controller
public class csController {

	@Autowired
	csDAO csDAO;
	
	// FAQ 자주묻는질문 리스트
		@RequestMapping(value="/selectFaqList", method=RequestMethod.POST)
		@ResponseBody
		public ArrayList<Notice> selectFaqList(){
			ArrayList<Notice> resultList = null;
			resultList = csDAO.selectFaqList();
			return resultList;
		}
	
	// FAQ 자주묻는질문 상세
	@RequestMapping(value="/selectOneFaq", method=RequestMethod.POST)
	@ResponseBody
	public Faq selectOneFaq(int faqnum){
		Faq result = null;
		result = csDAO.selectOneFaq(faqnum);
		return result;
	}
		
	// 공지사항 리스트 
	@RequestMapping(value="/selectNoticeList", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Notice> selectNoticeList(){
		ArrayList<Notice> resultList = null;
		resultList = csDAO.selectNoticeList();
		return resultList;
	}
}
