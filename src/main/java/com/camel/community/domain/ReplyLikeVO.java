package com.camel.community.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("replyLikeVO")
public class ReplyLikeVO {
	
	private Integer replyLikeNumber;
	private Integer replyNumber;
	private String  userId;
}
