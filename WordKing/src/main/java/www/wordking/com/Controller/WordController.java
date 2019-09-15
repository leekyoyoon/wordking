package www.wordking.com.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.wordking.com.DAO.WordDAO;
import www.wordking.com.VO.Word;

@Controller
public class WordController {
	@Autowired
	WordDAO dao;

	@RequestMapping(value="/insertVoca",method=RequestMethod.POST)
	@ResponseBody
	public int insertVoca(Word word,HttpSession session) {
		word.setUserId((String)session.getAttribute("loginId"));
		
		System.out.println(word);
		
		int result = dao.insertVoca(word);
		
		return result;
	}
}
