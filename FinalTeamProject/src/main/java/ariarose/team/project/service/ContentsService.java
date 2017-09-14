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
	/*
		mapper 사용을 위한 클래스 설정 function
	 */
	public ContentsDAO contentsMapper(){
		return sqlSession.getMapper(ContentsDAO.class);
	}
	/*
		계획을 저장할 경우 ID값에 새로운 값을 업데이트 하지 않고 지우기 새로쓰기위해 사용하는 지우는 function
	 */
	public boolean deletePlan(ContentsVO vo){
		if(contentsMapper().deletePlan(vo)>0){
			return true;
		}
		return false;
	}
	
	/*
		계획을 저장할 경우 ID값에 새로운 값을 업데이트 하지 않고 지우기 새로쓰기위해 사용하는 새로쓰는 function
	 */
	public boolean insertPlan(ContentsVO vo){
		if(contentsMapper().insertPlan(vo)>0){
			return true;
		}
		return false;
	}
	
	/*
		내가 저장한 계획 list를 불러오는 function
	 */
	public List<ContentsVO> getListPlan(ContentsVO vo){
		return contentsMapper().getListPlan(vo);
	}
	
	/*
		사진을 저장할 경우 사용하는 function
	 */
	public boolean updateContents(ContentsVO vo){
		if(contentsMapper().updateContents(vo)>0){
			return true;
		}
		return false;
	}
	
	/*
		책을 만들었을 경우 bbs list에 뿌려주기 위해 Y값을 바꾸는 function
	 */
	public boolean updateBook(ContentsVO vo){
		if(contentsMapper().updateBook(vo)>0){
			return true;
		}
		return false;
	}
}
