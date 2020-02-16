# camel_community_board portfolio

#### [사이트 방문](http://chamym.cafe24.com/)

## Web Stacks

* CLIENT
  * bootstrap
  * jquery
  * js

* SERVER
  * Java
  * mybatis
  * mysql

## 프로젝트
커뮤니티를 주제로한 웹사이트 입니다.
 
 * 주요 기능
   
   * 로그인 기능
     * 스프링 시큐리티를 이용한 로그인기능
   
   
   * 회원 가입 기능
     * Ajax를 이용한 실시간 중복검사 및 이메일 인증
   
   
   * 게시판 기능
     * 네이버 스마트 에디터 API를 이용한 이미지 업로드
     * 추천과 비추천 기능
   
   * 계층형 댓글
     * 그룹별 order Number & depth를 이용한 알고리즘
   
   * 게시글 전체 검색 및 게시판 별 검색 기능
   
   * 게시판 리스트 정렬(ex. 댓글순, 추천순, 비추천순 ..)
   
   * 쿠기를 이용한 조회수 중복 방지
    
  
## Web page & mobile preview
<img src="https://user-images.githubusercontent.com/38008152/74584891-6dd0e580-501a-11ea-9c0b-a845a46a9f59.PNG" height="100%" width="100%">

* 부트스트랩을 이용한 반응형 웹 디자인
  * 사용자의 편의를 위해 모바일 화면을 지원하였습니다. 전반적으로 부트스트랩을 이용하여 화면의 레이아웃을 잡았고 화면에 따라 보여지는 유저인터페이스 조정은 미디어 쿼리를 이용하여 수정하였습니다. 특히 모바일 환경에서 보여주어야 할 부분을 적정 선에서 보여주는것 예를들어 pc환경에서는 제목, 이름, 게시글 번호, 조회수 등 모든 정보를 속성으로 분류하여 보여주었다면 모바일 환경에서는 제목안에 여러 폰트를 이용하여 표현하는 등의 신경써야할 부분이 있었습니다.

## Preview another page
<img src="https://user-images.githubusercontent.com/38008152/74586482-1424e700-502b-11ea-8877-16223899763a.PNG" height="100%" width="100%">

## Database Design
<img src="https://user-images.githubusercontent.com/38008152/74586855-286ae300-502f-11ea-93b5-c8522c086f24.PNG" height="70%" width="70%">

<hr>

## 주요 기능

## Total Search and Search by board
<img src="https://user-images.githubusercontent.com/38008152/74587006-d88d1b80-5030-11ea-9b27-373cf05e1185.PNG" height="100%" width="100%">

* 전체 검색 및 게시판별 검색
  * and 조건과 or 조건을 분류하였을때 and 조건에 해당하는 경우 검색내용의 정확한 한가지 단어만 검색이 되게 하였습니다. 여기서 어려웠던 점은 or조건시 띄어쓴 부분을 나누어 각각의 단어를 검색하게 하는데 있었습니다. 따라서 띄어진 각단어를 비즈니스 로직을 통해 split 이용하여 배열에 넣고 List로 담아 주었습니다. 리스트에 담긴 각각의 단어는 마이바티스 foreach 컬렉션을 이용하여 모두 검색하게 하였습니다. 
  
```java
private List<String> contentSplit; 

<foreach collection="contentSplit" index="index" open="(" close=")" item="searchContent" separator="or" >
   board_content like CONCAT('%','${contentSplit[index]}','%')
</foreach>
```
## Hierarchy Reply and Order
<img src="https://user-images.githubusercontent.com/38008152/74587150-57cf1f00-5032-11ea-9431-edfc9ed2afaf.PNG" height="80%" width="80%">

## Img Upload
<img src="https://user-images.githubusercontent.com/38008152/74587288-12abec80-5034-11ea-9855-114bc15aee83.PNG" height="80%" width="80%">

## Good & Bad
<img src="https://user-images.githubusercontent.com/38008152/74587315-56065b00-5034-11ea-9660-bd5b2dfa06c6.PNG" height="80%" width="80%">

## Sign Up
<img src="https://user-images.githubusercontent.com/38008152/74587368-e5137300-5034-11ea-90ae-0b75138f361e.png" height="80%" width="80%">


