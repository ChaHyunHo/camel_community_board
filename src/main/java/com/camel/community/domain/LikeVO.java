package com.camel.community.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("likeVO")
public class LikeVO {

	private Integer likeNumber;
	private Integer boardNumber;
	private String userId;
	private String status;

}
