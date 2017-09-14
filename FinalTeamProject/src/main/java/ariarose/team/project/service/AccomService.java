package ariarose.team.project.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import ariarose.team.project.model.AccomDAO;
import ariarose.team.project.vo.AccomVO;

@Service
public class AccomService {

	@Inject
	private SqlSessionTemplate sqlSession;
	/*
		mapper 사용을 위한 클래스 설정 function
	 */
	public AccomDAO accomMapper(){
		return sqlSession.getMapper(AccomDAO.class);
	}
	/*
		mapper에서 숙소의 List를 가져오기 위한 function 
	 */
	public List<AccomVO> getListAccom(AccomVO vo){
		return accomMapper().getListAccom(vo);
	}
}
