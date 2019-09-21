package www.wordking.com.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.wordking.com.DAO.UsersDAO;
import www.wordking.com.DAO.WordDAO;
import www.wordking.com.VO.Users;
import www.wordking.com.VO.Voca;
import www.wordking.com.VO.Word;

@Controller
public class WordController {
	@Autowired
	WordDAO dao;
	@Autowired
	UsersDAO udao;

	@RequestMapping(value="/insertWord",method=RequestMethod.POST)
	@ResponseBody
	public int insertWord(Word word,HttpSession session) {
		word.setUserId((String)session.getAttribute("loginId"));
		
		System.out.println(word);
		
		int result = dao.insertWord(word);
		
		return result;
	}
	
	@RequestMapping(value="/searchVoca",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Voca> searchVoca(Voca voca,HttpSession session) {
		String userid = (String)session.getAttribute("loginId");
		
		Users users = udao.select(userid);
		
		voca.setUserid(users.getUserId());

		ArrayList<Voca> result = dao.searchVoca(voca);
		
		return result;
	}
	
	@RequestMapping(value="/testDetail",method=RequestMethod.GET)
	public String testDetail(Voca voca,HttpSession session, Model model) {
		String userid = (String)session.getAttribute("loginId");

		if(userid != null) {
			
			Users users = udao.select(userid);
			
			voca.setUserid(users.getUserId());
			
			ArrayList<Word> result = dao.testDetail(voca);
			
			model.addAttribute("result", result);
			
			return "resources/part/testDetail";
		}else{
			return "resources/part/signIn";
		}
	}
}
