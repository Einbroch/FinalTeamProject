package ariarose.team.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ariarose.team.project.service.ContentsService;
import ariarose.team.project.service.SlotPlanService;
import ariarose.team.project.vo.ContentsVO;
import ariarose.team.project.vo.SearchVO;
import ariarose.team.project.vo.SlotPlanVO;

@Controller
@RequestMapping("/bbs")
public class BBSController {
	
	@Inject
	private SlotPlanService service;
	@Inject
	private ContentsService cService;
	
	@RequestMapping("/book")
	public @ResponseBody List<ContentsVO> bookContents(@RequestBody ContentsVO vo){
		return cService.getListPlan(vo);
	}
	
	@RequestMapping("/search")
	public @ResponseBody List<SlotPlanVO> searcBBSList(@RequestBody SearchVO vo){
		return service.searchBBSList(vo);
	}
	
	@RequestMapping("/data/{page}")
	public @ResponseBody List<SlotPlanVO> bbslist(@PathVariable int page){
	   System.out.println(service.getBBSList(page));
	   System.out.println("controller"+page);
	      return service.getBBSList(page);
	}
	
	
}
