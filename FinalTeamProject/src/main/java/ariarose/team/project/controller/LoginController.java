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
	
	@RequestMapping("/userLogin")
	public ResponseEntity<UserVO> userLogin(
			@RequestBody UserVO vo, HttpServletRequest request){
		System.out.println("userLogin 들어옴 씨불");
		ResponseEntity<UserVO> entity = null;
		if(service.userLogin(vo)){
			vo = service.getUserInfo(vo);
			HttpSession session = request.getSession();
			session.setAttribute("getSessionId", vo.getUser_id());
			entity = new ResponseEntity<UserVO>(vo, HttpStatus.OK); 
		} else {
			entity = new ResponseEntity<UserVO>(vo, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
