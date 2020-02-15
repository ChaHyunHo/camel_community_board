$(document).ready(function() {
	
	/* 최상단 즐겨찾기 설명 */
	$("#favor").on("click",function() {

		alert("즐겨찾기를 하시려면 ctrl + D를 눌러주세요.");

	});

	/* 최상단 lnb 날짜 */
	var d = new Date();
	var month = (d.getMonth()+1)>9 ? ''+(d.getMonth()+1) : '0'+(d.getMonth()+1);
	var day = d.getDate()>9 ? ''+d.getDate() : '0'+d.getDate();
	var customDate = month +"월" + " " +day+"일"; 

	$("#nowDay").text(customDate);

	/* 사이드 네비바 open || off */
	$(".open-menu").on("click",function() {

		mysidenav("300px");
	});
	
	$(".closebtn").click(function() {

		mysidenav("0px");
	})
	
	function mysidenav(px) {
		$("#mysidenav").width(px);
	}
	
});