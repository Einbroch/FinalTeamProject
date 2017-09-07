package ariarose.team.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ariarose.team.project.service.SlotPlanService;
import ariarose.team.project.vo.SlotPlanVO;

@Controller
@RequestMapping("/bbs")
public class BBSController {
	
	@Inject
	private SlotPlanService service;
	
	
	@RequestMapping("/data/{page}")
	   public @ResponseBody List<SlotPlanVO> bbslist(@PathVariable int page){
	   System.out.println(service.getBBSList(page));
	   System.out.println("controller"+page);
	      return service.getBBSList(page);
	}
	
}
