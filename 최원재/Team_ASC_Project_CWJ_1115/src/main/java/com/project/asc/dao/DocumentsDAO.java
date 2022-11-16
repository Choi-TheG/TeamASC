package com.project.asc.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.DocumentsVO;

@Repository("documentsDAO")
public class DocumentsDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<DocumentsVO> selectAllDocuments(String projectSeq) {
		ArrayList<DocumentsVO> list = null;
		System.out.println(projectSeq);
		list = (ArrayList) sqlSession.selectList("mapper.documents.selectAllDocumentsByProjectSeq", Integer.parseInt(projectSeq));
		System.out.println("doc + :" + list);
		return list;
	}
	
	public DocumentsVO viewUpdateDocuments(String documentsSeq) {
		DocumentsVO documents = null;
		documents = sqlSession.selectOne("mapper.documents.selectDocumentsByDocumentsSeq", Integer.parseInt(documentsSeq));
		
		return documents;
	}
	
	public boolean updateDocuments(DocumentsVO documents) {
		boolean flag = false;
		int affectedCount = sqlSession.update("mapper.documents.updateDocuments", documents);
		if(affectedCount > 0) {
			flag = true;
		}
		return flag;
	}
	
	public boolean deleteDocuments(DocumentsVO documents) {
		boolean flag = false;
		int affectedCount = sqlSession.update("mapper.documents.deleteDocuments", documents);
		if(affectedCount > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean createDocuments(int projectSeq) {
		boolean flag = false;
		int affectedCount = sqlSession.insert("mapper.documents.createDocuments", projectSeq);
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
}
