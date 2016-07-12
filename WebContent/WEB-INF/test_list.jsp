<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<div class="wrapper community">
	
	<!-- content -->
	<div id="content">
			<div class="community">
				<div class="box_center">
					<h2>COMMUNITY</h2>
					<h3>포토갤러리</h3>
					<div class="gallery_list mt70">
					
						<div>
							<c:forEach var="item" items="${testList}" varStatus="status" >
								<li>
									<a href="gallery_view.do?galidx=${item.widx}"><img src="${item.fileurl}" alt=""/></a>
									<p class="thumb_name">${item.subject}</p>
									<p class="w_date">${item.content}</p>
									
								</li>
							</c:forEach>
						</div>
					</div>
					
				</div>
			</div>
	</div>
	<!-- //content -->
	<div class="footer ty_b">
		<div class="ft_inner">
			<p class="address">남해 투민펜션  /  법인명 : ㈜혜민  /  경상남도 남해군 서면 정포리 산96<br />예약문의 : 010-3471-0085   010-3209-0085   051-601-3900<br />사업자등록번호 : 872-86-00073  /  통신판매업신고번호 : 제0000-경남남해-0000호</p>
			<p class="copyrights">COPYRIGHTS © 2016 ㈜투민. ALL RIGHT RESERVED.</p>
		</div>
	</div>
</div>
<!-- //wrapper -->

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>


</body>
</html>
  