package com.camel.community.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PhotoVO {
	
	// photo_uploader.html 페이지의 form 태그 내에 존재하는 file 태그의 name명과 일치시켜줌
	private MultipartFile Filedata;
	//callback URL
	private String callback;
	// callback Fn
	private String callback_func;

}
