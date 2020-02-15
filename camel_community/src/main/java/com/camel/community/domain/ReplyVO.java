package com.camel.community.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("replyVO") // resultType Alias
public class ReplyVO {
	
	private Integer replyNumber;
	private Integer boardNumber;
	private String replyWriter;
	private String userNickname;
	private String replyContent;
	private Integer groupNumber;
	private Integer parentReplyNumber;
	private Integer depth;
	private Integer orderNumber;
	private int orderCount;
	private Date replyRegisterDate;
	private Integer replyGoodCount;
	private String useYn;

}
