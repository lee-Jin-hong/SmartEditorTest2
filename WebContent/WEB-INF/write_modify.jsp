<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="author" content="">
<meta name="viewport" content="width=1600">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="se/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"> </script>
<title>Admin</title>
</head>
<body>
<div class="wrapper adminWrap">
   
   
   <!-- content -->
   <div id="content">
      <h2>갤러리 수정</h2>
      <div class="tbl_Write mt20">
         <form action="write_modify_ok.do" method="post" enctype="multipart/form-data">
         <input type="hidden" name="widx" value="${widx}" />
            <table>
               <colgroup>
                  <col width="20%">
                  <col width="80%">
               </colgroup>
               <tbody>
                  <tr>
                     <th>제목</th>
                     <td>
                        <label for="w_title"  class="blind">제목</label>
                        <input type="text" name="subject" id="w_title" value="${test.subject}" style="width:60%;" maxlength="50">
                        <span class="txt_tip"></span>
                     </td>
                  </tr>
                  <tr>
                     <th>내용</th>
                     <td class="txt_write">
                     	<textarea id="ir1" name="ir1">  ${test.content} </textarea>
                     </td>
                  </tr>
                  </tbody>
               </table>
            
            <div class="btn_wrap tc mt30">
               <input type="button" onclick="submitContents(this);" value="등록">수정</button>
               <a href="admin_gallery_list.do" class="btn_s_cancle">취소</a>
            </div>   
         </form>
      </div>
      
      
   </div>
   <!-- //content -->
</div>
<!-- //wrapper -->


<div class="footer ty_b mt80">
   <div class="ft_inner">
      <p class="address">남해 투민펜션  /  법인명 : ㈜혜민  /  경상남도 남해군 서면 정포리 산96<br />예약문의 : 010-3471-0085   010-3209-0085   051-601-3900<br />사업자등록번호 : 872-86-00073  /  통신판매업신고번호 : 제0000-경남남해-0000호</p>
      <p class="copyrights">COPYRIGHTS © 2016 ㈜투민. ALL RIGHT RESERVED.</p>
   </div>
</div>




<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
   
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
    		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
    		
    		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
    		
    		try {
    			elClickedObj.form.submit();
    		} catch(e) {}
    	}

    	function setDefaultFont() {
    		var sDefaultFont = '궁서';
    		var nFontSize = 24;
    		oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
    	} 
</script>


</body>
</html>
  