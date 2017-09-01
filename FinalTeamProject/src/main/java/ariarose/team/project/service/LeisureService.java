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
	
	public LeisureDAO leisureMapper(){
		return sqlSession.getMapper(LeisureDAO.class);
	}
	
	public List<LeisureVO> getListLeisure(LeisureVO vo){
		return leisureMapper().getListLeisure(vo);
	}
}
