package www.wordking.com.Controller;

import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import www.wordking.com.DAO.ExcelService;
import www.wordking.com.DAO.WordDAO;
import www.wordking.com.VO.Excel;


@Controller
public class ExcelController {
	@Autowired
	ExcelService service;
	@Autowired
	WordDAO wdao;

	@RequestMapping(value = "/downloadExcelFile", method = RequestMethod.POST)
	public String downloadExcelFile(String[] Word, String[] Meaning, String title, Model model) {
		
		List<Excel> list = service.makeFruitList(Word, Meaning);
		  
		SXSSFWorkbook workbook = service.excelFileDownloadProcess(list, title);
		  
		model.addAttribute("locale", Locale.KOREA); 
		model.addAttribute("workbook", workbook); 
		model.addAttribute("workbookName", title);
		 

		return "excelDownloadView";
	}

	@RequestMapping(value = "/uploadExcelFile", method = RequestMethod.POST)
	@ResponseBody public List<Excel> uploadExcelFile(MultipartHttpServletRequest request, Model model) {
		MultipartFile file = null;
		
		Iterator<String> iterator = request.getFileNames();
		
		if(iterator.hasNext()) {
			file = request.getFile(iterator.next());
		}
		
		
		List<Excel> list = service.uploadExcelFile(file);

		return list;
	}


}
