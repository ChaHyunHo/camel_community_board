package com.camel.community.boardType;

import lombok.AllArgsConstructor;
import lombok.Getter;

/* 테스트용 게시판 타입은 열거형으로 정의. */

@Getter
@AllArgsConstructor
public enum BoardType {
	
	 BEST(1,"B"), 
	 HUMOR(2,"H"), 
	 MYSTERY(3,"M"), 
	 ANONYMOUS(4,"A"),
	 CELEBRITY(5,"A"),
	 CUSTOMER(6,"A");
	
	private int value;
	private String type;

}
