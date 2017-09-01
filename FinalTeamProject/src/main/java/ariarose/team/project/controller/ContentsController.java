package ariarose.team.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ariarose.team.project.service.ContentsService;
import ariarose.team.project.vo.ContentsVO;

@Controller
@RequestMapping("/contents")
public class ContentsController {
	
	@Inject
	private ContentsService service;
	
	@RequestMapping("/deletePlan")
	public ResponseEntity<ContentsVO> deletePlan(
			@RequestBody ContentsVO vo){
		ResponseEntity<ContentsVO> entity = null;
		//System.out.println("deletePlan : "+vo);
		if(service.deletePlan(vo)){
			entity = new ResponseEntity<ContentsVO>(vo, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<ContentsVO>(vo, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/insertPlan")
	public ResponseEntity<ContentsVO> insertPlan(
			@RequestBody ContentsVO vo){
		/*System.out.println("insert들어옴");*/
		System.out.println(vo);
		ResponseEntity<ContentsVO> entity = null;
		if(service.insertPlan(vo)){
			entity = new ResponseEntity<ContentsVO>(vo, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<ContentsVO>(vo, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/getListPlan")
	public @ResponseBody List<ContentsVO> 
		getListPlan(@RequestBody ContentsVO vo){
		System.out.println(service.getListPlan(vo));
		return service.getListPlan(vo);
	}
}
