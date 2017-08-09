package ariarose.team.project.model;

import ariarose.team.project.vo.UserVO;

public interface LoginDAO {
	public UserVO getUserInfo(UserVO vo);
	public int userLogin(UserVO vo);
}
