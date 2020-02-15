package com.camel.community.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EditorVO {
	
	private String attachPath; //이미지 저장될 경로

    private String filename; //파일이름

    private MultipartFile upload;

    private String CKEditorFuncNum;  //CKEditor가 이미지 첨부할때 보내는 데이터
	    							 //꼭 대소문자 저렇게 구분해서 줘야 modelAttribute가 인식해서 받아줌

}
