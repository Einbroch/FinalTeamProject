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
	/*
		user page 하단에 게시판 형태의 책 list를 뿌리기 위한 function
	 */
	@RequestMapping("/book")
	public @ResponseBody List<ContentsVO> bookContents(@RequestBody ContentsVO vo){
		return cService.getListPlan(vo);
	}
	/*
		bbs에서 책 이름을 찾고자 할 때 사용하는 검색 function
	 */
	@RequestMapping("/search")
	public @ResponseBody List<SlotPlanVO> searcBBSList(@RequestBody SearchVO vo){
		return service.searchBBSList(vo);
	}
	/*
		bbs에서 page처리를 하기 위해 만든 function
	 */
	@RequestMapping("/data/{page}")
	public @ResponseBody List<SlotPlanVO> bbslist(@PathVariable int page){
	   System.out.println(service.getBBSList(page));
	   System.out.println("controller"+page);
	      return service.getBBSList(page);
	}
	
	
}
