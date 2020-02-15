package com.camel.community.domain;

import org.apache.ibatis.type.Alias;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Alias("Standard")
public class Standard {
	
	private int page;
	private int perPageNum;
	private int code; // 게시글 카테고리 구분코드 멤버변수
	private String sort;
	
	public Standard() {
		this.page = 1 ;
		this.perPageNum = 20;
		this.sort = "reset";
		
	}
	
	public Standard(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
		
	}

	public void setPage(int page) {
		
		if( page <= 0) {
			this.page =1;
			return;
		}
		
		this.page = page;
	}
	
	public void  setPerPageNum(int perPageNum) {
		
		if( perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum =20;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		
		return (this.page -1 ) * perPageNum;   // 1 ~ 10  0,10  10~ 20 10,10 20~30 20,10  30~ 40 30,10
	}
	
	public int getPerPageNum() {
		
		return this.perPageNum;
	}
	
	
	public String brpQuery() {

		UriComponents uriComponents =
				UriComponentsBuilder.fromPath("")
				.queryParam("code", this.code)
				.queryParam("page", this.page)
				.queryParam("perPageNum", this.perPageNum)
				.build();
		
		return uriComponents.toUriString();
	}
	
	
}
