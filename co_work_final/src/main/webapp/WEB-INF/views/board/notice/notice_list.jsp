<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../main/header.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
		<div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Basic example</h4>
                        <p class="card-title-desc">For basic styling—light padding and
                            only horizontal dividers—add the base class <code>.table</code> to any
                            <code>&lt;table&gt;</code>.
                        </p>

                        <div class="table-responsive">
                            <table class="table mb-0">

                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Username</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
		</div>
	</div>
</body>
<jsp:include page="../../main/footer.jsp"></jsp:include>
</html>