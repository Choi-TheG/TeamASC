package com.project.asc.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.TeamMemberVO;
import com.project.asc.vo.UserVO;

@Repository("userDAO")
public class UserDAO {
	
	@Autowired
	private SqlSession sqlSession; 
	
	public ArrayList<UserVO> selectUser() {
		ArrayList<UserVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.user.selectUser");
		
		return list;
	}
	
	public boolean createUser(UserVO user) {
		boolean flag = false;
		
		int affectedCount = sqlSession.insert("mapper.user.createUser", user);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean deleteUser(int seq) {
		boolean flag = false;
		
		int affectedCount = sqlSession.delete("mapper.user.deleteUser", seq);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean checkId(String userId) {
		boolean flag = false;
		
		int affectedCount = sqlSession.selectOne("mapper.user.checkId",userId);
		
		if(affectedCount == 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean checkId(String userId,String userPwd) {
		boolean flag = false;
		UserVO vo = new UserVO();
		vo.setId(userId);
		vo.setPwd(userPwd);
		
		int affectedCount = sqlSession.selectOne("mapper.user.checkUserByIdPwd2",vo);
		
		if(affectedCount == 1) {
			flag = true;
		}
		return flag;
	}
	
	public boolean checkEmail(String userEmail) {
		boolean flag = false;
		
		int affectedCount = sqlSession.selectOne("mapper.user.checkEmail",userEmail);
		
		if(affectedCount == 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean checkPhoneNum(String userPhoneNum) {
		boolean flag = false;
		
		int affectedCount = sqlSession.selectOne("mapper.user.checkPhoneNum",userPhoneNum);

		if(affectedCount == 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean checkNameEmail(String userName,String userEmail) {
		boolean flag = false;
		UserVO vo = new UserVO();
		vo.setName(userName);
		vo.setEmail(userEmail);
		int affectedCount = sqlSession.selectOne("mapper.user.checkNameEmail",vo);

		if(affectedCount == 1) {
			flag = true;
		}
		
		return flag;
	}
	
	public UserVO selectUser(UserVO user) {
		// TODO Auto-generated method stub
		UserVO vo = new UserVO();
		vo = sqlSession.selectOne("mapper.user.checkUserByIdPwd",user);
		return vo;
	}
	
	public String findId(UserVO user) {
		// TODO Auto-generated method stub
		String id = sqlSession.selectOne("mapper.user.findId", user);
		//System.out.println(id);
		return id;
	}

	public String findPwd(UserVO user) {
		// TODO Auto-generated method stub
		String pwd = sqlSession.selectOne("mapper.user.findPwd", user);
		return pwd;
	}

	public String selectUserId(String userSeq) {
		// TODO Auto-generated method stub
		String userId = sqlSession.selectOne("mapper.user.selectUserIdBySeq", userSeq);
		return userId;
	}
	
	public boolean updatePwd(UserVO user) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int affectedCount = sqlSession.update("mapper.user.updatePwd", user);
		if(affectedCount > 0) {
			flag = true;
		}
		return flag;
	}
	
	/* ???????????? ?????? */
	public boolean updateMyInfo(UserVO user) {
		boolean flag = false;
		
		int affectedCount = sqlSession.update("mapper.user.updateMyInfo", user);
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	/* ???????????? ?????? */
	public UserVO selectUserPwd(String id,String pwd) {
		UserVO user = null;
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPwd(pwd);
		user = sqlSession.selectOne("mapper.user.pwdCheck", vo);
		
		return user;
	}

	/* ??????????????? ?????? */
	public UserVO selectMyInfo(String id) {
		UserVO user = null;
		user = sqlSession.selectOne("mapper.user.viewMyPage", id);
		
		System.out.println("dao");
		return user;
	}
	
	/* ??????(status) 'N'?????? ????????? -> ?????? ?????? */
	public boolean removeUser(int userSeq) {
		boolean flag = false;
		System.out.println("???????????? : " + userSeq);
		int updateAffectedCount = sqlSession.update("mapper.user.updateUserStatus", userSeq);
		
		int deleteAffectedCount = sqlSession.delete("mapper.teamMember.deleteTeamMemberSelf",userSeq);
		
		sqlSession.update("mapper.project.updateProjectNoTeamMember");
		
		ArrayList<TeamMemberVO> teamNoLeader = (ArrayList)sqlSession.selectList("mapper.teamMember.selectTeamMemberNoLeader");

		//??? ?????? ?????? ??? ?????? ?????? seq ?????? ?????????
		for(TeamMemberVO teamMember : teamNoLeader) {
			
			sqlSession.update("mapper.teamMember.updateTeamMemberLeader",teamMember);
			
			String teamId = teamMember.getTeamId();
			
			int teamMemberCount = sqlSession.selectOne("mapper.teamMember.countTeamMember",teamId);
			
			if(teamMemberCount > 1) {
				sqlSession.update("mapper.teamMember.updateaTeamCategoryTeam",teamId);
			} else {
				sqlSession.update("mapper.teamMember.updateaTeamCategorySole",teamId);
			}
		}
		
		if (updateAffectedCount > 0 && deleteAffectedCount > 0) {
			flag = true;
		}

		return flag;
	}
	
	/* ????????? ?????? ?????????  */
	public ArrayList<UserVO> selectPositionGroup() {
		
		ArrayList<UserVO> positionGroup = (ArrayList)sqlSession.selectList("mapper.user.selectPositionGroup");
		
		return positionGroup;
	}
}
