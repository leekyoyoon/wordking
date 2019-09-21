package www.wordking.com.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.wordking.com.DAO.VocaDAO;
import www.wordking.com.VO.Voca;


@Controller
public class VocaController {

	@Autowired
	VocaDAO vdao;
	
	@RequestMapping(value="/insertVoca",method=RequestMethod.POST)
	@ResponseBody
	public String insertVoca(Voca voca) {
		int result = vdao.insertVoca(voca);
		if (result !=1) {
			return "false";
		}
		return "true";
	}
}
