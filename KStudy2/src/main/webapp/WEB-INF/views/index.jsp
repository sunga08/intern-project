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
							<h5>${nickname}�� ȯ���մϴ�! &nbsp;<a href="/logouts"> �α׾ƿ�</a></h5>
							
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
						<button class="btn btn-primary btn-sm" onclick="login()">�α���</button>
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
	
				<p class="lead fw-normal text-white-50 mb-0">K-MOOC �¶��� ���͵� �� ����Ʈ</p>
			</div>
		</div>
	</header> -->
	<video src="/Kstudy2.mp4" muted autoplay></video>

	<!-- Menu Bar -->	
	<div class="bs-docs-section clearfix">
        <div class="row"> <!-- padding-top ���� -->
          <div class="col-lg-13">
            <div class="bs-component">
              <nav class="navbar navbar-expand-lg navbar-dark bg-primary2">
                <div class="container-fluid">
                  <a class="navbar-brand">��ü����</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>

                  <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav me-auto">
                      
                      <!--<li class="nav-item">
                        <a class="nav-link active" href="#">�ι�
                          <span class="visually-hidden">(current)</span>
                        </a>
                      </li> -->
                      
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">�ι�</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('��������')">���/����</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('�ι�����')">�ι�����</a>
                          <!-- <div class="dropdown-divider"></div> -->
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">��ȸ</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('�濵������')">�濵/����</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('����')">����</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('��ȸ����')">��ȸ����</a>
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">����</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('����')">����</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('��������')">���/����</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('��������')">����/���</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('�����ݼ�')">���/�ݼ�</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('���������')">����/����</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('���Ф�������')">����/������</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('��������')">����/���</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('��ǻ�ͤ����')">��ǻ��/���</a>
                       
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">�ڿ�</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('�󸲤�����')">��/����</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('������ȭ�Ф�ȯ��')">����/ȭ��/ȯ��</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('��Ȱ����')">��Ȱ����</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('���Ф�������õ��������')">����/����/õ��/����</a>
                          
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">����</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('�ߵ��')">�ߵ��</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('�����Ϲ�')">�����Ϲ�</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('���Ʊ���')">���Ʊ���</a>
                          
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">�Ǿ�</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('�Ƿ�')">�Ƿ�</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('��ȣ')">��ȣ</a>
                          <a class="dropdown-item" href='javascript:void(0);' onclick="setCategory('����')">����</a>
                         
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">��ü��</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item design" href='javascript:void(0);' onclick="setCategory('������')">������</a>
                          <a class="dropdown-item art" href='javascript:void(0);' onclick="setCategory('���뿹��')">���뿹��</a>
                          <a class="dropdown-item ath" href='javascript:void(0);' onclick="setCategory('�����ü��')">����/ü��</a>
                          
                        </div>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href='javascript:void(0);' onclick="setCategory('��Ÿ')">��Ÿ
                        </a>
                      </li>
                    </ul>
                    <form class="d-flex">
                      <input class="form-control me-sm-2" type="text" placeholder="�˻��� �Է�">
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
			<p class="m-0 text-center text-white">Copyright &copy; ���� ��ũ�� IT���߽�
				2021</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
	<script type="text/javascript">
	
	let totalData; //�� ������ ��
    let dataPerPage = 12; //�� �������� ��Ÿ�� �� ��
    let pageCount = 10; //����¡�� ��Ÿ�� ������ ��
    let globalCurrentPage=1; //���� ������
    
    let globalCategory;
    let globalKeyword;
    
    let userId;
    let nickname;
   	
    $(document).ready(function(){
    	nickname = "${nickname}";

	   	/* if(nickname.length>0){
	   		$("#login").empty();
	      	html='';
	      	html+='<div class="d-flex"><h3>'+nickname+'�� ȯ���մϴ�! &nbsp;</h3>';
	      	html+='<button class="btn btn-primary btn-sm" onclick="logout()">�α׾ƿ�</button></div>';
	      	$("#login").append(html);
	   	} */
    	getLecturePaging(1);
    	totalData = countAllLecture();
		pagination(totalData, dataPerPage, pageCount, 1, "main");
    });
    
    
    //��ü ���� ����
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
	
    //ī�װ��� ���� ����
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
	
    //�˻� ��� ���� ����
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
                	html += '<p class="text-style-1">��ϱⰣ<br/>';
                	html += obj.enrollStart.substring(0,10)+'~'+obj.enrollEnd.substring(0,10);
                	html += '</p>';
                	html += '<p class="text-style-1">�������� ���͵�: &nbsp;'+countGroup(encodeURIComponent(obj.lecId))+'��';
                	html += '</div>';
						
                	html += '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
                	html += '<div class="text-center">';
                	html += '<a class="btn btn-outline-dark mt-auto" href="<c:url value="/view/detail?courseId='+encodeURIComponent(obj.lecId)+'"/>">';
                	html += '�ڼ��� ����</a>';
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
                	html += '<p class="text-style-1">��ϱⰣ<br/>';
                	html += obj.enrollStart.substring(0,10)+'~'+obj.enrollEnd.substring(0,10);
                	html += '</p>';
                	html += '<p class="text-style-1">�������� ���͵�: &nbsp;'+countGroup(encodeURIComponent(obj.lecId))+'��';
                	html += '</div>';
						
                	html += '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
                	html += '<div class="text-center">';
                	html += '<a class="btn btn-outline-dark mt-auto" href="<c:url value="/view/detail?courseId='+encodeURIComponent(obj.lecId)+'"/>">';
                	html += '�ڼ��� ����</a>';
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
                	html += '<p class="text-style-1">��ϱⰣ<br/>';
                	html += obj.enrollStart.substring(0,10)+'~'+obj.enrollEnd.substring(0,10);
                	html += '</p>';
                	html += '<p class="text-style-1">�������� ���͵�: &nbsp;'+countGroup(encodeURIComponent(obj.lecId))+'��</p>';                	
                	html += '</div>';
						
                	html += '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
                	html += '<div class="text-center">';
                	html += '<a class="btn btn-outline-dark mt-auto" href="<c:url value="/view/detail?courseId='+encodeURIComponent(obj.lecId)+'"/>">';
                	html += '�ڼ��� ����</a>';
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
                	html += '<p class="text-style-1">��ϱⰣ<br/>';
                	html += obj.enrollStart.substring(0,10)+'~'+obj.enrollEnd.substring(0,10);
                	html += '</p>';
                	html += '<p class="text-style-1">�������� ���͵�: &nbsp;'+countGroup(encodeURIComponent(obj.lecId))+'��</p>';
                	html += '</div>';
						
                	html += '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
                	html += '<div class="text-center">';
                	html += '<a class="btn btn-outline-dark mt-auto" href="<c:url value="/view/detail?courseId='+encodeURIComponent(obj.lecId)+'"/>">';
                	html += '�ڼ��� ����</a>';
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
	  	        	       	
	  	totalPage = Math.ceil(totalData / dataPerPage); //�� ������ ��

	  	
	   	  if(totalPage<pageCount){ //��ü������ ��<����¡�� ��Ÿ�� ������ ��
	   	    pageCount=totalPage; //����¡�� ��Ÿ�� ������ �� = ��ü������ ��
	   	  }
	   	  
	   	  let pageGroup = Math.ceil(currentPage / pageCount); // ������ �׷� (����������/����¡�� ��Ÿ�� ������ ��) = 1(1~5), 2(6~10)...
	   	  let last = pageGroup * pageCount; //ȭ�鿡 ������ ������ ������ ��ȣ
	   	  
	   	  
	   	  if (last > totalPage) {
	   	    last = totalPage;
	   	  }
	
	   	  let first = (pageGroup-1)*pageCount+1; //ȭ�鿡 ������ ù��° ������ ��ȣ
	   	  let next = last + 1;
	   	  let prev = first - 1;
	
	   	  let pageHtml = "";
	   	  
	   	  pageHtml += '<ul class="pagination">';
	
	   	  if (prev > 0) {
	   	    pageHtml += "<li class='page-item'><a class='page-link' id='prev' href='#'>&laquo;</a></li>";
	   	  }
	
	   	 //����¡ ��ȣ ǥ�� 
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
	       	    
	       	    //���������� ������ ������ ��ȣ�� ��´�...
	       	    globalCurrentPage = selectedPage;
	       	    console.log("selectedPage "+selectedPage);

       	    	//����¡ ǥ�� ��ȣ��
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
    
	//���º� ���͵� ����
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
    
    //DB�� �ִ� ��������� üũ
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
	    	      	html+='<div class="d-flex"><h5>'+userId+'�� ȯ���մϴ�! &nbsp;</h5>';
	    	      	html+='<button class="btn btn-primary btn-sm" onclick="logout()">�α׾ƿ�</button></div>';
	    	      	$("#login").append(html);
    	    	}
	    	    else{	    	    	
	    	    	alert("���Ե� ȸ���� �ƴմϴ�.");
	    	    	window.location="/main";
	    	    }
	    	    	
    	    },
    	    error : function(){
    	      alert("����")		
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
    	      alert("�α׾ƿ� ����")		
    	    }
    	  });
    }
    

</script>
</body>
</html>
