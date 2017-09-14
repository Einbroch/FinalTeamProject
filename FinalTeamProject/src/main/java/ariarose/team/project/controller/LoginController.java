package ariarose.team.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ariarose.team.project.service.LoginService;
import ariarose.team.project.vo.UserVO;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Inject
	private LoginService service;
	/*
		로그인을 하기 위한 function
	 */
	@RequestMapping("/userLogin")
	public ResponseEntity<UserVO> userLogin(
			@RequestBody UserVO vo, HttpServletRequest request){
		ResponseEntity<UserVO> entity = null;
		if(service.userLogin(vo)){
			vo = service.getUserInfo(vo);
			HttpSession session = request.getSession();
			session.setAttribute("getSession", vo);
			entity = new ResponseEntity<UserVO>(vo, HttpStatus.OK); 
		} else {
			entity = new ResponseEntity<UserVO>(vo, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	/*
		로그아웃을 하기 위한 function
	 */
	@RequestMapping("/userLogout")
	public ResponseEntity<UserVO> userLogout(
			@RequestBody UserVO vo, HttpServletRequest request){
		ResponseEntity<UserVO> entity = null;
		entity = new ResponseEntity<UserVO>(vo, HttpStatus.OK);
		HttpSession session = request.getSession();
		session.invalidate();
		return entity;
	}
}
