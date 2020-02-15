package com.camel.community.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int realEnd;
	
	private int total;
	private Standard std;
	
	public PageDTO(Standard std, int total) {
		
		this.std = std;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(std.getPage() / 10.0)) * 10;
		
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / std.getPerPageNum()));
		
		this.realEnd = realEnd;
						
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	public String listQuery(int page) {

		UriComponents uriComponents =
				UriComponentsBuilder.fromPath("")
				.queryParam("code", std.getCode())
				.queryParam("page", page)
				.queryParam("perPageNum", std.getPerPageNum())
				.queryParam("searchOption", ((SearchBoard)std).getSearchOption())
				.queryParam("searchOrAnd", ((SearchBoard)std).getSearchOrAnd())
				.queryParam("searchContent", encoding(((SearchBoard)std).getSearchContent()))
				.build();
		
		return uriComponents.toUriString();
	}
	
	private String encoding(String searchContent) {
		if (searchContent == null || searchContent.trim().length() == 0) {
			return "";
		}
		
		try {
			return URLEncoder.encode(searchContent, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
	
}
