package www.wordking.com.Controller;

import java.awt.List;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import www.wordking.com.DAO.UsersDAO;
import www.wordking.com.DAO.VocaDAO;
import www.wordking.com.DAO.WordDAO;
import www.wordking.com.VO.Users;
import www.wordking.com.VO.Voca;
import www.wordking.com.VO.Word;


@Controller
public class VocaController {

	@Autowired
	VocaDAO vdao;

	@Autowired
	WordDAO wdao;
	
	@Autowired
	UsersDAO udao;


	@RequestMapping(value="/createVoca",method=RequestMethod.POST)
	@ResponseBody
	public String createVoca(Voca voca,HttpSession session) {

		String id= (String)session.getAttribute("loginId");
		voca.setUserid(id);
		System.out.println(voca.toString());
		int result = 0;
		
		try {
			result = vdao.insertVoca(voca);
			System.out.println("result = " + result);

		} catch (Exception e) {
			return "false";
		}
		if (result ==0) {
			return "false";
		}
		return "true";
	}


	@RequestMapping(value="/insertImage",method=RequestMethod.POST)
	public String insertImage(Voca voca,HttpSession session,MultipartFile uploadFile) {

		voca.setImage(uploadFile.getOriginalFilename());
		String id= (String)session.getAttribute("loginId");
		voca.setUserid(id);
		int result = 0;
		try {
			result = vdao.insertImage(voca);
		} catch (Exception e) {
			return "redirect:/insertVoca";
		}
		if (result !=1) {
			return "redirect:/insertVoca";
		}
		String aa = session.getServletContext().getRealPath("/")+"/resources/img/";
		try {
			uploadFile.transferTo(new File(aa+uploadFile.getOriginalFilename()));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			return "redirect:/insertVoca";
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/totalSearch",method=RequestMethod.POST)
	@ResponseBody public ArrayList<Word> totalSearch(String searchList, HttpSession session) {
		
		ArrayList<Word> result = vdao.totalSearch(searchList);

		return result;
	}
	
	@RequestMapping(value="/MySearch",method=RequestMethod.POST)
	@ResponseBody public ArrayList<Word> MySearch(Voca voca, HttpSession session) {
		String userid= (String)session.getAttribute("loginId");
		voca.setUserid(userid);
		ArrayList<Word> result = vdao.MySearch(voca);

		return result;
	}
	
	@RequestMapping(value="/showdetail",method=RequestMethod.GET)
	public String showdetail(int seq,HttpSession session, Model model) {
		String userid = (String)session.getAttribute("loginId");

		if(userid != null) {
			
			ArrayList<Word> result = wdao.showdetail(seq);
			
			model.addAttribute("seq", seq);
			model.addAttribute("result", result);
			
			return "resources/part/showdetail";
		}else{
			return "resources/part/signIn";
		}
	}
	
	@RequestMapping(value="/myVoca",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Voca> myVoca(Voca voca,HttpSession session) {
		String userid = (String)session.getAttribute("loginId");
		
		Users users = udao.select(userid);
		
		voca.setUserid(users.getUserId());

		ArrayList<Voca> result = vdao.myVoca(voca);
		
		return result;
	}
	
	@RequestMapping(value="/downDetail",method=RequestMethod.GET)
	@ResponseBody public ArrayList<Word> downDetail(int seq,HttpSession session, Model model) {
		String userid = (String)session.getAttribute("loginId");
		
		ArrayList<Word> result = new ArrayList<Word>();
		if(userid != null) {
			
			result = wdao.showdetail(seq);

			return result;
		}else{
			return result;
		}
	}
}