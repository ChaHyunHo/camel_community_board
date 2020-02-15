package com.camel.community.domain;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("userVO")
public class UserVO {
	private Integer userNumber;
	private String userId;
	private String userPw;
	private String userName;
	private String userNickname;
	private String email;
	private String emailKey;
	private String userAbout;
	private Date userRegisterDate;
	private Date userUpdateDate;
	private Integer enabled;
	private Integer userPoint;
	private List<AuthVO> authList;
	
}
