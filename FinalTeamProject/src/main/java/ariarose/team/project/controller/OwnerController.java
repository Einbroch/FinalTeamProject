package ariarose.team.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ariarose.team.project.service.AccomService;
import ariarose.team.project.service.LeisureService;
import ariarose.team.project.service.RentService;
import ariarose.team.project.vo.AccomVO;
import ariarose.team.project.vo.LeisureVO;
import ariarose.team.project.vo.RentVO;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	
	@Inject
	private AccomService accomService;
	
	@Inject
	private RentService rentService;
	
	@Inject
	private LeisureService leisureService;
	
	@RequestMapping("/ownerMain")
	public void ownerMain(){}
	
	@RequestMapping("/testMap")
	public void testMap(){}
	
	/*
		숙소의 list를 가져오기 위한 function
	 */
	@RequestMapping("/getListAccom")
	public @ResponseBody List<AccomVO>
		getListAccom(@RequestBody AccomVO vo){
		System.out.println("accomlist"+accomService.getListAccom(vo));
		return accomService.getListAccom(vo);
	}
	/*
		렌트의 list를 가져오기 위한 function
	 */
	@RequestMapping("/getListRent")
	public @ResponseBody List<RentVO>
		getListRent(@RequestBody RentVO vo){
		System.out.println("rentlist"+rentService.getListRent(vo));
		return rentService.getListRent(vo);
	}
	/*
		레져의 list를 가져오기 위한 function
	 */
	@RequestMapping("/getListLeisure")
	public @ResponseBody List<LeisureVO>
		getListLeisure(@RequestBody LeisureVO vo){
		System.out.println("leisurelist"+leisureService.getListLeisure(vo));
		return leisureService.getListLeisure(vo);
	}
}
