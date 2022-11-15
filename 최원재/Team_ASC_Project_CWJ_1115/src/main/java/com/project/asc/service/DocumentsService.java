package com.project.asc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.DocumentsDAO;
import com.project.asc.vo.DocumentsVO;

@Service("documentsService")
public class DocumentsService {
	@Autowired
	private DocumentsDAO documentsDAO;
	
	public ArrayList<DocumentsVO> readDocuments(String projectSeq) {
		ArrayList<DocumentsVO> list = null;
		list = documentsDAO.selectAllDocuments(projectSeq);
		
		return list;
	}
	
	public boolean updateDocuments(DocumentsVO documents) {
		boolean flag = false;
		documentsDAO.updateDocuments(documents);
		if(documentsDAO.updateDocuments(documents)) {
			flag = true;
		}
		
		return flag;
	}
	
	/*
	public DocumentsVO readPlan(String projectSeq) {
		DocumentsVO doc = null;
		doc = documentsDAO.selectDocuments(projectSeq);
		
		return doc;
	}
	
	public DocumentsVO viewUpdatePlan(String documentsSeq) {
		DocumentsVO documents = null;
		documents = documentsDAO.viewUpdateDocuments(documentsSeq);
		
		return documents;
	}
	
	public boolean updatePlan(DocumentsVO documents) {
		boolean flag = false;
		documentsDAO.updateDocuments(documents);
		if(documentsDAO.updateDocuments(documents)) {
			flag = true;
		}
		return flag;
	}
	
	public boolean deletePlan(DocumentsVO documents) {
		boolean flag = false;
		documentsDAO.deleteDocuments(documents);
		if(documentsDAO.deleteDocuments(documents)) {
			flag = true;
		}
		
		return flag;
	}
	*/
}
