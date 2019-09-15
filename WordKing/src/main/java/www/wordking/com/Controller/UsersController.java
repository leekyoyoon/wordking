package www.wordking.com.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.wordking.com.DAO.UsersDAO;
import www.wordking.com.VO.Users;

@Controller
public class UsersController {

	@Autowired
	UsersDAO udao;
	
	@RequestMapping(value="/insertUsers",method=RequestMethod.POST)
	@ResponseBody
	public String insertUsers(Users user) {
		System.out.println(user);
		int result = 0;
		try {
			result = udao.insertUsers(user);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result != 1) {
			return "false";
		}
		return "true";
	}
	@RequestMapping(value="/loginUsers",method=RequestMethod.POST)
	@ResponseBody
	public String loginUsers(Users user,HttpSession session) {
		int result = 0;
		try {
			result = udao.loginUserId(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result != 1) {
			return "false";
		}
		session.setAttribute("loginId", user.getUserId());
		return "true";
	}
	
	@RequestMapping(value="/validUserId",method=RequestMethod.POST)
	@ResponseBody
	public String validUserId(Users user) {
		System.out.println(user.getUserId());
		int result = udao.validUserId(user.getUserId());
		if (result ==1) {
			return "false";
		}
		return "true";
	}
	
	@RequestMapping(value="/withdraw",method=RequestMethod.GET)
	@ResponseBody
	public int withdraw(HttpSession session) {	
		String id = (String)session.getAttribute("loginId");
		int result = udao.withdraw(id);
		session.invalidate();
		return result;
	}
	
	@RequestMapping(value="/select",method=RequestMethod.POST)
	@ResponseBody
	public Users select(HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		Users vo = udao.select(id);
		return vo;
	}
	
	@RequestMapping(value="/userUpdate",method=RequestMethod.POST)
	@ResponseBody
	public int userUpdate(Users vo, HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		vo.setUserId(id);
		System.out.println(vo);
		int result = udao.userUpdate(vo);
		System.out.println(result);
		return result;
	}
}
