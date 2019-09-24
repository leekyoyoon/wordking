package www.wordking.com.Mapper;

import java.util.ArrayList;

import www.wordking.com.VO.Voca;
import www.wordking.com.VO.Word;

public interface VocaMapper {

	public int insertVoca(Voca voca);
	public int insertImage(Voca voca);
	public ArrayList<Word> totalSearch(String searchList);
	public ArrayList<Voca> myVoca(Voca voca);
	public ArrayList<Word> MySearch(Voca voca);
}
