package ariarose.team.project.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import ariarose.team.project.model.RegistDAO;
import ariarose.team.project.vo.UserVO;

@Service
public class RegistService {
	@Inject
	private SqlSessionTemplate sqlSession;
	
	public RegistDAO registMapper(){
		return sqlSession.getMapper(RegistDAO.class);
	}
	
	public boolean registUser(UserVO vo){
		if(registMapper().registUser(vo)>0){
			return true;
		}
		return false;
	}
	
	public boolean checkUserId(UserVO vo){
		if(registMapper().checkUserId(vo)>0){
			return false;
		}
		return true;
	}
	public boolean modifyUser(UserVO vo){
		if(registMapper().modifyUser(vo)>0){
			return true;
		}
		return false;
	}
	
	public UserVO getRegistUser(UserVO vo){
		vo = registMapper().getRegistUser(vo);
		return vo;
	}
}
