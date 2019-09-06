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
		int result = 0;
		try {
			result = udao.insertUsers(user);
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
	
}
