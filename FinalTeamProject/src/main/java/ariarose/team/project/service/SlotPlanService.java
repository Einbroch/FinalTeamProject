package ariarose.team.project.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import ariarose.team.project.model.SlotPlanDAO;
import ariarose.team.project.vo.SearchVO;
import ariarose.team.project.vo.SlotPlanVO;

@Service
public class SlotPlanService {
	@Inject
	private SqlSessionTemplate sqlSession;
	/*
		mapper 사용을 위한 클래스 설정 function
	 */
	public SlotPlanDAO slotMapper(){
		return sqlSession.getMapper(SlotPlanDAO.class);
	}
	
	/*
		mapper 에서 슬롯을 저장하기 위한 function 
	 */
	public boolean registSlotPlan(SlotPlanVO vo){
		if(slotMapper().registSlotPlan(vo)>0){
			return true;
		}
		return false;
	}
	
	/*
		mapper 에서 저장한 slot data를 가져오기 위한 function
	 */
	public SlotPlanVO getSlotData(SlotPlanVO vo){
		vo = slotMapper().getSlotData(vo);
		return vo;
	}
	
	/*
		mapper 에서 각 아이디에 따라 가져오는 3개의 slot List를 불러오는 function 
	 */
	public List<SlotPlanVO> getSlotPlan(SlotPlanVO vo){
		return slotMapper().getSlotPlan(vo);
	}
	
	/*
		mapper 에서 슬롯을 저장했을 때 update함
	 */
	public boolean updateSlotPlan(SlotPlanVO vo){
		if(slotMapper().updateSlotPlan(vo)>0){
			return true;
		}
		return false;
	}
	
	/*
		mapper 에서 책을 만들 경우 bbs list에 보여지기 위한 Y값을 설정 
	 */
	public boolean slotUpdateBook(SlotPlanVO vo){
		if(slotMapper().slotUpdateBook(vo)>0){
			return true;
		}
		return false;
	}
	
	/*
	 	mapper 에서 BBS List를 보여주기 위해 가져오는 List function
	 */
	public List<SlotPlanVO> getBBSList(int value){
		return slotMapper().getBBSList(value*100);
	}
	
	/*
 		mapper 에서 검색한 BBS List를 보여주기 위해 가져오는 List function
	 */
	public List<SlotPlanVO> searchBBSList (SearchVO vo){
		return slotMapper().searchBBSList(vo);
	}
}
