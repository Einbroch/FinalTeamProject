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
	
	public LoginDAO loginMapper(){
		return sqlSession.getMapper(LoginDAO.class);
	}
	
	public UserVO getUserInfo(UserVO vo){
		vo = loginMapper().getUserInfo(vo);
		return vo;
	}
	public boolean userLogin(UserVO vo){
		if(loginMapper().userLogin(vo)>0){
			return true;
		}
		return false;
	}
	
}
