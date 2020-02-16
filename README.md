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

* 검색기능
  * and 조건과 or 조건을 분류하였을때 and 조건에 해당하는 경우 검색내용의 정확한 한가지 단어만 검색이 되게 하였습니다. 여기서 어려웠던 점은 or조건시 띄어쓴 부분을 나누어 각각의 단어를 검색하게 하는데 있었습니다. 따라서 띄어진 각단어를 비즈니스 로직을 통해 split 이용하여 배열에 넣고 List로 담아 주었습니다. 리스트에 담긴 각각의 단어는 마이바티스 foreach 컬렉션을 이용하여 모두 검색하게 하였습니다. 
  
```java
private List<String> contentSplit; 

<foreach collection="contentSplit" index="index" open="(" close=")" item="searchContent" separator="or" >
   board_content like CONCAT('%','${contentSplit[index]}','%')
</foreach>
```
## Hierarchy Reply and Order
<img src="https://user-images.githubusercontent.com/38008152/74587150-57cf1f00-5032-11ea-9431-edfc9ed2afaf.PNG" height="80%" width="80%">

* 계층형 댓글 
  * 댓글 작업은 restAPI를 통해 작업하였습니다. 각 댓글의 그룹 번호, 부모 댓글 번호, 그룹내 순서를 정하여 그룹내 순서대로 깊이를 주었고
  제이쿼리를 이용하여 Ajax로 리스트를 화면에 가지고와서 동적으로 뿌려주었습니다. 여기서 고민했던 부분은 동적으로 생성된 버튼은 어떻게 접근할지 그리고 답변 버튼을 클릭했을경우 인풋박스 창을 어떻게 가져와야 할지가 가장 큰 고민이었습니다. $(document).on 메소드를 이용하여 동적으로 생선된 버튼에 클릭 이벤트를 주었고 그 인벤트 안에서 생성된 댓글을 each문을 통해 $(this) 자기자신을 가리키는 댓글 창에 인풋 박스를 생성 시켜 해결하였습니다. 

* 게시글 정렬 작업
  * 게시글 정렬작업은 드롭메뉴를 통해서 get방식을 이용하여 쿼리로 각각의 정렬 이름값을 주고 그 값에 따른 마이바티스 동적 쿼리를 이용해 정렬 을 해주었습니다. 

```java
<sql id="sort">
 		<if test="sort != null">
 			<if test="sort == 'reset'.toString()">
 				new_count desc , board_register_date desc	
 			</if>
 			<if test="sort == 'date'.toString()">
 				board_register_date desc, new_count desc
 			</if>
    ......
```

## Img Upload
<img src="https://user-images.githubusercontent.com/38008152/74587288-12abec80-5034-11ea-9855-114bc15aee83.PNG" height="80%" width="80%">

* 스마트 에디터
  * 게시글 작성을 할 때 텍스트에 여러 효과를 주기 위해서 사용하는 네이버 스마트 에디터를 사용해보았습니다. 네이버 Developers의 smartEditer 튜토리얼을 통해 에디터 자체를 세팅하는 데는 많은 어려움은 없었습니다. 하지만 이미지 파일을 업로드하기위해 smartEditer 디렉터리에 있는 코드를 수정하는 부분들과 버전 및 파일업로드용 컨트롤러를 작성하여 업로드하는 부분은 오픈소스를 이용하고 이해하는 방법밖에 없었습니다.
스마트 에디터에 스프링 시큐리티는 영향을 줄 수밖에 없는데 그 이유는 csrf토큰을 활성화 시켰기 때문에 이미지를 업로드 하는 부분에서 csrf필터를 거칠수 밖에 없었습니다. 따라서 csrf토큰을 주어야 했는데 다중 멀티 업로드 부분은 Ajax가 적용 되었기 때문에 csrf토큰을 헤더 값으로 쉽게 줄 수 있었지만 싱글 업로드 이미지는 url GetMapping 통해 직접 줄수 밖에 없었기 때문에 url 주소 쿼리 값으로( _csrf=) 주어야 했습니다.

```java
 	 var token = this.document.querySelector(".token").value;
 	     
 		oFileUploader = new jindo.FileUploader(jindo.$("uploadInputBox"),{
 		sUrl  : '/common/photoUpload?_csrf='+token,			
```

## Good & Bad
<img src="https://user-images.githubusercontent.com/38008152/74587315-56065b00-5034-11ea-9660-bd5b2dfa06c6.PNG" height="80%" width="80%">

 * 추천과 비추천 기능
   * 유튜브와 같이 추천을 한 상태에서 비추천을 클릭했을시에 추천이 취소되는 동시에 비추천이 클릭되는 효과를 주었습니다.

## Sign Up
<img src="https://user-images.githubusercontent.com/38008152/74587368-e5137300-5034-11ea-90ae-0b75138f361e.png" height="80%" width="80%">

* 회원가입
  * Ajax를 이용하여 해당아이디의 등록 여부(1, 0)를 서버에서 가지고와 화면단에서 중복여부 체크및 정규식 체크를 한후 조건이 만족되면 전역변수에 false로 등록해 놓은 변수를 true로 주었습니다. 각각의 체크 전역 변수를 배열에 담아 한개라도 false생기면 회원 가입을 하지 못하게 하였습니다. 


