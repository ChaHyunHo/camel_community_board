package com.camel.community.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("authVO")
public class AuthVO {
	private String userId;
	private String auth;
}	
