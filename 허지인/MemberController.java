package gntp.asc.factory.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import gntp.asc.factory.service.MemberService;
import gntp.asc.factory.vo.MemberVO;

@Controller("memberController")
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value="viewJoin.do", method=RequestMethod.GET)
	public ModelAndView viewJoin(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/member/join");
		return mav;
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public ModelAndView join(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String depart = request.getParameter("depart");
		String position = request.getParameter("position");
		String birthDate = request.getParameter("birthDate");
		String phoneNum	= request.getParameter("phoneNum");
		String joinDate = request.getParameter("joinDate");
		String email = request.getParameter("email");
		
		MemberVO member = new MemberVO(0, name, pwd, depart, position, birthDate, phoneNum, joinDate, email);
		boolean flag = memberService.joinMember(member);
		
		mav.setViewName("redirect:./list.do");
		return mav;
	}
	
	@RequestMapping(value="read.do", method=RequestMethod.GET)
	public ModelAndView read(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = this.getViewName(request);
		String memberNo = request.getParameter("memberNo");
		MemberVO member = null;
		member = memberService.readMember(memberNo);
		
		mav.addObject("member", member);
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}


		int begin = 0; 
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length(); 
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";"); 
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?"); 
		} else {
			end = uri.length();
		}

		String fileName = uri.substring(begin, end);
		if (fileName.indexOf(".") != -1) {
			fileName = fileName.substring(0, fileName.lastIndexOf(".")); 
		}
		if (fileName.lastIndexOf("/") != -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/"), fileName.length()); 
		}
		return fileName;
	}

}
