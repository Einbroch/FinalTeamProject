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
	
	public AccomDAO accomMapper(){
		return sqlSession.getMapper(AccomDAO.class);
	}
	
	public List<AccomVO> getListAccom(AccomVO vo){
		return accomMapper().getListAccom(vo);
	}
}
