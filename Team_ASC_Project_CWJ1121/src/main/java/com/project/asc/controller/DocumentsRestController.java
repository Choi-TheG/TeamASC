package com.project.asc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.asc.service.DocumentsService;

@RestController
@RequestMapping("/document")
public class DocumentsRestController {
	@Autowired
	private DocumentsService documentsService;
	
	
}
