package com.project.asc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.UserDAO;
import com.project.asc.vo.UserVO;

@Service("userService")
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	public ArrayList<UserVO> selectUser() {
		ArrayList<UserVO> list = null;
		
		list = userDAO.selectUser();
		
		return list;
	}
	
	public boolean createUser(UserVO user) {
		boolean flag = false;
		
		flag = userDAO.createUser(user);
		
		return flag;
	}
	
	public boolean deleteUser(int seq) {
		boolean flag = false;
		
		flag = userDAO.deleteUser(seq);
		
		return flag;
	}
	
	public boolean checkId(String userId) {
		boolean flag = false;
		flag = userDAO.checkId(userId);
		return flag;
	}
	
	public boolean checkId(String userId,String userPwd) {
		boolean flag = false;
		flag = userDAO.checkId(userId,userPwd);
		return flag;
	}
	
	public boolean checkEmail(String userEmail) {
		boolean flag = false;
		flag = userDAO.checkEmail(userEmail);
		return flag;
	}
	
	public boolean checkPhoneNum(String userPhoneNum) {
		boolean flag = false;
		flag = userDAO.checkPhoneNum(userPhoneNum);
		return flag;
	}
	
	public boolean checkNameEmail(String userName,String userEmail) {
		boolean flag = false;
		
		flag = userDAO.checkNameEmail(userName,userEmail);
		
		return flag;
	}
	
	public UserVO selectUser(String id, String pwd) {
		UserVO user = new UserVO();
		user.setId(id);
		user.setPwd(pwd);
		UserVO vo = null;
		vo = userDAO.selectUser(user);
		return vo;
	}
	
	public String findId(UserVO user) {
		// TODO Auto-generated method stub
		String id = userDAO.findId(user);
		
		return id;
	}

	public String findPwd(UserVO user) {
		// TODO Auto-generated method stub
		String pwd = userDAO.findPwd(user);
		return pwd;
	}

	public String selectUserId(String userSeq) {
		// TODO Auto-generated method stub
		String userId = userDAO.selectUserId(userSeq);
		return userId;
	}

	public boolean updatePwd(UserVO user) {
		// TODO Auto-generated method stub
		boolean flag = userDAO.updatePwd(user);
		return flag;
	}
	
	/* ???????????? ?????? */
	public boolean updateMyInfo(UserVO user) {
		boolean flag = false;
		
		flag = userDAO.updateMyInfo(user);
		
		return flag;
	}
	
	/* ???????????? ?????? */
	public UserVO selectUserPwd(String id,String pwd) {
		UserVO user = null;
		user = userDAO.selectUserPwd(id,pwd);
		
		return user;
	}
	
	/* ??????????????? ?????? */
	public UserVO selectMyInfo(String id) {
	
		UserVO user = null;
		user = userDAO.selectMyInfo(id);
		
		return user;
		
	}
	
	/* ??????(status) 'N'?????? ????????? -> ?????? ?????? */
	public boolean removeUser(int userSeq) {
		boolean flag = false;

		flag = userDAO.removeUser(userSeq);

		return flag;
	}
	
	/* ????????? ?????? ?????????  */
	public ArrayList<UserVO> selectPositionGroup() {
		
		ArrayList<UserVO> positionGroup = userDAO.selectPositionGroup();
		
		return positionGroup;
	}
}
