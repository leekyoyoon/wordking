package www.wordking.com;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "WEB-INF/views/home";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String returnHome() {	
		return "redirect:/";
	}
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/gosignUP",method=RequestMethod.GET)
	public String gosignUP() {
		return "WEB-INF/views/signUp";
	}
	
	@RequestMapping(value="/goMypage",method=RequestMethod.GET)
	public String goMypage(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId != null) {
			return "resources/part/myPage";
		}else{
			return "resources/part/signIn";
		}
	}
	
	@RequestMapping(value="/goFileword",method=RequestMethod.GET)
	public String goFileword(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId != null) {
			return "resources/part/fileForm";
		}else{
			return "resources/part/signIn";
		}
	}
	
	@RequestMapping(value="/goInsertword",method=RequestMethod.GET)
	public String goInsertword(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId != null) {
			return "resources/part/insertWord";
		}else{
			return "resources/part/signIn";
		}
	}
	
	@RequestMapping(value = "/createAccount", method = RequestMethod.GET)
	public String createAccount() {
		return "WEB-INF/views/signUp";
	}
	
	@RequestMapping(value="/goVocaList",method=RequestMethod.GET)
	public String goVocaList(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId != null) {
			return "resources/part/vocaList";
		}else{
			return "resources/part/signIn";
		}
	}
	
	@RequestMapping(value="/goInsertWord",method=RequestMethod.GET)
	public String goInsertWord(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId != null) {
			return "resources/part/insertWord";
		}else{
			return "resources/part/signIn";
		}
	}
	
	@RequestMapping(value="/goUpdate",method=RequestMethod.POST)
	public String goUpdate(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId != null) {
			return "resources/part/userUpdate";
		}else{
			return "resources/part/signIn";
		}
	}
	
	@RequestMapping(value="/goWithdraw",method=RequestMethod.POST)
	public String goWithdraw(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId != null) {
			return "resources/part/userWithdraw";
		}else{
			return "resources/part/signIn";
		}
	}
}
