package www.wordking.com.Mapper;

import www.wordking.com.VO.Users;

public interface UsersMapper {

	public int insertUsers(Users user);
	public int validUserId(String userId);
	public int loginUserId(Users user);
}
