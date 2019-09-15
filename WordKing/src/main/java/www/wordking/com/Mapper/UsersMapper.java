package www.wordking.com.Mapper;

import www.wordking.com.VO.Users;

public interface UsersMapper {

	public int insertUsers(Users user);
	public int validUserId(String userId);
	public int loginUserId(Users user);
	public int withdraw(String userId);
	public Users select(String id);
	public int userUpdate(Users vo);
}
