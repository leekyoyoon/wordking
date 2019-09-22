package www.wordking.com.Mapper;

import java.util.ArrayList;

import www.wordking.com.VO.Voca;
import www.wordking.com.VO.Word;

public interface WordMapper {

	public int insertWord(Word word);
	public ArrayList<Voca> searchVoca(Voca voca);
	public Word testDetail(Voca voca);

	public ArrayList<Word> startTest(int seq);

	public ArrayList<Word> Random(int seq);

	public ArrayList<Word> MeanTest(int seq);

	public ArrayList<Word> RanMean(int seq);
	public int insertVocaList(Word word);
}
