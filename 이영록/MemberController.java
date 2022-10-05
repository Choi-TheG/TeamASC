package gntp.asc.factory.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gntp.asc.factory.service.MemberService;
import gntp.asc.factory.vo.MemberVO;


@Controller("memberController")
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String viewName = "list";
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		list = memberService.allMember();
		mav.addObject("list", list);
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/updateMember.do", method= RequestMethod.GET)
	public ModelAndView viewUpdateMember(@RequestParam("memberNo") String memberNo, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		MemberVO member = new MemberVO();
		member = memberService.oneMember(memberNo);
		mav.addObject("member", member);
		mav.setViewName("viewUpdatePage");
		return mav;
	}
	
	@RequestMapping(value="/update.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateMember(@ModelAttribute("info") MemberVO member, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		boolean flag = false;
		flag = memberService.updateMember(member);
		if(flag) {
			System.out.println("update완료");
		}
		mav.setViewName("redirect:./list.do");
		return mav;
	}

}
