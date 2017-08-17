package ariarose.team.project.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ariarose.team.project.service.RegistService;
import ariarose.team.project.service.SlotPlanService;
import ariarose.team.project.vo.SlotPlanVO;
import ariarose.team.project.vo.UserVO;

@Controller
@RequestMapping("/regist")
public class RegistController {
	
	@Inject
	private RegistService service;
	
	@RequestMapping("/checkUserId")
	public ResponseEntity<UserVO> checkUserId(
			@RequestBody UserVO vo){
		ResponseEntity<UserVO> entity = null;
		
		if(service.checkUserId(vo) && !vo.getUser_userId().equals("")){
			entity = new ResponseEntity<UserVO>(vo, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<UserVO>(vo, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/registUser")
	public ResponseEntity<UserVO> registUser(
			@RequestBody UserVO vo){
		ResponseEntity<UserVO> entity = null;
		System.out.println(vo);
		if(service.registUser(vo)){
			entity = new ResponseEntity<UserVO>(vo, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<UserVO>(vo, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/getRegistUser")
	public ResponseEntity<UserVO> getRegistUser(
			@RequestBody UserVO vo){
		ResponseEntity<UserVO> entity = null;
		vo = service.getRegistUser(vo);
		System.out.println(vo);
		entity = new ResponseEntity<UserVO>(vo, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping("/modifyUser")
	public ResponseEntity<UserVO> modifyUser(
			@RequestBody UserVO vo){
		ResponseEntity<UserVO> entity = null;
		System.out.println("정보수정 vo "+vo);
		if(service.modifyUser(vo)){
			entity = new ResponseEntity<UserVO>(vo, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<UserVO>(vo, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
