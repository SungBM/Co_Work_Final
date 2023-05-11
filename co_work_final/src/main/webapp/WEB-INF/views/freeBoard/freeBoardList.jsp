<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/board_js/jquery-3.6.3.js"></script>
<link href="${pageContext.request.contextPath }/resources/assets/css/freeBoard_css/freeBoard.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/resources/assets/js/freeBoard_js/freeBoard.js"></script>
<script>
	const result = "${result}";
	if(result == 'deleteSuccess'){
		alert("삭제 성공입니다.")
	}else if(result == 'updateSuccess'){
		alert('회원 정보가 수정되었습니다.')
	};
	
$(document).ready(function(){
  $("#search_word").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $(".table tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<title>자유게시판</title>
</head>
<body>
<div class="main-content">
   <div class="page-content">
      <div class="container-fluid">
         <!-- start page title -->
         <div class="row">
               <div class="col-12">
               <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                    <h4 class="mb-sm-0 font-size-18">커뮤니티 > 자유게시판</h4>
               </div>   
              </div>
         </div>
           <!-- end page title -->  
           
           
         	<!-- 게시글 작성 -->
            <div class="write-button">
               <button type="button" id="write-button" class="btn btn-info float-right">글쓰기</button>
            </div>


            <!-- 검색 -->
<!--             <form action="freeBoardList">
 -->               <div class="search_area">
<!--                   구분
                  <select class="form-select" id="search_field" name="search_field">
                     <option value="0">제목</option>
                     <option value="1">내용</option>
                  </select> -->
                  <div class="search-bar">
                     <input id="search_word" name="search_word" type="text" class="form-control"
                           placeholder="검색어를 입력하세요" value="${search_word }">
                  </div>
<!--                   <div class="search-button">
                     <button id="search_button" name="search_button" class="btn btn-primary" type="submit">검색</button>
                  </div> -->
               </div>
         <!--    </form> -->
            
            
            <%-- 게시글이 있는 경우 --%>
            <c:if test="${listcount > 0}">
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
                              <option value="20" >20</option>
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
                     <c:set var="num" value="${listcount-(page-1)*limit}" />   
                     <c:forEach var="b" items="${freeboardlist}">
                        <tr>
                           <td><%--번호 --%>
                              <c:out value="${num}" /><%-- num 출력 --%>
                              <c:set var="num" value="${num-1}"/>   <%-- num=num-1; 의미--%>
                           </td>
                           <td><%--제목 --%>
                           <c:if test="${b.FREEBOARD_RE_LEV != 0 }">  <%-- 답글인 경우 이미지 삽입.--%>
		  		  		 	<c:forEach var="a" begin="0" end="${b.FREEBOARD_RE_LEV*2 }" step="1">  <!-- 공백으로 단 나눔 -->
		  		  		 	&nbsp;
		  		  		 	</c:forEach>
		  		  		 	<img src='${pageContext.request.contextPath }/resources/assets/images/board/line.gif'>
		  		  			 </c:if>
		  		  		 
		  		  			 <c:if test="${b.FREEBOARD_RE_LEV == 0 }"> <%-- 원문인 경우 --%>
		  		  		 	&nbsp;
		  		  			 </c:if>
                                 <a href="detail?num=${b.FREEBOARD_NUM }">    <%--detail?num=$~ 여기 띄어쓰기 하면 안됨 --%>
                                         <c:out value="${b.FREEBOARD_SUBJECT}" escapeXml="true" />
                                         <span class="gray small">[<c:out value="${b.cnt}"/>]</span>
                                 </a>  
                           </td>
                           <%-- <td><div>${b.FREEBOARD_NAME}</div></td> --%>
                           <td><div>co-work</div></td>
                           <td><div>${b.FREEBOARD_DATE}</div></td>
                           <td><div>${b.FREEBOARD_READCOUNT}</div></td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
               <div class="center-block"> <!-- 페이징 처리 이전,숫자,다음  -->
                  <ul class="pagination justify-content-center" id="page-link">  
                     <c:if test="${page <= 1 }">
                        <li class="page-item">
                           <a class="page-link gray">&lt;&lt;&nbsp;</a>  <!-- a태그 없음. 맨 앞페이지면 앞으로 이동할 수 없음 -->
                        </li>
                     </c:if>
                     <c:if test="${page > 1 }">
                        <li class="page-item">
                           <a href="freeBoardList?page=${firstPage }&search_field=${search_field }&search_word=${search_word }"
                              class="page-link">&lt;&lt;&nbsp;</a>
                        </li>
                     </c:if>
                     <c:if test="${page <= 1 }">
                        <li class="page-item">
                           <a class="page-link gray">&lt;&nbsp;</a>  <!-- a태그 없음. 맨 앞페이지면 앞으로 이동할 수 없음 -->
                        </li>
                     </c:if>
                     <c:if test="${page > 1 }">
                        <li class="page-item">
                           <a href="freeBoardList?page=${page-1 }&search_field=${search_field }&search_word=${search_word }"
                              class="page-link">&lt;&nbsp;</a>
                        </li>
                     </c:if>
                     
                     <c:forEach var="a" begin="${startpage }" end="${endpage }">  <!-- 숫자 -->
                        <c:if test="${a == page }">
                           <li class="page-item active">
                              <a class="page-link">${a }</a>
                           </li>
                        </c:if>
                        <c:if test="${a!=page }"> <!-- 다음 -->
                           <c:url var = "go" value="freeBoardList">
                              <c:param name="search_field" value="${search_field }" />
                              <c:param name="search_word" value="${search_word }" />
                              <c:param name="page" value="${a }" />
                           </c:url>
                           <li class="page-item">
                              <a href="javascript:go(${a })" class="page-link">${a }</a>
                           </li>
                        </c:if>
                     </c:forEach>
                     
                     <c:if test="${page >= maxpage }"> <!-- 다음도 마지막 페이지에선 갈 수 없음 -->
                        <li class="page-item">
                           <a class="page-link gray">&nbsp;&gt;</a>
                        </li>
                     </c:if>
                     <c:if test="${page < maxpage }">
                        <c:url var="next" value="freeBoardList">
                           <c:param name="search_field" value="${search_field }" />
                           <c:param name="search_word" value="${search_word }" />
                           <c:param name="page" value="${page+1 }" />
                        </c:url>
                        <li class="page-item">
                           <a href="javascript:go(${page+1 })" class="page-link">&nbsp;&gt;</a>
                        </li>                  
                     </c:if>
                     
                     <c:if test="${page >= maxpage }"> <!-- 다음도 마지막 페이지에선 갈 수 없음 -->
                        <li class="page-item">
                           <a class="page-link gray">&nbsp;&gt;&gt;</a>
                        </li>
                     </c:if>
                     <c:if test="${page < maxpage }">
                        <c:url var="end" value="freeBoardList">
                           <c:param name="search_field" value="${search_field }" />
                           <c:param name="search_word" value="${search_word }" />
                           <c:param name="page" value="${maxpage }" />
                        </c:url>
                        <li class="page-item">
                           <a href="javascript:go(${maxpage })" class="page-link">&nbsp;&gt;&gt;</a>
                        </li>
                     </c:if>
                  </ul>
               </div>
            </c:if><%-- <c:if test"${listcount > 0}" > end --%>
      
         <%-- 게시글이 없는 경우 --%>
         <c:if test="${listcount == 0 && empty search_word }">
            <h3 style="text-align:center">등록된 글이 없습니다.</h3>
         </c:if>
         <c:if test="${listcount == 0 && !empty search_word }">
            <h3 style="text-align:center">검색 결과가 없습니다.</h3>
         </c:if>
      </div>
   </div>
</div>       
   <!-- 하단푸터 -->
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>
