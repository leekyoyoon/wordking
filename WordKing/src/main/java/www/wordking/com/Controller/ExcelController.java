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
import www.wordking.com.VO.Excel;


@Controller
public class ExcelController {
	@Autowired
	ExcelService service;

	@RequestMapping(value = "/downloadExcelFile", method = RequestMethod.POST)
	public String downloadExcelFile(Model model) {
		String[] names = {"ÀÚ¸ù", "¾ÖÇÃ¸Á°í", "¸á·Ð", "¿À·»Áö"};
		long[] prices = {5000, 10000, 7000, 6000};
		int[] quantities = {50, 50, 40, 40};
		List<Excel> list = service.makeFruitList(names, prices, quantities);

		SXSSFWorkbook workbook = service.excelFileDownloadProcess(list);

		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "°úÀÏÇ¥");

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
