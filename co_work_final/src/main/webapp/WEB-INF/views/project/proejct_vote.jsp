<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<jsp:include page="../main/header.jsp"/>

<link href="${pageContext.request.contextPath }/resources/assets/css/project_Css/project.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-WK8VrW20YdO7VrnJFTQo0iFZeqanIayEs/EzjpPYUp3vvSK1j01wGATIifvlYCh0dKazFGPb+pulzU6C1U6I1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
.page-content{
	margin-left: 15%;
	width: 75%;
}
#icon_id{
	display: none;
}
#sa-success{
	display: none;
}
.input-group-text i.fa {
  font-size: 20px;
}
 /* 스타일링 */
      body {
        font-family: Arial, sans-serif;
      }
      h1 {
        text-align: center;
      }
      ul {
        list-style: none;
        padding: 0;
        margin: 0;
      }
      li {
        margin-bottom: 10px;
      }
      label {
        display: block;
        font-weight: bold;
      }
      input[type="radio"] {
        margin-right: 5px;
      }
      input[type="submit"] {
        display: block;
        margin-top: 10px;
      }
</style>
  <head>
    <title>투표 View 페이지</title>
  </head>
  <body>
    <h1>어떤 영화가 좋았나요?</h1>
    <form method="post" action="/vote">
      <ul>
        <li>
          <label>
            <input type="radio" name="movie" value="titanic" />
            타이타닉
          </label>
        </li>
        <li>
          <label>
            <input type="radio" name="movie" value="avatar" />
            아바타
          </label>
        </li>
        <li>
          <label>
            <input type="radio" name="movie" value="inception" />
            인셉션
          </label>
        </li>
      </ul>
      <input type="submit" value="투표" />
    </form>
  </body>
</html>
