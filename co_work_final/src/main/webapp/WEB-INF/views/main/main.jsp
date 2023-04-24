<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
	<title>CO-WORK</title>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="main-content">
    <div class="page-content">
        <div class="container">
            <!--공지사항-->
            <div class="row">
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-body main">
                            <h4 class="card-title mb-5"><i class="bx bx-book-bookmark"></i> 공지사항${saveid}</h4>
                <table class="table table-striped" style="margin-top: -30px;">
				<thead>
					<tr>
						<th><div>NO.</div></th>
						<th><div>제목</div></th>
						<th><div>작성자</div></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="b" items="${noticelist}">
						<tr>
						<td>${b.NOTICE_NUM}</td>
							<td><%--제목 --%>
								<div>
									<a href="detail?num=${b.NOTICE_NUM}">
											${b.NOTICE_SUBJECT}
									</a>
								</div>	
							</td>
							<td><div>${b.USER_ID}</div></td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
                        </div>
                    </div>
                </div>

                <!-- 커뮤니티 -->
                <div class="col-xl-6">
                    <div class="card" style="margin-left: 40px">
                        <div class="card-body main" style="margin-left: -50px; margin-top: -6px;">
                            <h4 class="card-title mb-5"><i class="bx bx-calendar-check"></i>오늘 주요 일정</h4>
                            <c:if test="${calendarList eq null}">
                              <img src="${pageContext.request.contextPath }/resources/image/test1.png"
                           	 	style="width: 300px; height: 250px; margin-top: -50px; margin-left: 90px;">
							<h4 style="font-weight: bold; text-align: center;">등록된 일정이 없습니다</h4>
                            </c:if>
                                <c:if test="${calendarList ne null}">
                              <table class="table project-list-table table-nowrap align-middle table-borderless"
                              style="margin-top: -40px;">
							<thead>
								<tr>
									<th scope="col">일정</th>
									<th scope="col">내용</th>
									<th scope="col">시작 시간</th>
									<th scope="col">종료 시간</th>
								</tr>
							</thead>
							<tbody >
							<c:forEach  var="cl" items="${calendarList }">
							<tr>
								<td><p style="color: ${cl.cal_color}">${cl.cal_title }</p></td>
								<td><p style="color: ${cl.cal_color}"> ${cl.cal_content }</p></td>
								<td><p>${cl.cal_start_date }</p></td>
								<td><p>${cl.cal_end_date }</p></td>
							</tr>
							</c:forEach>
							</tbody>
							</table>
                            </c:if>
                          
                        </div>
                    </div>
                </div>
            </div>

            <!-- 장터 -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body main">
                            <h4 class="card-title mb-4"><i class="bx bx-folder-open"></i>주요 프로젝트 목록</h4>
                           <table
							class="table project-list-table table-nowrap align-middle table-borderless">
							<thead>
								<tr>
									<th scope="col" style="width: 100px">${listcount }PROJECT</th>
									<th scope="col">프로젝트</th>
									<th scope="col">상태</th>
									<th scope="col">PROGRESS</th>
									<th scope="col">시작일</th>
									<th scope="col">종료일</th>
									<th scope="col">우선순위</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="p" items="${projectList }">
									<tr>
										<c:if test="${p.row_num <= 6 }">
											<td><img
												src="${pageContext.request.contextPath }/resources/image/project/img-${p.row_num }.png" alt=""
												class="avatar-sm"></td>
										</c:if>
										<c:if test="${p.row_num > 6  }">
											<td><img
												src="${pageContext.request.contextPath }/resources/image/project/img-${p.row_num -6}.png" alt=""
												class="avatar-sm"></td>
										</c:if>

										<td>
											<h5 class="text-truncate font-size-14"
											id="projectDetail" aria-value="${p.project_num }">
												<a href="#" class="text-dark"> <c:out
														value="${p.project_name }" />
												</a>
											</h5>
											<p hidden="true" id="${p.project_num }"></p>
										</td>
										<td>
											<h5 id="getState" aria-valuenow="${p.project_state }"
												class="text-truncate state font-size-14">
												<c:out value="${p.project_state }" />
											</h5>
										</td>
										<td>
											<div class="">
												<div class="progress">
													<div
														class="progress-bar progress-bar-striped progress-bar-animated"
														role="progressbar" aria-valuenow="${p.project_prog }"
														aria-valuemin="100" aria-valuemax="100"
														style="width: ${p.project_prog}%">${p.project_prog }%
													</div>
												</div>
											</div>
										</td>
										<td><c:out value="${p.project_start.substring(0,10) }" /></td>
										<td><c:out value="${p.project_end.substring(0,10) }" /> <c:if
												test="${p.project_end == null}">
                                    		미정
                                    </c:if></td>
										<td><span class="badge "
											aria-valuenow="${p.project_state }" style="width: 50%">${p.project_priority }</span></td>
										
										
									</tr>
								</c:forEach>
							</tbody>
							</table>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
 <script src="${pageContext.request.contextPath }/resources/assets/js/project_js/project_list_onload.js"></script>

</body>


</html>
