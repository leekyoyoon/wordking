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
	public String insertWord(String[] WordName,String[] Meaning,HttpSession session) {
		Word word = new Word();
		word.setUserId((String)session.getAttribute("loginId"));
		
		for (int i = 0; i < Meaning.length; i++) {
			System.out.println(WordName[i].toString() +" : "+Meaning[i].toString());
			word.setMeaning(Meaning[i]);
			word.setWord(WordName[i]);
			int result = dao.insertWord(word);
			System.out.println("result의값 (word_seq) : " + result);
			word.setWord_seq(result);
			if (result != 0) {
				dao.insertVocaList(word);
			}
		}
		return "true";
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
