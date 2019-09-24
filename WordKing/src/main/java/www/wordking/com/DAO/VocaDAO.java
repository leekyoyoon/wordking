package www.wordking.com.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.wordking.com.Mapper.VocaMapper;
import www.wordking.com.VO.Voca;
import www.wordking.com.VO.Word;


@Repository
public class VocaDAO {

	@Autowired
	SqlSession session;
	
	public int insertVoca(Voca voca) {
		VocaMapper mapper = session.getMapper(VocaMapper.class);
		int result = mapper.insertVoca(voca);
		return result;
	}

	public int insertImage(Voca voca) {
		VocaMapper mapper = session.getMapper(VocaMapper.class);
		int result = mapper.insertImage(voca);
		return result;
	}

	public ArrayList<Word> totalSearch(String searchList) {
		VocaMapper mapper = session.getMapper(VocaMapper.class);
		ArrayList<Word> result = mapper.totalSearch(searchList);
		return result;
	}

	public ArrayList<Voca> myVoca(Voca voca) {
		VocaMapper mapper = session.getMapper(VocaMapper.class);

		ArrayList<Voca> result = mapper.myVoca(voca);

		return result;
	}

	public ArrayList<Word> MySearch(Voca voca) {
		VocaMapper mapper = session.getMapper(VocaMapper.class);
		ArrayList<Word> result = mapper.MySearch(voca);
		return result;
	}
}
