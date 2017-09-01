package ariarose.team.project.model;

import java.util.List;

import ariarose.team.project.vo.ContentsVO;

public interface ContentsDAO {
	public int deletePlan(ContentsVO vo);
	public int insertPlan(ContentsVO vo);
	public List<ContentsVO> getListPlan(ContentsVO vo);
}
