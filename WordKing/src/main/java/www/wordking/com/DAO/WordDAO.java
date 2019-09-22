package www.wordking.com.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.wordking.com.Mapper.WordMapper;
import www.wordking.com.VO.Voca;
import www.wordking.com.VO.Word;

@Repository
public class WordDAO {
	@Autowired
	SqlSession session;

	public int insertWord(Word word) {
		WordMapper mapper = session.getMapper(WordMapper.class);

		int result = mapper.insertWord(word);

		return result;
	}

	public ArrayList<Voca> searchVoca(Voca voca) {
		WordMapper mapper = session.getMapper(WordMapper.class);

		ArrayList<Voca> result = mapper.searchVoca(voca);

		return result;
	}

	public Word testDetail(Voca voca) {
		WordMapper mapper = session.getMapper(WordMapper.class);
		
		Word result = mapper.testDetail(voca);
		
		return result;
	}

	public ArrayList<Word> startTest(int seq) {
		WordMapper mapper = session.getMapper(WordMapper.class);
		
		ArrayList<Word> result = mapper.startTest(seq);
		return result;
	}

	public ArrayList<Word> Random(int seq) {
		WordMapper mapper = session.getMapper(WordMapper.class);
			
		ArrayList<Word> result = mapper.Random(seq);
		return result;
	}

	public ArrayList<Word> MeanTest(int seq) {
		WordMapper mapper = session.getMapper(WordMapper.class);
		
		ArrayList<Word> result = mapper.MeanTest(seq);
		return result;
	}

	public ArrayList<Word> RanMean(int seq) {
		WordMapper mapper = session.getMapper(WordMapper.class);
		
		ArrayList<Word> result = mapper.RanMean(seq);
		return result;
	}
	
	public int insertVocaList(Word word) {
		WordMapper mapper = session.getMapper(WordMapper.class);
		
		int result = mapper.insertVocaList(word);
		
		return result;
		
	}
}



