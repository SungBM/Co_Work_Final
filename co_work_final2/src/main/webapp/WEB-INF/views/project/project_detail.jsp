<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath }/resources/assets/css/project_Css/project.css" rel="stylesheet" type="text/css" />
<div class="page-content">
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
             <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                            data-bs-whatever="@mdo">프로젝트 추가</button>
                                             <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">프로젝트 추가</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                             
                                                <div class="modal-body">                                         
                                                        <div class="mb-3">
                                                            <label for="recipient-name" class="col-form-label">프로젝트명</label>
                                                            <input type="text" class="form-control" id="project_name" name="project_name">
                                                        </div>
                                                        <div class="col-md-12">
									                               <label class="col-md-2 col-form-label">상태</label>
									                                <select class="form-select" id="project_prog" name="project_prog">
									                                    <option value=0>요청</option>
									                                    <option value=1>진행중</option>
									                                    <option value=2>마감</option>
									                                </select>
									                            </div>
                                                        <div class="mb-3">
                                                            <label for="message-text" class="col-form-label">관리자</label>
                                                            <textarea class="form-control" id="project_admin" name="project_admin" ></textarea>
                                                        </div>
                                                       <div class="mb-3 row">
							                            <label for="example-date-input" class="col-md-3 col-form-label" >시작일</label>
							                            <div class="col-md-12">
								                        <input class="form-control" type="date" value="2023-02-06" id="project_start" name="project_start">
								                            </div>
								                        </div>
								                        <div class="mb-3 row">
							                            <label for="example-date-input" class="col-md-3 col-form-label" >종료일</label>
							                            <div class="col-md-12">
								                        <input class="form-control" type="date" value="2023-02-06" id="project_end" name="project_end">
								                            </div>
								                        </div>
									                            <div class="col-md-12">
									                               <label class="col-md-2 col-form-label">우선순위</label>
									                                <select class="form-select" id="project_priority" name="project_priority">
									                                    <option>높음</option>
									                                    <option>중간</option>
									                                    <option>낮음</option>
									                                </select>
									                            </div>
									                   <div class="mb-3">
                                                            <label for="message-text" class="col-form-label">참여자</label>
                                                            <textarea class="form-control" id="project_partici" name="project_partici"></textarea>
                                                        </div>      
									                        </div>   
                                                <div class="modal-footer">                                                                       
                                                    <button type="submit" id="submit_add" class="btn btn-primary">완료</button>
                                           
                                                </div>
									                                       
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                  </div>
                             
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                    <h4 class="mb-sm-0 font-size-18">Projects List</h4>
					
                    <div class="page-title-rig ht">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Projects</a></li>
                            <li class="breadcrumb-item active">Projects List</li>
                            
                        </ol>
                    </div>

                </div>
            </div>
        </div>
        <!-- end page title -->
        <div class="row">
            <div class="col-lg-12">
                <div class="">
                    <div class="table-responsive">
                        <table class="table project-list-table table-nowrap align-middle table-borderless">
                            <thead>
                                <tr>
                                    <th scope="col" style="width: 100px">${listcount }PROJECT</th>
                                    <th scope="col">프로젝트</th>
                                    <th scope="col">상태</th>
                                    <th scope="col">PROGRESS</th>
                                    <th scope="col">시작일</th>
                                    <th scope="col">종료일</th>
                                    <th scope="col">우선순위</th>
                                    <th scope="col">참여자</th>
                                    <th scope="col">관리자</th>
                                </tr>
                            </thead>
                            <tbody>
	                          
                            	<c:forEach var="p" items="${projectList }">
                            	
                            	<tr>
                         		<c:if test="${p.row_num <= 6 }">
                            	 	<td><img src="assets/images/companies/img-${p.row_num }.png" alt="" class="avatar-sm"></td>
                            	</c:if>
                            	<c:if test="${p.row_num > 6  }">
                            		  <td><img src="assets/images/companies/img-${p.row_num -6}.png" alt="" class="avatar-sm"></td>
                            	</c:if>
                            
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-dark">
											<c:out value="${p.project_name }"/>
										</a></h5>
                                        
                                    </td>
                                    <td>
                                    	<h5 id="getState" aria-valuenow = "${p.project_state }" class="text-truncate font-size-14" >
                                    		<c:out value="${p.project_state }"/>
										</h5>
                                    </td>
                                    <td>
                                    	<div class="">
                           					<div class="progress">
                                				<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"
                                    			aria-valuenow="${p.project_prog }" aria-valuemin="100" aria-valuemax="100" style="width: ${p.project_prog}%">
                                    			${p.project_prog }%
                                    			</div>
                            				</div>
                        				</div>
                                    </td>
                                     <td>	<c:out value="${p.project_start.substring(0,10) }"/></td>
                                    <td>
                               		<c:out value="${p.project_end.substring(0,10) }"/>
                                    <c:if test="${p.project_end == null}" >
                                    		미정
                                    </c:if>	
                                    </td>
                                    <td><span class="badge " aria-valuenow="${p.project_state }" style="width: 50%">${p.project_priority }</span></td>
                                    <td>
                                    <div class="avatar-group">
                                    	<c:forEach var='u' items="${p.project_parti }" varStatus="status">
                                    		<c:if test="${status.index > 3 }">
                                    			<div>
                                            		<a href="#" class="dropdown-toggle card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                                		<i class="mdi mdi-dots-horizontal font-size-18"></i>
                                            		</a>
                                            	</div>
                                    		</c:if>
                                    		<c:if test="${status.index <= 3 }">
                                    		  <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="image/users/${u.USER_IMG }" alt="" class="rounded-circle avatar-xs" id="more_team">
                                                </a>
                                              </div>
                                            </c:if>
                                    	</c:forEach>
                                    </div>
                                    </td>
                                    <td>
                                        <div class="avatar-group">
                                             <div class="avatar-group-item">
                                             <!-- 프로필 페이지로 연결 -->
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="image/users/${p.project_admin_img }" alt="" class="rounded-circle avatar-xs">
                                                </a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            	</c:forEach>
                          
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- end row -->

        <div class="row">
            <div class="col-12">
                <div class="text-center my-3">
                  <!--   
                  <a href="javascript:void(0);" class="text-success"><i class="bx bx-loader bx-spin font-size-18 align-middle me-2"></i> Load more </a>
				   -->                
                </div>
            </div> <!-- end col-->
        </div>
        <!-- end row -->
    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->
 <script src="${pageContext.request.contextPath }/resources/assets/js/project_js/project_add.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/project_js/project_list_onload.js"></script>


