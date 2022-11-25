package com.project.asc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.TestService;
import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.TestVO;

@RequestMapping("/test")
@Controller("testController")
public class TestController {
	
	@Autowired
	private TestService testService;

	/* test main */
	@RequestMapping(value = "/manageTest", method = RequestMethod.GET)
	public ModelAndView manageTest(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		// get projectSeq to session
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		int projectSeq = project.getProjectSeq();
		
		//list
		ArrayList<TestVO> list = new ArrayList<TestVO>();
		list = testService.selectAllTest(projectSeq);
		
		mav.addObject("list", list);
		mav.setViewName("/test/manageTest");
		return mav;
	}
	
	/* Unit Test add */
	
}
