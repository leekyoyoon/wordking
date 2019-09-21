package www.wordking.com.Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import www.wordking.com.DAO.csDAO;
import www.wordking.com.VO.Faq;
import www.wordking.com.VO.Inquiry;
import www.wordking.com.VO.Notice;

@Controller
public class csController {
	
	final static String UPLOADPATH = "D:/Filetest/";
	
	@Autowired
	csDAO csDAO;
	
	// 1��1�����ϱ� ������ �̵�
	@RequestMapping(value="/gotoInquiry",method=RequestMethod.GET)
	public String gotoInquiry() {
		return "resources/part/inquiryForm";
	}
	
	// FAQ ���ֹ������� ����Ʈ
	@RequestMapping(value="/selectFaqList", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Faq> selectFaqList(){
		ArrayList<Faq> resultList = null;
		resultList = csDAO.selectFaqList();
		return resultList;
	}
		
	// �������� ����Ʈ  ���
	@RequestMapping(value="/selectNoticeList", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Notice> selectNoticeList(){
		ArrayList<Notice> resultList = null;
		resultList = csDAO.selectNoticeList();
		return resultList;
	}
	
	// 1��1 ���ǻ��� ���
	@RequestMapping(value="/insertInquiry", method=RequestMethod.POST)
	@ResponseBody
	public String insertInquiry(Inquiry inquiry, MultipartFile upload, HttpSession session, Model model){
		
		// ���� ���ε� ó��
		String saveName = "null";
		System.out.println(upload);
		if(!(upload.isEmpty()||upload==null||upload.getSize()==0)){
			String orgName = upload.getOriginalFilename();
			Date date = new Date();
			saveName = date.getTime()+orgName;
			try {
				upload.transferTo(new File(UPLOADPATH+saveName));
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		inquiry.setInquiryupload(saveName);
		
		String Inquiryuserid = (String) session.getAttribute("loginId");
		inquiry.setInquiryuserid(Inquiryuserid);
		
		int result = 0;
		result = csDAO.insertInquiry(inquiry);
		
		if(result > 0){
			model.addAttribute("result", "true");
			return "redirect:/resources/part/inquiryForm";
		}
		model.addAttribute("result", "false");
		return "insertInquiry";
	}
	
	// 1��1 ���ǻ��� ����Ʈ  ���
	@RequestMapping(value="/selectInquiryList", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Inquiry> selectInquiryList(String inquiryuserid){
		ArrayList<Inquiry> resultList = null;
		resultList = csDAO.selectInquiryList(inquiryuserid);
		return resultList;
	}
	
	
}
