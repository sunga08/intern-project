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
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> 
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
  	video{
  		width: 100%;
  		height: 300px;
  		object-fit: cover;
  	}
</style>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
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
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="<c:url value='/main'/>">Home</a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="#!">My Page</a></li> -->
				
				</ul>
				
				<div id="login">
					<div id="naver_id_login" style="text-align:center">
					<c:choose>
						<c:when test="${user_id!=null}">
							<h5>${nickname}님 환영합니다! &nbsp;<a href="/logouts"> 로그아웃</a></h5>
							
						</c:when>
						<c:otherwise>
							<a href="${url}">
							<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
						</c:otherwise>					
					</c:choose>
					</div>
					<!-- <form class="d-flex">

		   				 <div style="margin-left: 10px auto; margin-bottom: 10px; height: 20px;" class="form-floating">
		      				<input type="text" id="userId" placeholder="ID" name="userId" required>
		    			</div>	
						<button class="btn btn-primary btn-sm" onclick="login()">로그인</button>
					</form> -->
				</div>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<!-- <header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">K-STUDY</h1>
	
				<p class="lead fw-normal text-white-50 mb-0">K-MOOC 온라인 스터디 웹 사이트</p>
			</div>
		</div>
	</header> -->
	<video src="/Kstudy2.mp4" muted autoplay></video>

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
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('언어ㆍ문학')">언어/문학</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('인문과학')">인문과학</a>
                          <!-- <div class="dropdown-divider"></div> -->
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">사회</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('경영ㆍ경제')">경영/경제</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('법률')">법률</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('사회과학')">사회과학</a>
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">공학</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('건축')">건축</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('토목ㆍ도시')">토목/도시</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('교통ㆍ운송')">교통/운송</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('기계ㆍ금속')">기계/금속</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('전기ㆍ전자')">전기/전자</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('정밀ㆍ에너지')">정밀/에너지</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('소재ㆍ재료')">소재/재료</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('컴퓨터ㆍ통신')">컴퓨터/통신</a>
                       
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">자연</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('농림ㆍ수산')">농림/수산</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('생물ㆍ화학ㆍ환경')">생물/화학/환경</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('생활과학')">생활과학</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('수학ㆍ물리ㆍ천문ㆍ지리')">수학/물리/천문/지리</a>
                          
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">교육</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('중등교육')">중등교육</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('교육일반')">교육일반</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('유아교육')">유아교육</a>
                          
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">의약</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('의료')">의료</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('간호')">간호</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('약학')">약학</a>
                         
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">예체능</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item design" href='javascript:void(0);' onclick="setCategory('디자인')">디자인</a>
                          <a class="dropdown-item art" href='javascript:void(0);' onclick="setCategory('응용예술')">응용예술</a>
                          <a class="dropdown-item ath" href='javascript:void(0);' onclick="setCategory('무용ㆍ체육')">무용/체육</a>
                          
                        </div>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href='javascript:void(0);' onclick="setCategory('기타')">기타
                        </a>
                      </li>
                    </ul>
                    <form class="d-flex">
                      <input class="form-control me-sm-2" type="text" placeholder="검색어 입력">
                      <button class="btn btn-secondary my-2 my-sm-0" id="searchKeyword" type="button" onclick="setSearchData()">search</button>
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
			<div id="list" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">				
			</div>
			
			<div class=container>
				<div id="pagination" class="pagination-div">
				  	<!-- <ul class="pagination">
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
				  	</ul>-->
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
	<script src="/js/scripts.js"></script>
	<script type="text/javascript">
	
	let totalData; //총 데이터 수
    let dataPerPage = 12; //한 페이지에 나타낼 글 수
    let pageCount = 10; //페이징에 나타낼 페이지 수
    let globalCurrentPage=1; //현재 페이지
    
    let globalCategory;
    let globalKeyword;
    
    let userId;
    let nickname;
   	
    $(document).ready(function(){
    	nickname = "${nickname}";

	   	/* if(nickname.length>0){
	   		$("#login").empty();
	      	html='';
	      	html+='<div class="d-flex"><h3>'+nickname+'님 환영합니다! &nbsp;</h3>';
	      	html+='<button class="btn btn-primary btn-sm" onclick="logout()">로그아웃</button></div>';
	      	$("#login").append(html);
	   	} */
    	getLecturePaging(1);
    	totalData = countAllLecture();
		pagination(totalData, dataPerPage, pageCount, 1, "main");
    });
    
    
    //전체 강좌 개수
    function countAllLecture(){
		var cnt;
    	
    	$.ajax({
            url: "/lecture/count",
            type: "GET",       
            async: false,
            dataType: "json",
            success: function(response){

				cnt = response;

            },
            error: function(){
                alert("err");
            }
        });
    	   	
    	console.log("lec cnt:"+cnt);
    	return cnt;
	}
	
    //카테고리별 강좌 개수
	function countCategoryLecture(category){
		var cnt;
    	
    	$.ajax({
            url: "/lecture/count/"+category,
            type: "GET",       
            async: false,
            dataType: "json",
            success: function(response){

				cnt = response;

            },
            error: function(){
                alert("err");
            }
        });
    	   	
    	console.log("category lec cnt:"+cnt);
    	return cnt;
	}
	
    //검색 결과 강좌 개수
	function countSearchLecture(keyword){
		var cnt;
    	
    	$.ajax({
            url: "/search/count/"+keyword,
            type: "GET",       
            async: false,
            dataType: "json",
            success: function(response){

				cnt = response;

            },
            error: function(){
                alert("err");
            }
        });
    	   	
    	console.log("search lec cnt:"+cnt);
    	return cnt;
	}
    
    /* function getLecture () {
		
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
    } */
    
	function getLecturePaging (page) {
		
		$("#list").empty()
		
    	$.ajax({
            url: "/lecture/"+page,
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
	
	
	function setCategory(category){
    	globalCategory=category;
    	getCategoryData(category,1);
    	
    	totalData = countCategoryLecture(category);
		pagination(totalData, dataPerPage, pageCount, 1, "category");
		
    }
    
    function getCategoryData(category, page) {
		console.log(category);
		
		
		$("#list").empty()
		
    	$.ajax({
            url: "/lecture/"+category+"/"+page,
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
                	html += '<p class="text-style-1">진행중인 스터디: &nbsp;'+countGroup(encodeURIComponent(obj.lecId))+'개</p>';                	
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
    
    function setSearchData(){
    	globalKeyword=document.querySelector(".form-control.me-sm-2").value;
    	getSearchData(globalKeyword,1);
    	totalData = countSearchLecture(globalKeyword);
		pagination(totalData, dataPerPage, pageCount, 1, "search");
    }
    
    
	function getSearchData(keyword, page) {
		
		//let keyword = document.querySelector(".form-control.me-sm-2").value;
		console.log(keyword);
		
		$("#list").empty()
		
    	$.ajax({
            url: "/lecture/search/"+keyword+"/"+page,
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
                	html += '<p class="text-style-1">진행중인 스터디: &nbsp;'+countGroup(encodeURIComponent(obj.lecId))+'개</p>';
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
	
    function pagination(totalData, dataPerPage, pageCount, currentPage, option){
	  	let html='';
	  	        	       	
	  	totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수

	  	
	   	  if(totalPage<pageCount){ //전체페이지 수<페이징에 나타낼 페이지 수
	   	    pageCount=totalPage; //페이징에 나타낼 페이지 수 = 전체페이지 수
	   	  }
	   	  
	   	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹 (현재페이지/페이징에 나타낼 페이지 수) = 1(1~5), 2(6~10)...
	   	  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	   	  
	   	  
	   	  if (last > totalPage) {
	   	    last = totalPage;
	   	  }
	
	   	  let first = (pageGroup-1)*pageCount+1; //화면에 보여질 첫번째 페이지 번호
	   	  let next = last + 1;
	   	  let prev = first - 1;
	
	   	  let pageHtml = "";
	   	  
	   	  pageHtml += '<ul class="pagination">';
	
	   	  if (prev > 0) {
	   	    pageHtml += "<li class='page-item'><a class='page-link' id='prev' href='#'>&laquo;</a></li>";
	   	  }
	
	   	 //페이징 번호 표시 
	   	  for (var i = first; i <= last; i++) {
	   	    if (currentPage == i) {
	   	      pageHtml +=
	   	        "<li class='page-item active'><a class='page-link' href='#' id='" + i + "'>" + i + "</a></li>";
	   	    } else {
	   	      pageHtml += "<li class='page-item'><a class='page-link' href='#' id='" + i + "'>" + i + "</a></li>";
	   	    }
	   	  }
	
	   	  if (last < totalPage) {
	   	    pageHtml += "<li class='page-item'><a class='page-link' href='#' id='next'>&raquo;</a></li>";
	   	  }
	   	  
	   	  pageHtml += '</ul>';
	
	   	  $("#pagination").html(pageHtml);
	    	
	       	$("#pagination li a").click(function () {
	       	    let $id = $(this).attr("id");
	       	    selectedPage = $(this).text();
	
	       	    if ($id == "next") selectedPage = next;
	       	    if ($id == "prev") selectedPage = prev;
	       	    
	       	    //전역변수에 선택한 페이지 번호를 담는다...
	       	    globalCurrentPage = selectedPage;
	       	    console.log("selectedPage "+selectedPage);

       	    	//페이징 표시 재호출
	       	    if(option=="main"){
	       	   		pagination(totalData, dataPerPage, pageCount, selectedPage, "main");
		       	    getLecturePaging(selectedPage);
	       	    }
	       	    else if(option=="category"){
	       	    	pagination(totalData, dataPerPage, pageCount, selectedPage, "category");
		       	    getCategoryData(globalCategory, selectedPage);
	       	    }
	       	    else if(option=="search"){
	       	    	pagination(totalData, dataPerPage, pageCount, selectedPage, "search");
		       	    getSearchData(globalKeyword, selectedPage);
	       	    }
	       	    
	       	  });
       	

    }
    
	//강좌별 스터디 개수
    function countGroup(lecId){
    	var cnt;
    	
    	$.ajax({
            url: "/lecture/groupcount/"+lecId,
            type: "GET",       
            async: false,
            dataType: "json",
            success: function(response){
				cnt = response;

            },
            error: function(){
                alert("err");
            }
        });
    	
    	
    	console.log(cnt);
    	return cnt;
    }
    
    //DB에 있는 사용자인지 체크
    /* function login(){
    	userId = document.getElementById('userId').value;

    	$.ajax({
    	    url: "/login/"+userId,
    	    type: "GET",
    	    async: false,
    	    contentType: "application/json; charset=utf-8;",
    	    success : function(response){
    	    	
    	    	if(response==1){
	    	      	$("#login").empty();
	    	      	html='';
	    	      	html+='<div class="d-flex"><h5>'+userId+'님 환영합니다! &nbsp;</h5>';
	    	      	html+='<button class="btn btn-primary btn-sm" onclick="logout()">로그아웃</button></div>';
	    	      	$("#login").append(html);
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
    } */
    
    function logout(){
    	$.ajax({
    	    url: "/logout",
    	    type: "GET",
    	    contentType: "application/json; charset=utf-8;",
    	    success : function(response){
	    		window.location="/main";	    	    
    	    },
    	    error : function(){
    	      alert("로그아웃 에러")		
    	    }
    	  });
    }
    

</script>
</body>
</html>
