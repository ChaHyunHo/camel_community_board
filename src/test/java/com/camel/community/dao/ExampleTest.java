package com.camel.community.dao;

import org.junit.Test;

public class ExampleTest {

	@Test
	public void test() {
		System.out.println("테스트");
		System.out.println("===============구구단 외우자~============");
		for(int i =1; i <= 9; i++) {
			
			System.out.println(i + "단 입니다.");
			System.out.println("");
			for(int j = 1; j <=9; j++) {
				System.out.println( i + "X" + j + "=" + i*j );
			}
			System.out.println("-----------------------------------");
		}
	}
}
