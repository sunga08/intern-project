<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>K-STUDY</title>

<style>
	.text-style-1{
  		font-size: 14px;
  		text-align: center;
  	}
  
  	.text-style-2{
  		font-size: 12px;
  		text-align: center;
  	}
  	
  	.container{
  		position:relative;
  	}
  	.pagination-div{
  		position: absolute;
  		left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
  	}
</style>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">K-STUDY</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="<c:url value='/main'/>">Home</a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="#!">My Page</a></li> -->
					<!--<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">All Products</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!">Popular Items</a></li>
							<li><a class="dropdown-item" href="#!">New Arrivals</a></li>
						</ul></li>-->
				</ul>
				
				<form class="d-flex">
	   				 <div style="margin-left: 10px auto; margin-bottom: 10px; height: 20px;" class="form-floating">
	      				<input type="text" id="userId" placeholder="ID" name="userId" required>
	    			</div>	
				</form>
					<button class="btn btn-primary btn-sm" onclick="login()">로그인</button>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">K-STUDY</h1>
				<p class="lead fw-normal text-white-50 mb-0">K-MOOC 온라인 스터디 웹 사이트</p>
			</div>
		</div>
	</header>

	<!-- Menu Bar -->	
	<div class="bs-docs-section clearfix">
        <div class="row"> <!-- padding-top 수정 -->
          <div class="col-lg-13">
            <div class="bs-component">
              <nav class="navbar navbar-expand-lg navbar-dark bg-primary2">
                <div class="container-fluid">
                  <a class="navbar-brand">전체강의</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>

                  <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav me-auto">
                      
                      <!--<li class="nav-item">
                        <a class="nav-link active" href="#">인문
                          <span class="visually-hidden">(current)</span>
                        </a>
                      </li> -->
                      
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">인문</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('언어ㆍ문학')">언어/문학</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('인문과학')">인문과학</a>
                          <!-- <div class="dropdown-divider"></div> -->
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">사회</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('경영ㆍ경제')">경영/경제</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('법률')">법률</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('사회')">사회</a>
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">공학</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('건축')">건축</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('토목ㆍ도시')">토목/도시</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('교통ㆍ운송')">교통/운송</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('기계ㆍ금속')">기계/금속</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('전기ㆍ전자')">전기/전자</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('정밀ㆍ에너지')">정밀/에너지</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('소재ㆍ재료')">소재/재료</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('컴퓨터ㆍ통신')">컴퓨터/통신</a>
                       
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">자연</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('농림ㆍ수산')">농림/수산</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('생물ㆍ화학ㆍ환경')">생물/화학/환경</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('생활과학')">생활과학</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('수학ㆍ물리ㆍ천문ㆍ지리')">수학/물리/천문/지리</a>
                          
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">교육</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('중등교육')">중등교육</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('교육일반')">교육일반</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('유아교육')">유아교육</a>
                          
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">의약</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('의료')">의료</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('간호')">간호</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="CategoryData('약학')">약학</a>
                         
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">예체능</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item design" href='javascript:void(0);' onclick="CategoryData('디자인')">디자인</a>
                          <a class="dropdown-item art" href='javascript:void(0);' onclick="CategoryData('응용예술')">응용예술</a>
                          <a class="dropdown-item ath" href='javascript:void(0);' onclick="CategoryData('무용ㆍ체육')">무용/체육</a>
                          
                        </div>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href='javascript:void(0);' onclick="CategoryData('기타')">기타
                        </a>
                      </li>
                    </ul>
                    <form class="d-flex">
                      <input class="form-control me-sm-2" type="text" placeholder="검색어 입력">
                      <button class="btn btn-secondary my-2 my-sm-0" id="searchKeyword" type="button" onclick="SearchData()">search</button>
                    </form>
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
	
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				id="list" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">				
			</div>
			
			<div class=container>
			<div class="pagination-div">
			  	<ul class="pagination">
				    <li class="page-item disabled">
				      <a class="page-link" href="#">&laquo;</a>
				    </li>
				    <li class="page-item active">
				      <a class="page-link" href="#">1</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">2</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">3</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">4</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">5</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">&raquo;</a>
				    </li>
			  	</ul>
			</div>
			</div>
			
		</div>
	</section>
	
	
	
	
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; 웅진 씽크빅 IT개발실
				2021</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
	<script type="text/javascript">
    $(document).ready(function(){
    	//test();
    	getLecture();
    	//$("#dropdown-item-design").text();
    	
    });
    
    
    /*var a = document.querySelector(".dropdown-item-design");
    
    a.addEventListener('click', event => {
		console.log(event.innerHTML)
	});*/
    
    var elem = document.getElementsByClassName("dropdown-item design");
    console.log(elem.item(0));
    
    
    function getLecture () {

    	$.ajax({
            url: "/lecture",
            type: "GET",
            contentType: "application/json; charset=utf-8;",
            dataType: "json",
            success: function(data){
                console.log(data);
                
                let html = '';
                $.each(data, function(index, obj){
                	console.log(obj)
                	
                	
                	html += '<div class="col mb-5">';
                	html += '<div class="card h-100">';
                	html += '<img class="card-img-top" src="'+obj.image+'" alt="..." />';
                	html += '<div class="card-body p-4">';
                	html += '<div class="text-center">';
                	html += '<h5 class="fw-bolder">';
                	html += obj.lecName;
                	html += '</h5>';
                	html += '['+obj.orgName+']';
                	html += '</div>';
                	html += '<p></p>';
                	html += '<p class="text-style-1">';
                	html += obj.teachers;
                	html += '</p>'
                	html += '<p class="text-style-1">등록기간<br/>';
                	html += obj.enrollStart.substring(0,10)+'~'+obj.enrollEnd.substring(0,10);
                	html += '</p>';
                	html += '<p class="text-style-1">진행중인 스터디: &nbsp;'+countGroup(encodeURIComponent(obj.lecId))+'개';
                	html += '</div>';
						
                	html += '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
                	html += '<div class="text-center">';
                	html += '<a class="btn btn-outline-dark mt-auto" href="<c:url value="/view/detail?courseId='+encodeURIComponent(obj.lecId)+'"/>">';
                	html += '자세히 보기</a>';
                	html += '</div>';
                	html += '</div>';
                	html += '</div>';	
                	html += '</div>';
                })
                console.log("html")
                console.log(html)
                $("#list").append(html)
            },
            error: function(){
                alert("err");
            }
        });
    }
	
    function test () {

    	var form = {
                page : 1
        }
    	
    	$.ajax({
            url: "getData",
            type: "POST",
            data: JSON.stringify(form),
            contentType: "application/json; charset=utf-8;",
            async: false,
            dataType: "json",
            success: function(data){
                console.log(data.results);
                
                let html = '';
                $.each(data.results, function(index, obj){
                	console.log(obj)
                	
                	
                	html += '<div class="col mb-5">';
                	html += '<div class="card h-100">';
                	html += '<img class="card-img-top" src="'+obj.media.image.small+'" alt="..." />';
                	html += '<div class="card-body p-4">';
                	html += '<div class="text-center">';
                	html += '<h5 class="fw-bolder">';
                	html += obj.name;
                	html += '</h5>';
                	html += '['+obj.org_name+']';
                	html += '</div>';
                	html += '<p></p>';
                	html += '<p class="text-style-1">';
                	html += obj.teachers;
                	html += '</p>'
                	html += '<p class="text-style-1">등록기간<br/>';
                	html += obj.enrollment_start.substring(0,10)+'~'+obj.enrollment_end.substring(0,10);
                	html += '</p>';
                	html += '</div>';
						
                	html += '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
                	html += '<div class="text-center">';
                	html += '<a class="btn btn-outline-dark mt-auto" href="<c:url value="/view/detail?courseId='+encodeURIComponent(obj.id)+'"/>">';
                	html += '자세히 보기</a>';
                	html += '</div>';
                	html += '</div>';
                	html += '</div>';	
                	html += '</div>';
                })
                console.log("html")
                console.log(html)
                $("#list").append(html)
            },
            error: function(){
                alert("err");
            }
        });
    	
    	var form2 = {
                page : 2
        }
    	
    	$.ajax({
            url: "getData",
            type: "POST",
            data: JSON.stringify(form2),
            contentType: "application/json; charset=utf-8;",
            async: false,
            dataType: "json",
            success: function(data){
                console.log(data.results);
                
                let html = '';
                $.each(data.results, function(index, obj){
                	console.log(obj)
                	
                	
                	html += '<div class="col mb-5">';
                	html += '<div class="card h-100">';
                	html += '<img class="card-img-top" src="'+obj.media.image.small+'" alt="..." />';
                	html += '<div class="card-body p-4">';
                	html += '<div class="text-center">';
                	html += '<h5 class="fw-bolder">';
                	html += obj.name;
                	html += '</h5>';                	
                	html += '['+obj.org_name+']';
                	html += '</div>';
                	html += '<p></p>';
                	html += '<p class="text-style-1">';
                	html += obj.teachers;
                	html += '</p>'
                	html += '<p class="text-style-1">등록기간<br/>';
                	html += obj.enrollment_start.substring(0,10)+'~'+obj.enrollment_end.substring(0,10);
                	html += '</p>';
                	html += '</div>';
						
                	html += '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
                	html += '<div class="text-center">';
                	html += '<a class="btn btn-outline-dark mt-auto" href="<c:url value="/view/detail?courseId='+encodeURIComponent(obj.id)+'"/>">';
                	html += '자세히 보기</a>';
                	html += '</div>';
                	html += '</div>';
                	html += '</div>';
                	html += '</div>';
                })
                console.log("html")
                console.log(html)
                $("#list").append(html)
            },
            error: function(){
                alert("err");
            }
        });
    }
    
    function CategoryData(category) {
		console.log(category);
		
		
		$("#list").empty()
		
    	$.ajax({
            url: "lecture/"+category,
            type: "GET",
            contentType: "application/json; charset=utf-8;",
            dataType: "json",
            success: function(response){

                console.log(response);

                
                let html = '';
                $.each(response, function(index, obj){
                	console.log(obj)
                	
                	
                	html += '<div class="col mb-5">';
                	html += '<div class="card h-100">';
                	html += '<img class="card-img-top" src="'+obj.image+'" alt="..." />';
                	html += '<div class="card-body p-4">';
                	html += '<div class="text-center">';
                	html += '<h5 class="fw-bolder">';
                	html += obj.lecName;
                	html += '</h5>';                	
                	html += '['+obj.orgName+']';
                	html += '</div>';
                	html += '<p></p>';
                	html += '<p class="text-style-1">';
                	html += obj.teachers;
                	html += '</p>'
                	html += '<p class="text-style-1">등록기간<br/>';
                	html += obj.enrollStart.substring(0,10)+'~'+obj.enrollEnd.substring(0,10);
                	html += '</p>';
                	html += '<p class="text-style-1">진행중인 스터디: &nbsp;'+countGroup(encodeURIComponent(obj.lecId))+'개';
                	
                	html += '</p>';
                	html += '</div>';
						
                	html += '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
                	html += '<div class="text-center">';
                	html += '<a class="btn btn-outline-dark mt-auto" href="<c:url value="/view/detail?courseId='+encodeURIComponent(obj.lecId)+'"/>">';
                	html += '자세히 보기</a>';
                	html += '</div>';
                	html += '</div>';
                	html += '</div>';
                	html += '</div>';
                })
                console.log("html")
                console.log(html)
                $("#list").append(html)

            },
            error: function(){
                alert("err");
            }
        });    		
    	
    }
    
    function countGroup(lecId){
    	var cnt;
    	
    	$.ajax({
            url: "/lecture/groupcount/"+lecId,
            type: "GET",       
            async: false,
            dataType: "json",
            success: function(response){

                //console.log(response);
				cnt = response;

            },
            error: function(){
                alert("err");
            }
        });
    	
    	
    	console.log(cnt);
    	return cnt;
    }
    
    function SearchData() {
		
		let keyword = document.querySelector(".form-control.me-sm-2").value;
		console.log(keyword);
		
		$("#list").empty()
		
    	$.ajax({
            url: "lecture/search/"+keyword,
            type: "GET",       
            contentType: "application/json; charset=utf-8;",
            dataType: "json",
            success: function(response){

                console.log(response);

                
                let html = '';
                $.each(response, function(index, obj){
                	console.log(obj)
                	
                	
                	html += '<div class="col mb-5">';
                	html += '<div class="card h-100">';
                	html += '<img class="card-img-top" src="'+obj.image+'" alt="..." />';
                	html += '<div class="card-body p-4">';
                	html += '<div class="text-center">';
                	html += '<h5 class="fw-bolder">';
                	html += obj.lecName;
                	html += '</h5>';                	
                	html += '['+obj.orgName+']';
                	html += '</div>';
                	html += '<p></p>';
                	html += '<p class="text-style-1">';
                	html += obj.teachers;
                	html += '</p>';
                	html += '<p class="text-style-1">등록기간<br/>';
                	html += obj.enrollStart.substring(0,10)+'~'+obj.enrollEnd.substring(0,10);
                	html += '</p>';
                	html += '</div>';
						
                	html += '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
                	html += '<div class="text-center">';
                	html += '<a class="btn btn-outline-dark mt-auto" href="<c:url value="/view/detail?courseId='+encodeURIComponent(obj.lecId)+'"/>">';
                	html += '자세히 보기</a>';
                	html += '</div>';
                	html += '</div>';
                	html += '</div>';
                	html += '</div>';
                })
                console.log("html")
                console.log(html)
                $("#list").append(html)

            },
            error: function(){
                alert("err");
            }
        });

    }
    
    function sendData(){

    	  $.ajax({
    	    url: "detail/course-v1:ACRCEDU+ACRC01+2019_01",
    	    type: "POST",
    	    success : function(){
    	      console.log("성공")
    	    },
    	    error : function(){
    	      alert("에러")		
    	    }
    	  });
    	}
    
    function login(){
    	const name = document.getElementById('userId').value;
		
    	$.ajax({
    	    url: "/login/"+name,
    	    type: "GET",
    	    async: false,
    	    contentType: "application/json; charset=utf-8;",
    	    success : function(response){
    	    	
    	    	if(response==1){
    	    		
	    	      alert("로그인 성공");
	    	      window.location="/main";
    	    	}
	    	    else{
	    	    	
	    	    	alert("가입된 회원이 아닙니다.");
	    	    	window.location="/main";

	    	    }
	    	    	
    	    },
    	    error : function(){
    	      alert("에러")		
    	    }
    	  });
    	
    	
    }
    

</script>
</body>
</html>
