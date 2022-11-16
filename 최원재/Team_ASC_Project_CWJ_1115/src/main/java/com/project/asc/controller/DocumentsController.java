package com.project.asc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.DocumentsService;
import com.project.asc.vo.DocumentsVO;
import com.project.asc.vo.ProjectVO;


@Controller("documentsController")
@RequestMapping("/documents")
public class DocumentsController {
	@Autowired
	private DocumentsService documentsService;
	
	/* 행 삽입 */
	@RequestMapping(value="/createDocuments",method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView createDocuments(@ModelAttribute("documents") DocumentsVO documents, 
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView();
		// session에서 project정보 받아오기
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		int projectSeq = project.getProjectSeq();
		documents.setProjectSeq(projectSeq);
		
		boolean flag = false;
		flag = documentsService.createDocuments(projectSeq);
		if(flag) {
			mav.setViewName("redirect:/documents/readDocuments");
		}
		
		return mav;
	}
	
	/* 문서 관리 페이지 */
	@RequestMapping(value="/readDocuments", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView readDocuments(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView();
		// session에서 project정보 받아오기
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		String projectSeq = String.valueOf(project.getProjectSeq());
		ArrayList<DocumentsVO> list = documentsService.readDocuments(projectSeq);
		
		mav.addObject("list",list);

		mav.setViewName("/documents/readDocuments");
		
		return mav;
	}
	
	/* 문서 업로드 */
	@RequestMapping(value="/updateDocuments",method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView updateDocuments(@ModelAttribute("documents") DocumentsVO documents, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		// session에서 project정보 받아오기
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
//		DocumentsVO documents = (DocumentsVO) request.getSession().getAttribute("documents");
		int projectSeq = project.getProjectSeq();
		documents.setProjectSeq(projectSeq);
		System.out.println(documents);
		
		//파일 업로드 처리
		String fileName = null;
		MultipartFile uploadFile = documents.getUploadFile();
		String originalFileName = "";
		if(!uploadFile.isEmpty()) {
			originalFileName = uploadFile.getOriginalFilename();
			//확장자 구하기
			String ext = FilenameUtils.getExtension(originalFileName);
			//UUID 구하기
			UUID uuid = UUID.randomUUID();
			
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("C:\\dev\\file\\" + fileName));
		}
		documents.setFileName(fileName != null ? fileName : "");
		documents.setRealFileName(fileName != null ? originalFileName : "");
		
		// 작성일자 및 작성자 업데이트
		boolean flag = documentsService.updateDocuments(documents);
		if(flag) {
			System.out.println("update done.");
		}
//		documents.setFileName(fileName);
		
		mav.setViewName("redirect:/documents/readDocuments");
		return mav;
	}
	
	
	/* 기획안 조회 */ 
	/*	@RequestMapping(value="/readPlan",method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView readPlan(@RequestParam("projectSeq") String projectSeq, HttpServletRequest request, HttpServletResponse response) throws Exception  {
		ModelAndView mav = new ModelAndView();
		DocumentsVO documents = documentsService.readPlan(projectSeq);
	
		mav.addObject("documents",documents);

		mav.setViewName("/documents/readPlan");
		return mav;
	}	
	
	/* 기획안 수정 페이지 */ 
	/*	@RequestMapping(value="/viewUpdatePlan",method=RequestMethod.POST)
	public ModelAndView viewUpdatePlan(@RequestParam("documentsSeq") String documentsSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		DocumentsVO documents = documentsService.viewUpdatePlan(documentsSeq);
		
		mav.addObject("documents",documents);
		mav.setViewName("/documents/viewUpdatePlan");
		return mav;
	}	
	
	/* 기획안 수정 */ 
	/*	@RequestMapping(value="/updatePlan",method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView updatePlan(@ModelAttribute("documents") DocumentsVO documents, @RequestParam("projectSeq") String projectSeq, 
			@RequestParam("pageNum") String pageNum, HttpServletRequest request, HttpServletResponse response) throws Exception  {
		ModelAndView mav = new ModelAndView();
		boolean flag = documentsService.updatePlan(documents);
		if(flag) {
			System.out.println("update done.");
		}
		
		mav.setViewName("redirect:/documents/readPlan?projectSeq="+projectSeq+"&pageNum="+pageNum);
		return mav;
	}
	
	/* 기획안 삭제 */ 
	/*	@RequestMapping(value="/deletePlan",method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView deletePlan(@ModelAttribute("documents") DocumentsVO documents,@RequestParam("projectSeq") String projectSeq,  
			@RequestParam("pageNum") String pageNum, HttpServletRequest request, HttpServletResponse response) throws Exception  {
		ModelAndView mav = new ModelAndView();
		boolean flag = documentsService.deletePlan(documents);
		if(flag) {
			System.out.println("delete done.");
		}

		mav.setViewName("redirect:/documents/readPlan?projectSeq="+projectSeq+"&pageNum="+pageNum);
		return mav;
	}	
	
	/* 기획안 예문 조회 */ 
	/*	@RequestMapping(value="examplePlan",method=RequestMethod.GET)
	public ModelAndView examPlan(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/documents/examplePlan");
		return mav;
	}
*/
}
