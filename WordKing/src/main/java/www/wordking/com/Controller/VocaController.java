package www.wordking.com.Controller;

import java.awt.List;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import www.wordking.com.DAO.VocaDAO;
import www.wordking.com.DAO.WordDAO;
import www.wordking.com.VO.Voca;


@Controller
public class VocaController {

	@Autowired
	VocaDAO vdao;

	@Autowired
	WordDAO wdao;


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
	
	
}