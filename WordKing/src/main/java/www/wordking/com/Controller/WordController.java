package www.wordking.com.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.wordking.com.DAO.WordDAO;
import www.wordking.com.VO.Word;

@Controller
public class WordController {
	@Autowired
	WordDAO wdao;

	@RequestMapping(value="/insertWord",method=RequestMethod.POST)
	@ResponseBody
	public int insertWord(Word word,HttpSession session) {
		word.setUserId((String)session.getAttribute("loginId"));
		
		System.out.println(word);
		
		int result = wdao.insertWord(word);
		
		return result;
	}
	@RequestMapping(value="/crawlingWord",produces = "application/text; charset=utf8",method=RequestMethod.POST)
	@ResponseBody
	public String insertWord(String category,String word,int checking) {
		String url = "";
		String meanTag = "";
		String contentsTag ="";
		switch (category) {
		case "kr":
			url = "https://ko.dict.naver.com/small_search.nhn?query="+word;
			meanTag = "p";
			contentsTag="div.section";
			break;
		case "eng":
			url = "https://endic.naver.com/popManager.nhn?sLn=kr&m=search&query="+word;
			meanTag = "span.fnt_k05";
			contentsTag = "div#content";
			break;
		case "jp":
			url = "https://ja.dict.naver.com/search.nhn?query="+word+"&m=mini";
			meanTag = "span.pin";
			contentsTag = "div.section";
			break;
		case "cn":
			url = "http://cndic.naver.com/mini/search/all?q="+word;
			if (checking ==1) {
				meanTag = "span.sc";
			} else {
				meanTag ="li";
			}
			//아래는 한>중일때의 컨텐츠태그..
			contentsTag = "div.word_result";
			break;
		case "fr":
			url = "https://dict.naver.com/frkodict/mini/search_mini.nhn?query="+word;
			if (checking ==1) {		//1이면 한>프 and 0이면 프>한
				meanTag = "span.fkEntrySearch";
			} else {
				meanTag = "ul";
			}
			contentsTag ="div.section";
			break;

		default:
			return "false";
		}
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String aa = word + "의 뜻 \n";
        aa += "======================\n";
		List<String> el = doc.select(contentsTag).select(meanTag).eachText();
		for (int i = 0; i < el.size(); i++) {
			aa += el.get(i) + "\n";
		}
		System.out.println(aa);
		return aa;
	}
	
	@RequestMapping(value="/testtset",method=RequestMethod.POST)
	@ResponseBody
	public String testtset() {
		String result ="";
//		Tesseract tesseract = new Tesseract(); 
//        try { 
//  
//            tesseract.setDatapath("D:/Tess4J/tessdata"); 
//  
//            // the path of your tess data folder 
//            // inside the extracted file 
//            String text 
//                = tesseract.doOCR(new File("image.jpg")); 
//  
//            // path of your image file 
//            System.out.print(text); 
//        } 
//        catch (TesseractException e) { 
//            e.printStackTrace(); 
//        } 
		return result;
	}
}
