package ariarose.team.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ariarose.team.project.service.AccomService;
import ariarose.team.project.vo.AccomVO;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	
	@Inject
	private AccomService service;
	
	@RequestMapping("/ownerMain")
	public void ownerMain(){}
	
	@RequestMapping("/testMap")
	public void testMap(){}
	
	@RequestMapping("/getListAccom")
	public @ResponseBody List<AccomVO>
		getListAccom(@RequestBody AccomVO vo){
		System.out.println("list"+service.getListAccom(vo));
		return service.getListAccom(vo);
	}
}
