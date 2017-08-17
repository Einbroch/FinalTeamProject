package ariarose.team.project.model;

import ariarose.team.project.vo.UserVO;

public interface RegistDAO {
	public int registUser(UserVO vo);
	public int checkUserId(UserVO vo);
	public int modifyUser(UserVO vo);
	public UserVO getRegistUser(UserVO vo);
}
