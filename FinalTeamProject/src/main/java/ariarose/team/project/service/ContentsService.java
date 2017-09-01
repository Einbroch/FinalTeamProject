package ariarose.team.project.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import ariarose.team.project.model.ContentsDAO;
import ariarose.team.project.vo.ContentsVO;

@Service
public class ContentsService {

	@Inject
	private SqlSessionTemplate sqlSession;
	
	public ContentsDAO contentsMapper(){
		return sqlSession.getMapper(ContentsDAO.class);
	}
	
	public boolean deletePlan(ContentsVO vo){
		if(contentsMapper().deletePlan(vo)>0){
			return true;
		}
		return false;
	}
	
	public boolean insertPlan(ContentsVO vo){
		if(contentsMapper().insertPlan(vo)>0){
			return true;
		}
		return false;
	}
	
	public List<ContentsVO> getListPlan(ContentsVO vo){
		return contentsMapper().getListPlan(vo);
	}
}
