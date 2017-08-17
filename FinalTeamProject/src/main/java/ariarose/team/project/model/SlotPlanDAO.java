package ariarose.team.project.model;

import java.util.List;

import ariarose.team.project.vo.SlotPlanVO;

public interface SlotPlanDAO {
	public int registSlotPlan(SlotPlanVO vo);
	public List<SlotPlanVO> getSlotPlan(SlotPlanVO vo);
	public int updateSlotPlan(SlotPlanVO vo);
}
