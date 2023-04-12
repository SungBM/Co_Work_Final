<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../main/header.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/board_js/notice/list.js"></script>
<script>
	$(function() {
		//검색 클릭 후 응답화면에는 검색시 선택한 필드가 선택되도록
		let selectedValue = '${search_field}'
		if (selectedValue != '-1')
			$("#search_field").val();
		else
			selectedValue=0;	//선택된 필드가 없는 경우 기본적으로 아이디를 선택하도록 합니다.
			
			//검색 후 selectedValue값에 따라 placeholder가 나타나도록 합니다.
		const message=["제목", "내용", "작성자"]
			$("#search_word").attr("placeholder", message[selectedValue] + "입력하세요");
			
			$("#search_button").click(function(){
				var search_field = $("#search_field").val();
				var search_word = $("#search_word").val();
				
				if ($("#search_word").val() == '') {
					alert("검색어를 입력하세요");
					$("#search_word").focus();
					return false;
				}
			});//button click end
	
	//검색어 입력창에 placeholder 나타나도록
	$("#search_field").change(function(){
		selectedValue = $(this).val();
		$("#search_word").val('');
		$("#search_word").attr("placeholder", message[selectedValue] + "입력하세요");
	})//$("#search_field").change end
})//ready end
	
</script>
<style>

textarea{
	resize: none;
}
.container-fluid{
	width:90%;
	margin: 0 auto;
}

.search_area{        
  text-align: center;
}
.form-select{
	display: inline-block;
	width:10%;
}
.search-bar{
	display: inline-block;
	width:50%;
}
.search-button{
	display: inline-block;
}
.write-button{
	float: right;
}
.rows{
	float: right;
}
.gray{
	color: gray;
}

	div > div > table > thead > tr:nth-child(2) > th:nth-child(1){width:13%}
	div > div > table > thead > tr:nth-child(2) > th:nth-child(2){width:40%}
	div > div > table > thead > tr:nth-child(2) > th:nth-child(3){width:16%}
	div > div > table > thead > tr:nth-child(2) > th:nth-child(4){width:16%}
	div > div > table > thead > tr:nth-child(2) > th:nth-child(5){width:13%}
</style>
<title>공지사항</title>
</head>
<body>
<div class="page-content">
	<div class="container-fluid">
		<!-- start page title -->
		<div class="row">
            <div class="col-12">
				<div class="page-title-box d-sm-flex align-items-center justify-content-between">
		     		<h4 class="mb-sm-0 font-size-18">커뮤니티 > 공지사항</h4>
				</div>	
        	</div>
		</div>
        <!-- end page title -->  
        
		<!-- 공지 작성 -->
		<c:if test="${id == 'admin1'}">
			<div class="write-button">
				<button type="button" class="btn btn-info" id="write-button">작성</button>
			</div>
		</c:if>
		<%-- 게시글이 있는 경우 --%>
		
		<c:if test="${listcount > 0}">
			<!-- 상단기능 -->
			<div class="search_area">
				<!-- 구분 -->
				<select class="form-select" id="search_field" name="search_field">
					<option value="0" selected>제목</option>
					<option value="1">작성자</option>
				</select>
				<div class="search-bar">
					<input name="search_word" type="text" id="search_word" class="form-control" value="${search_word}">
				</div>
				<div class="search-button">
					<button type="submit" class="btn btn-primary" id="search_button" >검색</button>
				</div>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="4">
							<font>등록 : ${listcount}</font>
						</th>
						<th colspan="1">
							<div class="rows">
							<select class="from-control" id="viewcount">
								<option value="5">5</option>
								<option value="10" selected>10</option>
								<option value="25" >25</option>
								<option value="50" >50</option>
							</select>
							</div>
						</th>
					</tr>
					<tr>
						<th><div>NO.</div></th>
						<th><div>제목</div></th>
						<th><div>작성자</div></th>
						<th><div>날짜</div></th>
						<th><div>조회수</div></th>
					</tr>
				</thead>
				<tbody>
					<c:set var="num" value="${listcount-(page-1)*limit}"/>	
					<c:forEach var="b" items="${noticelist}">
						<tr>
							<td><%--번호 --%>
								<c:out value="${num}"/><%-- num 출력 --%>
								<c:set var="num" value="${num-1}"/>	<%-- num=num-1; 의미--%>
							</td>
							<td><%--제목 --%>
								<div>
									<a href="detail?num=${b.notice_num}">
										<c:if test="${b.NOTICE_SUBJECT.length()<20}">
											<c:out value="${b.NOTICE_SUBJECT}" escapeXml="true"/>
										</c:if>
									</a>
								</div>	
							</td>
							<td><div>${b.USER_ID}</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="center-block">
				<ul class="pagination justify-content-center">
					<c:if test="${page <= 1}">
						<li class="page-item">
							<a class="page-link gray">이전&nbsp;</a>
						</li>
					</c:if>
					<c:if test="${page > 1}">
						<c:url var="Previous" value="NoticeList.bon">
							<c:param name="search_field"	value="${search_field}" />
							<c:param name="search_word"		value="${search_word}" />
							<c:param name="page"			value="${page-1}" />
						</c:url>
						<li class="page-item">
							<a href= "${Previous}" class="page-link">이전&nbsp;</a>
						</li>
					</c:if>
					
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a == page}">
							<li class="page-item active">
								<a class="page-link">${a}</a>
							</li>
						</c:if>
						<c:if test="${a != page}">
							<c:url var="go" value="NoticeList.bon">
								<c:param name="search_field"	value="${search_field}" />
								<c:param name="search_word"		value="${search_word}" />
								<c:param name="page"			value="${a}" />
							</c:url>
							<li class="page-item">
								<a href="${go}" class="page-link">${a}</a>
							</li>
						</c:if>
					</c:forEach>
					
					<c:if test="${page >= maxpage}">
						<li class="page-item">
							<a class="page-link gray">&nbsp;다음</a>
						</li>
					</c:if>
					<c:if test="${page < maxpage}">
						<c:url var="next" value="NoticeList.bon">
							<c:param name="search_field"	value="${search_field}" />
							<c:param name="search_word"		value="${search_word}" />
							<c:param name="page"			value="${page+1}" />
						</c:url>
						<li class="page-item">
							<a href="${next}" class="page-link">&nbsp;다음</a>
						</li>
					</c:if>
				</ul>
			</div>
		</c:if><%-- <c:if test"${listcount > 0}" > end --%>
		
		<%-- 게시글이 없는 경우 --%>
		<c:if test="${listcount == 0}">
			<h3 style="text-align:center">등록된 글이 없습니다.</h3>
		</c:if>
	</div>
</div>    
<jsp:include page="../../main/footer.jsp"></jsp:include>
</html>