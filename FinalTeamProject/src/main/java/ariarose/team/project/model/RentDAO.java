package ariarose.team.project.model;

import java.util.List;

import ariarose.team.project.vo.RentVO;

public interface RentDAO {
	public List<RentVO> getListRent(RentVO vo);
	
}
