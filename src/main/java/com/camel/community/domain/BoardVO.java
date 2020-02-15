package com.camel.community.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("boardVO") // resultType Alias
public class BoardVO {

	private Integer boardNumber;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private String userNickname;
	private Integer boardCode;
	private String boardTypeName;
	private int boardGoodCount;
	private int boardBadCount;
	private Date boardRegisterDate;
	private Date boardUpdateDate;
	private int boardReplyCount;
	private int boardViewCount;
	private Integer newCount;
	private String useYn;
}
