package ariarose.team.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ariarose.team.project.vo.UserVO;

@Controller
@RequestMapping("/session")
public class SessionController {

	/*
		페이지에서 로그인 여부를 확인하기 위한 session function
	 */
	@RequestMapping("/getSession")
	public ResponseEntity<UserVO> getSession(
			@RequestBody UserVO vo, HttpServletRequest request){
		ResponseEntity<UserVO> entity = null;
		HttpSession session = request.getSession();
		/*vo.setUser_id(Integer.parseInt(session.getAttribute("getSessionId").toString()));*/
		System.out.println(session.getAttribute("getSession"));
		/*System.out.println("vo세션전"+vo);*/
		vo = (UserVO)session.getAttribute("getSession");
		/*System.out.println("vo세션후"+vo);*/
		if(vo.getUser_id()>0){
			entity = new ResponseEntity<UserVO>(vo, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<UserVO>(vo, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
