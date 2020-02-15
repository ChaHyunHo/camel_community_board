package com.camel.community.domain;

import java.util.List;

import lombok.Data;

@Data
public class SearchBoard extends Standard {
	
	private String searchOption;
	private String searchContent;
	private String searchOrAnd;
	private List<String> contentSplit; // or 조건에서 검색시 띄어쓴 모든 단어를 검색하기 위해 사용 
	
	public SearchBoard () {
		
		this.searchOption = "";
		this.searchContent = "";
		this.searchOrAnd = "";
		
	}
	
}
