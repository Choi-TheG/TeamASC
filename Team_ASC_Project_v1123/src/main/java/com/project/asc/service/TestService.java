package com.project.asc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.TestDAO;
import com.project.asc.vo.TestVO;

@Service("testService")
public class TestService {

	@Autowired
	private TestDAO testDAO;
	
	public ArrayList<TestVO> selectAllTest(int projectSeq){
		ArrayList<TestVO> list = null;
		list = testDAO.selectAllTest(projectSeq);
		
		return list;
	}
}
