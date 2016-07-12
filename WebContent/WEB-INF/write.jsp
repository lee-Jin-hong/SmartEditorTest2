<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta name="title" content="">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" id="viewport" content="">
	<title>OASIS ARCHITECTS</title>
	<script src="se/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"> </script>
	
	
</head>
<body>
	
		
		<div class="admin_content">
			<p class="title"> 등록</p>
				<form action="write_ok.do" method="post" enctype="multipart/form-data">
					<table>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
						<tr>
							<th>제목</th>
							<td>
							<input type="text" name="subject" maxlength="50">
							<span> </span>
							<td> 
						<tr>
						    <th>내용 </th>
							<td >
								<textarea id="ir1" name="ir1"> </textarea>
								
							</td>
						</tr>
						
						
					</tbody>
					</table>
					<div class="btn_wrap pt30">
				<a href="#" class="type5 fl" >목록</a>
				<input type="button" onclick="submitContents(this);" value="등록">
				<a href="javascript:;" class="type_c">취소</a>
			</div>
				<input type="hidden" name="thumbURL" value="" />
				</form>
			
		</div>
		
	</div>
	<!-- wrap -->

	<div class="footer">
		<div class="inner">
			<p class="copyright">Copyright 2016 © Oasisarchi. All Rights Reserved.</p>
		</div>
	</div>

</body>
<script type="text/javascript" src="se/js/jquery-1.11.3.min.js" ></script>
<script type="text/javascript">
   var jQuery = $;
   var oEditors = []; 
   
      nhn.husky.EZCreator.createInIFrame({
         oAppRef : oEditors,
         elPlaceHolder:"ir1",
         sSkinURI : "${pageContext.request.contextPath}/se/SmartEditor2Skin.html",
         fCreator:"createSEditor2"
      });
   
      function pasteHTML() {
    		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
    		oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
    	}

    	function showHTML() {
    		var sHTML = oEditors.getById["ir1"].getIR();
    		alert(sHTML);
    	}
    		
    	function submitContents(elClickedObj) {
    		var iframe0 = jQuery.find("iframe")[0];
    		var iframe1 = iframe0.contentWindow.document.getElementById("se2_iframe");
    		var $iframe1 = jQuery(iframe1.contentWindow.document);
    		var $imgs = $iframe1.find("img");
    		var $thumbImg = null;
    		var imgSrc = "";
    		if($imgs.length > 0){
    			$thumbImg = $iframe1.find("img").eq(0);
    			imgSrc = $thumbImg.attr("src");
    			$(elClickedObj.form).find("[name=thumbURL]").val(imgSrc);
    			//imgSrc를 썸네일 이미지로 만들기 위한 원본 이미지 url(fileName)으로 보내고
    			//newFileName으로 생성된 url을 여기에 response 해준다.
    			//response 받은 썸네일 URL을 아래 elClickedObj.form에 썸네일 이미지용 input에 저장한 후 submit
    			//return;
	    		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	    		
	    		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	    		
	    		try {
	    			elClickedObj.form.submit();
	    		} catch(e) {}
    		}
    		
    		
    		
    	}

    	function setDefaultFont() {
    		var sDefaultFont = '궁서';
    		var nFontSize = 24;
    		oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
    	} 
</script>
</html>

