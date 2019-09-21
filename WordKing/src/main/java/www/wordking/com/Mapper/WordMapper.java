package www.wordking.com.Mapper;

import java.util.ArrayList;

import www.wordking.com.VO.Voca;
import www.wordking.com.VO.Word;

public interface WordMapper {

	int insertWord(Word word);

	ArrayList<Voca> searchVoca(Voca voca);
	
	ArrayList<Word> testDetail(Voca voca);
}
