<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>smart editor test</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, initial-scale=1">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap&subset=korean" rel="stylesheet">
	<!--  Bootstrap CSS  -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap.css">
	<!--  bootstrap.min.css  -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
	<!--  bootstrap-grid.css  -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-grid.css">
	<!--  bootstrap-grid.min.css  -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-grid.min.css">
	<!--  bootstrap-reboot.css  -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-reboot.css">
	<!--  bootstrap-reboot.min.css  -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-reboot.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js" charset="utf-8"></script>



<div class="container" style="margin-top: 40px;" >
	<form action="home" name="writefrm" id="writefrm" >
		<textarea id="textreaContent" ></textarea>
		<button type="button" class="btn btn-success" style="margin-top: 30px " id="btn_publish">게시하기</button>
		<button type="button" class="btn btn-danger" style="margin-top: 30px " id="btn_cancel">취소</button>
	</form>
</div>



<script type="text/javascript">

$(document).ready(function() {

	var editorConfig = { 
			filebrowserUploadUrl : "${pageContext.request.contextPath}/uploadFromAction",
			height:300,
			toolbar : [ 
						[ 'Source', '-' , 'NewPage', 'Preview' ], 
						[ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ], 
						[ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript'], 
						[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ], 
						'/', 
						[ 'Styles', 'Format', 'Font', 'FontSize' ], 
						[ 'TextColor', 'BGColor' ], 
						[ 'Image', 'Flash', 'Table' , 'SpecialChar' , 'Link', 'Unlink'] 
				]

			}

	CKEDITOR.replace('textreaContent', editorConfig);

	CKEDITOR.on('dialogDefinition', function(evt) {
			var dialogName = evt.data.name;
			var dialogDefinition = evt.data.definition;

			switch(dialogName)  {
				case 'image':
					// dialogDefinition.removeContents('info');
					dialogDefinition.removeContents('Link');
					dialogDefinition.removeContents('advanced');
					break;
			}
	});

	$("#btn_publish").on("click",function() {
		alert(CKEDITOR.instances.textreaContent.getData());
	});

	$("#btn_cancel").click(function() {
		CKEDITOR.instances.textreaContent.setData(' ');
	});

	
});
	
</script>



<!--  bootstrap.bundle.js  -->
<script src="/resources/assets/js/bootstrap.bundle.js"></script>
<!--  bootstrap.bundle.min.js  -->
<script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
<!--  Bootstrap Js  -->
<script src="/resources/assets/js/bootstrap.js"></script>
<!--  bootstrap.min.js  -->
<script src="/resources/assets/js/bootstrap.min.js"></script>
</body>
</html>