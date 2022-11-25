package com.project.asc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.ProjectService;
import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.ScheduleVO;
import com.project.asc.vo.TeamMemberVO;
import com.project.asc.vo.UserVO;
@ResponseBody
@RequestMapping("/project")
@Controller("projectController")
public class ProjectController {

	@Autowired
	private ProjectService projectService;

	/* 프로젝트 선택 */
	@RequestMapping(value="/readProject",method=RequestMethod.GET)
	public ModelAndView readProject(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String projectSeq = request.getParameter("seq");
		
		ProjectVO project = projectService.setProject(projectSeq);
		
		request.getSession().setAttribute("project", project);
		
		//시작일자 YYYY-mm-DD로 형식 변경
		String creatDate = project.getCreateDate();
		project.setCreateDate(creatDate.substring(0,4) + "-" + creatDate.substring(4,6) + "-" + creatDate.substring(6,8));
		
		//완료여부 문구 변경
		String finishYn = project.getFinishYn();
		if(finishYn=="Y") {
			project.setFinishYn("완료");
		} else if(finishYn=="N"){
			project.setFinishYn("진행중");
		} else if(finishYn=="S") {
			project.setFinishYn("중단");
		}
		String viewName = "redirect:/dashboard/viewDashboard?projectSeq="+projectSeq;
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 프로젝트 변경 */
	@RequestMapping(value="/changeProject",method=RequestMethod.GET)
	public ModelAndView changeProject(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		request.getSession().setAttribute("project", null);
		
		String viewName = "redirect:/main";
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 프로젝트 생성 페이지 */
	@RequestMapping(value="/viewCreateProject",method=RequestMethod.GET)
	public ModelAndView viewCreateProject(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName ="/project/viewCreateProject";
		
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 프로젝트 생성 */
	@RequestMapping(value="/createProject",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView createProject(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		boolean flag = false;
		String projectName = request.getParameter("projectName");
		UserVO userVo = (UserVO) request.getSession().getAttribute("member"); 
		flag = projectService.createProject(projectName,userVo);
		String viewName = "error";
		if(flag) {
			viewName = "redirect:/main";
			if(request.getSession().getAttribute("project") != null) {
				viewName = "/project/manageProject";
			}
			int userSeq = userVo.getUserSeq();
			projectService.createDocuments(userSeq);
		} 
		
		mav.setViewName(viewName);
		return mav;
	}
	
	/* rest 팀명 중복 체크 */
	@RequestMapping(value="/checkProjectName",method=RequestMethod.GET)
	public boolean checkProjectName(@RequestParam("projectName") String projectName, HttpServletRequest request,HttpServletResponse response) throws Exception {
		boolean flag = false;
		flag = projectService.checkProjectName(projectName);
		return flag;
	}
	
	/* 프로젝트 관리 */
	@RequestMapping(value="/manageProject",method=RequestMethod.GET)
	public ModelAndView manageProject(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		ProjectVO vo = (ProjectVO) request.getSession().getAttribute("project");

		String teamId = vo.getTeamId();
		
		ArrayList<TeamMemberVO> list = projectService.selectTeamMemberList(teamId);
		
		String viewName = "/project/manageProject";
		
		mav.addObject("list",list);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 프로젝트명 변경 */
	@RequestMapping(value="/modifyProjectName",method=RequestMethod.GET)
	public boolean modifyProjectName(@RequestParam("projectName") String projectName,@RequestParam("projectSeq") String projectSeq, HttpServletRequest request,HttpServletResponse response) throws Exception {
		boolean flag = false;
		flag = projectService.modifyProjectName(projectName,projectSeq);
		return flag;
	}
	
	/* 팀원 제외 */
	@RequestMapping(value="/deleteTeamMember",method=RequestMethod.GET)
	public ModelAndView deleteTeamMember(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String viewName = "redirect:/main";
		
		String userSeq = request.getParameter("userSeq");
		String teamId = request.getParameter("teamId");
		
		boolean flag = projectService.deleteTeamMember(userSeq,teamId);
		
		if(flag) {
			viewName = "redirect:/project/manageProject";
		}
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 프로젝트 삭제 */
	@RequestMapping(value="/deleteProject",method=RequestMethod.GET)
	public ModelAndView deleteProject(@ModelAttribute("info") ProjectVO project,HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String viewName = "redirect:/project/manageProject";
		
		boolean flag = projectService.deleteProject(project);
		
		request.getSession().setAttribute("project", null);
		
		if(flag) {
			viewName = "redirect:/main";
		}
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 프로젝트 스케줄 페이지로 이동 */
	@RequestMapping(value="/viewScheduleProject",method=RequestMethod.GET)
	public ModelAndView scheduleProjectPage(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String viewName ="/project/viewScheduleProject";
		
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");

		int projectSeq = project.getProjectSeq();
		
		ArrayList<ScheduleVO> list = projectService.selectScheduleList(projectSeq);
		
		mav.addObject("list",list);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 프로젝트 스케줄 생성 */
	@RequestMapping(value="/scheduleProject",method=RequestMethod.GET)
	public ModelAndView scheduleProject(@ModelAttribute("info") ScheduleVO schedule,HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(schedule);
		
		String viewName ="redirect:/project/viewScheduleProject";
		
		boolean flag = projectService.scheduleProject(schedule);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 팀원 초대 페이지 */
	@RequestMapping(value="/viewInviteProject",method=RequestMethod.GET)
	public ModelAndView viewInviteProject(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		UserVO user = (UserVO) request.getSession().getAttribute("member");
		int userSeq = user.getUserSeq();
		
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		int projectSeq = project.getProjectSeq();
		
		ArrayList<UserVO> list = projectService.selectInviteUserList(userSeq,projectSeq);
		
		String viewName ="/project/viewInviteProject";
		
		mav.addObject("userList", list);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 팀원 초대 */
	@RequestMapping(value="/inviteProject",method=RequestMethod.GET)
	public ModelAndView inviteProject(@RequestParam("userSeq") String user_Seq,HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		
		int userSeq = Integer.parseInt(user_Seq);
		String teamId = project.getTeamId();
		
		boolean flag = projectService.inviteUser(userSeq,teamId);
		
		String viewName = "redirect:/project/manageProject";
		
		mav.setViewName(viewName);
		
		return mav;
	}
}
