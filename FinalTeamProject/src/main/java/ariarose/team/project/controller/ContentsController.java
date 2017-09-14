package ariarose.team.project.controller;

import java.io.File;
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

import ariarose.team.project.service.ContentsService;
import ariarose.team.project.vo.ContentsVO;

@Controller
@RequestMapping("/contents")
public class ContentsController {
	
	@Inject
	private ContentsService service;
	/*
		사용자가 만든 계획을 재갱신하기 위해 slot-id값을 모두 지우는 function
	 */
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
	/*
		사용자가 만든 계획을 재갱신하기위해 모든 값을 지우고 새로 insert하는 function
	 */
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
	/*
		후기 페이지에서 사용자가 입력한 값에서 사진을 넣을 경우 update함
	 */
	@RequestMapping("/updateBook")
	public ResponseEntity<ContentsVO> updateBook(
			@RequestBody ContentsVO vo){
		ResponseEntity<ContentsVO> entity = null;
		if(service.updateBook(vo)){
			entity = new ResponseEntity<ContentsVO>(vo, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<ContentsVO>(vo, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	/*
		내가 저장한 계획의 list를 가져오기 위한 function
	 */
	@RequestMapping("/getListPlan")
	public @ResponseBody List<ContentsVO> 
		getListPlan(@RequestBody ContentsVO vo){
		System.out.println(service.getListPlan(vo));
		return service.getListPlan(vo);
	}
	/*
		후기에서 사진을 넣는 function 사진을 넣으면 자동적으로 모든 데이터를 업데이트함
	 */
	@RequestMapping("/addReviewImage")
	public ResponseEntity<String> addReviewImage(
			MultipartHttpServletRequest multi,
			ContentsVO vo) throws Exception{
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
            	vo.setContents_picture(newFileName);
            }
            String plan = multi.getParameter("reviewplan");
            plan = new String(plan.getBytes("8859_1"),"utf-8");
            String name = multi.getParameter("reviewname");
            name = new String(name.getBytes("8859_1"),"utf-8");
            String desc = multi.getParameter("reviewdesc");
            desc = new String(desc.getBytes("8859_1"),"utf-8");
            String addr = multi.getParameter("reviewaddr");
            addr = new String(addr.getBytes("8859_1"),"utf-8");
            String review = multi.getParameter("reviewreview");
            review = new String(review.getBytes("8859_1"),"utf-8");
            review = review.replace("\r\n", "<br>");
            vo.setContents_id(multi.getParameter("reviewid"));
            vo.setSlot_id(multi.getParameter("reviewslotid"));
            vo.setContents_date(multi.getParameter("reviewdate"));
            vo.setContents_time(multi.getParameter("reviewtime"));
            vo.setContents_plan(plan);
            vo.setContents_name(name);
            vo.setContents_desc(desc);
            vo.setContents_number(multi.getParameter("reviewnumber"));
            vo.setContents_addr(addr);
            vo.setContents_lat(multi.getParameter("reviewlat"));
            vo.setContents_lng(multi.getParameter("reviewlng"));
            vo.setContents_image(multi.getParameter("reviewimage"));
            vo.setContents_icon(multi.getParameter("reviewicon"));
            vo.setContents_review(review);
            
            System.out.println(vo);
            if(service.updateContents(vo)){
            	System.out.println("업데이트 성공");
            } else {
            	System.out.println("업데이트 실패");
            }
        }
		return entity;
	}
}
