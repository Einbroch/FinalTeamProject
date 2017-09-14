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
	/*
		mapper 사용을 위한 클래스 설정 function
	 */
	public RegistDAO registMapper(){
		return sqlSession.getMapper(RegistDAO.class);
	}
	
	/*
		회원가입 시에 사용하는 function
	 */
	public boolean registUser(UserVO vo){
		if(registMapper().registUser(vo)>0){
			return true;
		}
		return false;
	}
	
	/*
		id의 중복 여부를 체크하는 function
	 */
	public boolean checkUserId(UserVO vo){
		if(registMapper().checkUserId(vo)>0){
			return false;
		}
		return true;
	}
	
	/*
		회원 정보의 수정을 위한 function
	 */
	public boolean modifyUser(UserVO vo){
		if(registMapper().modifyUser(vo)>0){
			return true;
		}
		return false;
	}
	
	/*
		회원 가입시 slot을 3개 생성하기 위해 사용하는 function
	 */
	public UserVO getRegistUser(UserVO vo){
		vo = registMapper().getRegistUser(vo);
		return vo;
	}
}
