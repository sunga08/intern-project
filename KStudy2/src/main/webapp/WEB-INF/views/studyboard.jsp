<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>K-Group</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="/css/styles2.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        
        <link href='/css/main.css' rel='stylesheet' />
		<script src='/js/main.js'></script>
		
		<style>
            
   		</style>
		
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="<c:url value='/main'/>">K-STDUY</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>

        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav" style="width: 300px;">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading"></div>
                            <a class="nav-link" href="<c:url value='/view/info/${groupInfo.groupId}'/>">
                                <!-- <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>-->
                                <font size=5>스터디 정보</font>
                            </a>
                            <a class="nav-link" href="<c:url value='/view/schedule/${groupInfo.groupId}'/>">
                                <font size=5>일정 관리</font>
                            </a>
                            <a class="nav-link" href="<c:url value='/view/studyboard/${groupInfo.groupId}'/>">
                                <font size=5>자유 게시판</font>
                            </a>
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Copyright &copy;</div>
                        웅진 씽크빅 IT 개발실
                    </div>
                </nav>
            </div>
            
            
            <!-- 메인 내용 -->
            <div id="layoutSidenav_content" style="padding-left:300px">
                <main>
                    <div class="container-fluid px-4">       
                        <div style="padding-bottom:80px;">           
	                        <div style="float:left;"><h1 class="mt-4">${groupInfo.groupName}</h1></div>
	                    </div>
                        <ol id="lectureName" class="breadcrumb mb-4">

                        </ol>
                        <hr>
                        
                        <div id="board">
                        	<table class="table table-hover table-striped text-center" style="border: 1px solid;">
                        		<thead>
                        			<tr>
	                        			<th>번호</th>
	                        			<th>제목</th>
	                        			<th>글쓴이</th>
	                        			<th>작성일</th>
	                        			<th>조회수</th>
	                        		</tr>
                        		</thead>
                        		<tbody>
                        			<tr>
                        				<td>1</td>
                        				<td>Title1</td>
                        				<td>User1</td>
                        				<td>2021-07-18</td>
                        				<td>10</td>
                        			</tr>
                        		</tbody>
                        	
                        	</table>
                        	<hr/>
                        	<div style="float:right;" class="mt-4"><button class="btn btn-primary">글쓰기</button></div>
                        
	                        <div class="text-center">
	                        	<ul class="pagination">
	                        		<li><a href="#">1</a></li>
	                        		<li><a href="#">2</a></li>
	                        		<li><a href="#">3</a></li>
	                        		<li><a href="#">4</a></li>
	                        		<li><a href="#">5</a></li>
	                        	</ul>
	                        </div>
                        
                        </div>
                        
                        
                    </div>
                </main>
                
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; 웅진 씽크빅 IT 개발실</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts2.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/assets/demo/chart-area-demo.js"></script>
        <script src="/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/datatables-simple-demo.js"></script>
        <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
		<script src="https://unpkg.com/tippy.js@6"></script>
		
        <script type="text/javascript">


        $(document).ready(function(){
			goLecturePage();
         });
        
        
        function goLecturePage(){
        	var lecId = "${groupInfo.lecId}";
        	let html='';
        	html+='<li class="breadcrumb-item active">스터디 진행중인 강의: <a href="<c:url value="/view/detail?courseId='+encodeURIComponent(lecId)+'"/>" style="text-decoration: none; color: #fb8836;">${groupInfo.lecName}</a></li>'
        	$("#lectureName").append(html);
        }


		</script>
        
    </body>
</html>