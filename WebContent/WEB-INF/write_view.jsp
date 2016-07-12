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
<title>Admin</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/board.css" />

<!--[if IE 9]>
<link rel="stylesheet" type="text/css" href="iefont9.css">
<![endif]-->
</head>
<body>
<div class="wrapper adminWrap">
   
   <!-- content -->
   <div id="content">
      
      <h2>갤러리 상세보기</h2>
      <div class="tbl_detail mt20">
      
         <table>
            <colgroup>
               <col style="width:20%"/>
               <col style="width:auto"/>
               <col style="width:20%"/>
               <col style="width:25%"/>
            </colgroup>
            <tbody>
            <tr>
            <td class="photo_edit tc" colspan="4">
            <p>${test.subject}</p>
            </td>
            
            <td>
            ${test.content}
            
            </td>
            </tr>
            </tbody>
         </table>
         
         <div class="btnwrap mt20">
            <a href="admin_gallery_list.do" class="btn_s_list fl">목록</a>
             <a href="" class="btn_s_delete fr pop_del" data-galidx="${gallery.galidx}"> 삭제</a>
            <a href="admin_gallery_modify.do?galidx=${gallery.galidx}" class="btn_s_modify fr"> 수정</a>
         </div>
   
      </div>
   </div>
   <!-- //content -->
</div>
<!-- //wrapper -->


<div class="footer mt80">
   <div class="ft_inner">
      <p class="address">남해 투민펜션  /  법인명 : ㈜혜민  /  경상남도 남해군 서면 정포리 산96<br />예약문의 : 010-3471-0085   010-3209-0085   051-601-3900<br />사업자등록번호 : 872-86-00073  /  통신판매업신고번호 : 제0000-경남남해-0000호</p>
      <p class="copyrights">COPYRIGHTS © 2016 ㈜투민. ALL RIGHT RESERVED.</p>
   </div>
</div>




<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>


<script type="text/javascript">
$(function(){
   $(".pop_del").click(function(){
      var result = confirm("정말 삭제하시겠습니까?");

      if(result){
         window.open("admin_gallery_delete.do?galidx="+$(this).attr("data-galidx"));
      } else {
         alert("취소되었습니다.");
      }
   
   })
})
</script>-->

</body>
</html>
  