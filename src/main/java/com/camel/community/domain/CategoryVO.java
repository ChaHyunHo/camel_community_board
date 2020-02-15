package com.camel.community.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("categoryVO") // resultType Alias
public class CategoryVO {
	
	private Integer boardCode;
	private String boardTypeName;
	private String typeSimple;
	private String useYn;

}
