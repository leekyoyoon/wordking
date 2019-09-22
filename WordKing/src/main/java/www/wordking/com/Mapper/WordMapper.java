package www.wordking.com.Mapper;

import java.util.ArrayList;

import www.wordking.com.VO.Voca;
import www.wordking.com.VO.Word;

public interface WordMapper {

	public int insertWord(Word word);
	public ArrayList<Voca> searchVoca(Voca voca);
	public ArrayList<Word> testDetail(Voca voca);
	public int insertVocaList(Word word);
}
