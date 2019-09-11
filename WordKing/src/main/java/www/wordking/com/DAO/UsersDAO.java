package www.wordking.com.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.wordking.com.Mapper.UsersMapper;
import www.wordking.com.VO.Users;

@Repository
public class UsersDAO {

	@Autowired
	SqlSession session;
	
	public int insertUsers(Users user) {
		UsersMapper mapper = session.getMapper(UsersMapper.class);
		int result = mapper.insertUsers(user);
		return result;
	}
	public int validUserId(String userId) {
		UsersMapper mapper = session.getMapper(UsersMapper.class);
		int result = mapper.validUserId(userId);
		return result;
	}
	public int loginUserId(Users user) {
		UsersMapper mapper = session.getMapper(UsersMapper.class);
		int result = mapper.loginUserId(user);
		return result;
	}

}
