package ariarose.team.project.model;

import java.util.List;

import ariarose.team.project.vo.LeisureVO;

public interface LeisureDAO {
	public List<LeisureVO> getListLeisure(LeisureVO vo);
}
