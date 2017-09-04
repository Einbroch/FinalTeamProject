package ariarose.team.project.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ariarose.team.project.service.SlotPlanService;
import ariarose.team.project.vo.SlotPlanVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private SlotPlanService service;
	
	@RequestMapping("/userMain")
	public void userMain(){}
	
	@RequestMapping("/getSlot")
	public @ResponseBody List<SlotPlanVO>
		getSlot(@RequestBody SlotPlanVO vo){
		System.out.println("list"+service.getSlotPlan(vo));
		return service.getSlotPlan(vo);
	}
	
	@RequestMapping("/getSlotData")
	public ResponseEntity<SlotPlanVO> getSlotData(
			@RequestBody SlotPlanVO vo){
		ResponseEntity<SlotPlanVO> entity = null;
		vo = service.getSlotData(vo);
		System.out.println("getSlotData"+vo);
		entity = new ResponseEntity<SlotPlanVO>(vo, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping("/addRegistSlot")
	public ResponseEntity<SlotPlanVO> addRegistSlot(
			@RequestBody SlotPlanVO vo){
		ResponseEntity<SlotPlanVO> entity = null;
		System.out.println(vo);
		String id = vo.getSp_id();
		vo.setSp_id(id+"_1");
		service.registSlotPlan(vo);
		vo.setSp_id(id+"_2");
		service.registSlotPlan(vo);
		vo.setSp_id(id+"_3");
		service.registSlotPlan(vo);
		entity = new ResponseEntity<SlotPlanVO>(vo, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping("/registSlot")
	public ResponseEntity<SlotPlanVO> registSlot(
			@RequestBody SlotPlanVO vo){
		ResponseEntity<SlotPlanVO> entity = null;
		if(service.updateSlotPlan(vo)){
			entity = new ResponseEntity<SlotPlanVO>(vo, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<SlotPlanVO>(vo, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/addSlot")
	public ResponseEntity<String> addSlot(
			MultipartHttpServletRequest multi,
			SlotPlanVO vo) throws Exception{
		// 저장 경로 설정
		ResponseEntity<String> entity = null;
        String root = "C:/";
        String path = root+"upload/";
         
        String newFileName = ""; // 업로드 되는 파일명
       
        File dir = new File(path);
        if(!dir.exists()){
            dir.mkdir();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        }
         
        Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();             
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
            if(MediaUtils.getMediaType(formatName)!=null){
            	mFile.transferTo(new File(path+newFileName));
            	vo.setSp_image(newFileName);
            }
            String author = multi.getParameter("author");
            author = new String(author.getBytes("8859_1"),"utf-8");
            
            String title = multi.getParameter("title");
            title = new String(title.getBytes("8859_1"),"utf-8");
            
            vo.setSp_id(multi.getParameter("slotId"));
            vo.setSp_fontColor(multi.getParameter("fontColor"));
            vo.setSp_backgroundColor(multi.getParameter("backgroundColor"));
            vo.setSp_author(author);
            vo.setSp_title(title);
            
        	System.out.println("vo보자"+vo);
        	if(service.updateSlotPlan(vo)){
        		System.out.println("업데이트 성공");
        	} else {
        		System.out.println("업데이트 실패");
        	}
        }
        return entity;
	}
	
	@RequestMapping("/updateBook")
	public ResponseEntity<SlotPlanVO> updateBook(
			@RequestBody SlotPlanVO vo){
		ResponseEntity<SlotPlanVO> entity = null;
		if(service.slotUpdateBook(vo)){
			System.out.println(vo);
			entity = new ResponseEntity<SlotPlanVO>(vo, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<SlotPlanVO>(vo, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
