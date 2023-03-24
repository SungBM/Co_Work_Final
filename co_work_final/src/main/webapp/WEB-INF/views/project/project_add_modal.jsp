<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
</head>
<body>
       <!-- start page title -->
        <div class="row">
            <div class="col-12">
             <button type="button" class="btn btn-primary waves-effect waves-light"
                                        id="sa-success">Click me</button>
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
                                                <form name="project_Add" id="project_Add">                                    
                                                        <div class="mb-3">
                                                            <label for="recipient-name" class="col-form-label">프로젝트명</label>
                                                            <input type="text" class="form-control" id="project_name" name="project_name">
                                                        </div>
                                                        <div class="col-md-12">
                                                          <label class="col-md-2 col-form-label">상태</label>
                                                           <select class="form-select" id="project_state" name="project_state">
                                                               <option value=1>진행중</option>
                                                           </select>
                                                       </div>
                                                        <div class="mb-3">
                                                            <label for="message-text" class="col-form-label">관리자</label>
                                                            <textarea class="form-control" id="project_admin" name="project_admin" ></textarea>
                                                        </div>
                                                       <div class="mb-3 row">
                                                 <label for="example-date-input" class="col-md-3 col-form-label" >시작일</label>
                                                 <div class="col-md-12">
                                                <input class="form-control" type="date" id="project_start" name="project_start">
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                 <label for="example-date-input" class="col-md-3 col-form-label" >종료일</label>
                                                 <div class="col-md-12">
                                                <input class="form-control" type="date" id="project_end" name="project_end">
                                                    </div>
                                                </div>
                                                       <div class="col-md-12">
                                                          <label class="col-md-2 col-form-label">우선순위</label>
                                                           <select class="form-select" id="project_priority" name="project_priority">
                                                               <option>없음</option>
                                                           </select>
                                                       </div>
                                                    
                                              <div class="mb-3">
                                                            <label for="message-text" class="col-form-label">참여자</label>
                                                            <textarea class="form-control" id="project_admin" name="project_admin"></textarea>
                                                        </div>
                                                   </form>      
                                                   </div>   
                                                <div class="modal-footer">                                                                       
                                                    <button type="submit" id="submit_add" class="btn btn-primary">완료</button>
                                           
                                                </div>
                                                                  
                                                </div> <!-- <div class="modal-content"> end -->
                                                
                                            </div> <!-- <div class="modal-dialog"> end -->
                                        </div> <!-- <div class="modal fade" end -->
                                    </div> <!-- <div class="col-12"> end -->
                                </div> <!-- <div class="row"> end -->
                          </body>
                    <script>
                    document.getElementById('project_start').valueAsDate = new Date();
                    document.getElementById('project_end').valueAsDate = new Date();
                    </script>
                            