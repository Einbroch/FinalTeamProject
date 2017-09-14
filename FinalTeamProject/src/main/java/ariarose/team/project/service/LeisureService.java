package ariarose.team.project.service;

import org.mybatis.spring.SqlSessionTemplate;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ariarose.team.project.model.LeisureDAO;
import ariarose.team.project.vo.LeisureVO;

@Service
public class LeisureService {

	@Inject
	private SqlSessionTemplate sqlSession;
	/*
		mapper 사용을 위한 클래스 설정 function
	 */
	public LeisureDAO leisureMapper(){
		return sqlSession.getMapper(LeisureDAO.class);
	}
	/*
		mapper에서 레져의 List를 가져오기 위한 function
	 */
	public List<LeisureVO> getListLeisure(LeisureVO vo){
		return leisureMapper().getListLeisure(vo);
	}
}
