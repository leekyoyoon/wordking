package www.wordking.com.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.wordking.com.Mapper.VocaMapper;
import www.wordking.com.VO.Voca;


@Repository
public class VocaDAO {

	@Autowired
	SqlSession session;
	
	public int insertVoca(Voca voca) {
		VocaMapper mapper = session.getMapper(VocaMapper.class);
		int result = mapper.insertVoca(voca);
		return result;
	}
}
