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
	
	/*
		사용자가 회원가입시에 입력한 ID가 중복인지 아닌지를 체크하기 위한 function
	 */
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
	
	/*
		회원가입 하려는 input값을 db에 저장하기 위한 function
	 */
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
	/*
		slot을 만들기 위해 저장한 유저 정보를 가져오기 위한 function
	 */
	@RequestMapping("/getRegistUser")
	public ResponseEntity<UserVO> getRegistUser(
			@RequestBody UserVO vo){
		ResponseEntity<UserVO> entity = null;
		vo = service.getRegistUser(vo);
		System.out.println(vo);
		entity = new ResponseEntity<UserVO>(vo, HttpStatus.OK);
		return entity;
	}
	/*
		회원가입후 자기 정보를 수정하기 위한 function
	 */
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
