package ariarose.team.project.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import ariarose.team.project.model.LoginDAO;
import ariarose.team.project.vo.UserVO;

@Service
public class LoginService {
	
	@Inject
	private SqlSessionTemplate sqlSession;
	/*
		mapper 사용을 위한 클래스 설정 function
	 */
	public LoginDAO loginMapper(){
		return sqlSession.getMapper(LoginDAO.class);
	}
	
	/*
		로그인 후 session값을 저장하기 위해 사용하는 function
	 */
	public UserVO getUserInfo(UserVO vo){
		vo = loginMapper().getUserInfo(vo);
		return vo;
	}
	
	/*
		로그인 하기 위해 id, pw값을 mapper에서 사용하기 위한 function
	 */
	public boolean userLogin(UserVO vo){
		if(loginMapper().userLogin(vo)>0){
			return true;
		}
		return false;
	}
	
}
