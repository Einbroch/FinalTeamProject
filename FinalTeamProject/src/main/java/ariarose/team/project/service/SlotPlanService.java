package ariarose.team.project.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import ariarose.team.project.model.SlotPlanDAO;
import ariarose.team.project.vo.SlotPlanVO;

@Service
public class SlotPlanService {
	@Inject
	private SqlSessionTemplate sqlSession;
	
	public SlotPlanDAO slotMapper(){
		return sqlSession.getMapper(SlotPlanDAO.class);
	}
	
	public boolean registSlotPlan(SlotPlanVO vo){
		if(slotMapper().registSlotPlan(vo)>0){
			return true;
		}
		return false;
	}
	
	public SlotPlanVO getSlotData(SlotPlanVO vo){
		vo = slotMapper().getSlotData(vo);
		return vo;
	}
	
	public List<SlotPlanVO> getSlotPlan(SlotPlanVO vo){
		return slotMapper().getSlotPlan(vo);
	}
	
	public boolean updateSlotPlan(SlotPlanVO vo){
		if(slotMapper().updateSlotPlan(vo)>0){
			return true;
		}
		return false;
	}
	
	public boolean slotUpdateBook(SlotPlanVO vo){
		if(slotMapper().slotUpdateBook(vo)>0){
			return true;
		}
		return false;
	}
	
	public List<SlotPlanVO> getBBSList(int value){
		return slotMapper().getBBSList(value*100);
	}
}
