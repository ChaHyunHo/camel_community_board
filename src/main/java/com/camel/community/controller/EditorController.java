package com.camel.community.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.camel.community.domain.EditorVO;
import com.camel.community.domain.PhotoVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/")
public class EditorController {
	
	
		@GetMapping("/smart")
		public String smart() throws Exception {
			
			return "editortest";
		}
		
		@GetMapping("/uploadForm")
		public void uploadForm() {
			
			log.info("upload form");
		}
	
		@PostMapping("/uploadFromAction")
		public String uploadFormPost(EditorVO editorVO, HttpServletRequest req, Model model )throws Exception {
			
			log.info(editorVO);
			log.info(req.getParameter("CKEditorFuncNum"));
			
			HttpSession session = req.getSession();
			String rootPath = session.getServletContext().getRealPath("/"); // 웹서비스 root 경로
			String attachPath = "resources/files/attach/";
			
			MultipartFile upload = editorVO.getUpload();
			String filename = "";
			String CKEditorFuncNum = "";
			if(upload != null) {
				filename = upload.getOriginalFilename();
				editorVO.setFilename(filename);
				CKEditorFuncNum = editorVO.getCKEditorFuncNum();
				try {
					File file = new File(rootPath + attachPath + filename);
					log.info(rootPath + attachPath + filename);
					upload.transferTo(file);
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			log.info("CKEditorFuncNum:  " + CKEditorFuncNum);
			String filePath = "/" + attachPath + filename;
			model.addAttribute("filePath", filePath);
			model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
			
			return "fileuploadsuccess";
		}
	
		@GetMapping("/uploadAjax")
		public void uploadFormAjax() {
			
			log.info("upload form Ajax");
		}
		
		// 네이버 에디터 
		
		@PostMapping("/common/photoUpload")
		public String photoUpload(HttpServletRequest req, PhotoVO vo ) throws Exception {
			
			log.info("=============== 네이버 에디터");
			
			String callback = vo.getCallback();
			String callback_func = vo.getCallback_func();
			String file_result = "";
			
			try {
				
				if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && 
						!vo.getFiledata().getOriginalFilename().equals("")) {
				
					log.info(callback);
					log.info(callback_func);
					log.info(vo.getFiledata());
					log.info("=============================");
					// 확장자 포함 파일 이름 
					String original_name = vo.getFiledata().getOriginalFilename();
					
					// 확장자 
					String ext = original_name.substring(original_name.lastIndexOf(".") + 1);
					log.info("original_name : " + original_name);
					log.info("ext :  " + ext);
					
					// 파일 기본 경로
					String defaultPath = req.getSession().getServletContext().getRealPath("/");
					log.info("defaultPath :  " + defaultPath);
					// 파일 상세 경로
					String path  = defaultPath + "resources" + File.separator + "files" + File.separator + "attach" + File.separator;
					log.info("path :  " + path);
					
					File file = new File(path);
					
					if(!file.exists()) {
						file.mkdirs();
					}
					// 서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
					String realname = UUID.randomUUID().toString() + "." + ext;
					vo.getFiledata().transferTo(new File(path + realname));
					file_result += "&bNewLine=true&sFileName=" + original_name + "&sFileURL=/resources/files/attach/" + realname;
					
					log.info(file_result);
				
				} else {
					file_result += "errstr=error";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			log.info("redirect:" + callback + "?callback_func=" + callback_func + file_result);
			
			return "redirect:" + callback + "?callback_func=" + callback_func + file_result;
		}
		
		// 멀티 업로드
		@PostMapping("/common/multiplePhotoUpload")
		public void multiplePhotoUpload(HttpServletRequest req, HttpServletResponse res) {
			
			try {
				// 파일 정보
				String sFileInfo = "";
				// 파일명을 받는다 (원본)
				String filename = req.getHeader("file-name");
				
				log.info(filename);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}
