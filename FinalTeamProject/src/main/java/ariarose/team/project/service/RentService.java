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
	
	public RentDAO rentMapper(){
		return sqlSession.getMapper(RentDAO.class);
	}
	
	public List<RentVO> getListRent(RentVO vo){
		return rentMapper().getListRent(vo);
	}
}
