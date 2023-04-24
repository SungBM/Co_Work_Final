<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../main/header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/board_js/jquery-3.6.3.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/board_js/notice/list.js"></script>
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
<div class="main-content">
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

           <sec:authorize access="hasRole('ROLE_ADMIN')">
            <div class="write-button">
               <button type="button" class="btn btn-info" id="write-button">작성</button>
            </div>
         	</sec:authorize> 

            <!-- 상단기능 -->
            <form action="noticeList">
               <div class="search_area">
                  <!-- 구분 -->
                  <select class="form-select" id="search_field" name="search_field">
                     <option value="0">제목</option>
                     <option value="1">작성자</option>
                  </select>
                  <div class="search-bar">
                     <input id="search_word" name="search_word" type="text" class="form-control"
                           placeholder="입력하세요" value="${search_word }">
                  </div>
                  <div class="search-button">
                     <button id="search_button" name="search_button" class="btn btn-primary" type="submit">검색</button>
                  </div>
               </div>
            </form>
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
                     <c:set var="num" value="${listcount-(page-1)*limit}" />   
                     <c:forEach var="b" items="${noticelist}">
                        <tr>
                           <td><%--번호 --%>
                              <c:out value="${num}" /><%-- num 출력 --%>
                              <c:set var="num" value="${num-1}"/>   <%-- num=num-1; 의미--%>
                           </td>
                           <td><%--제목 --%>
                              <div>
                                 <a href="detail?num=${b.NOTICE_NUM }">    <%--detail?num=$~ 여기 띄어쓰기 하면 안됨 --%>
                                         <c:out value="${b.NOTICE_SUBJECT}" escapeXml="true" />            
                                 </a>  
                              </div>   
                           </td>
                           <td><div>${b.USER_ID}</div></td>
                           <td><div>${b.NOTICE_REG_DATE}</div></td>
                           <td><div>${b.NOTICE_READCOUNT}</div></td>
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
                           <a href="noticeList?page=${firstPage }&search_field=${search_field }&search_word=${search_word }"
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
                           <a href="noticeList?page=${page-1 }&search_field=${search_field }&search_word=${search_word }"
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
                           <c:url var = "go" value="noticeList">
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
                        <c:url var="next" value="noticeList">
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
                        <c:url var="end" value="noticeList">
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
<jsp:include page="../../main/footer.jsp"></jsp:include>
</body>
</html>
