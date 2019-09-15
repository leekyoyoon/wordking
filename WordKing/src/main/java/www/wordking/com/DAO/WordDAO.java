package www.wordking.com.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.wordking.com.Mapper.WordMapper;
import www.wordking.com.VO.Word;

@Repository
public class WordDAO {
	@Autowired
	SqlSession session;

	public int insertVoca(Word word) {
		WordMapper mapper = session.getMapper(WordMapper.class);
		
		int result = mapper.insertVoca(word);
		
		return result;
	}
	
	
}
