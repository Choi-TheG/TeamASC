package com.project.asc.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.TestVO;

@Repository("testDAO")
public class TestDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public ArrayList<TestVO> selectAllTest(int projectSeq){
		ArrayList<TestVO> list = null;
		list = (ArrayList) sqlSession.selectList("mapper.test.selectAllTest", projectSeq);
		
		return list;
	}
	
	
	
}
