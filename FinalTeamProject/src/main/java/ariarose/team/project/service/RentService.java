package ariarose.team.project.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import ariarose.team.project.model.RentDAO;
import ariarose.team.project.vo.RentVO;

@Service
public class RentService {

	@Inject
	private SqlSessionTemplate sqlSession;
	/*
		mapper 사용을 위한 클래스 설정 function
	 */
	public RentDAO rentMapper(){
		return sqlSession.getMapper(RentDAO.class);
	}
	/*
		mapper 에서 렌트의 List를 가져오기 위한 function
	 */
	public List<RentVO> getListRent(RentVO vo){
		return rentMapper().getListRent(vo);
	}
}
