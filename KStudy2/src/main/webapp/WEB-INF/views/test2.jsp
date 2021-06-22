<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MyBatis 테스트</title>
</head>
<body>
	<!-- Navigation -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		  <div class="container">
		    <a class="navbar-brand" href="#">
		          <img src="http://placehold.it/150x50?text=Logo" alt="">
		        </a>
		    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		          <span class="navbar-toggler-icon"></span>
		        </button>
		    <div class="collapse navbar-collapse" id="navbarResponsive">
		      <ul class="navbar-nav ml-auto">
		        <li class="nav-item active">
		          <a class="nav-link" href="#">Home
		          	<span class="sr-only">(current)</span>
		          </a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">About</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">Services</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">Contact</a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		
		<!-- Page Content -->
		<div class="container">
		  <h1 class="mt-4">Logo Nav by Start Bootstrap</h1>

		    <table class="table table-hover table table-striped">
		        <tr>
		            <th>이름</th>
		            <th>비밀번호</th>
		            <th>카운트</th>
		        </tr>
		
		        <c:forEach items="${list}" var="post">
		            <tr>
		                <th>${post.userId} </th>
		                <th>${post.userPw}</th>
		                <th>${cnt}</th>
		            </tr>
		        </c:forEach>
		       
		    </table>
		</div>
</body>

<script src="<c:url value='/libs/jquery-3.4.1.slim.min.js'/>"></script>
<script src="<c:url value='/libs/bootstrap-4.4.1-dist/js/bootstrap.min.js'/>"></script>

<!-- CDN이용 
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
-->
</html>