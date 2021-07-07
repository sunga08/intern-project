<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		
            .mt-4-1{
            	margin-bottom: 1rem;
            }
            
            .pagination, .dataTable-pagination ul{
            	padding-left: 730px;
            }
            
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
                        <div style="float:right;" class="mt-4-1"><button class="btn btn-primary">글쓰기</button></div>
                        <div id="board">
                        	<!-- <table class="table table-hover table-striped text-center" style="border: 1px solid;">
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
                        			<tr>
                        				<td>2</td>
                        				<td>Title2</td>
                        				<td>User2</td>
                        				<td>2021-07-18</td>
                        				<td>20</td>
                        			</tr>
                        		</tbody>
                        	
                        	</table>
                        	<hr/>
                        	
                        
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
							</div>-->
                        
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
			getBoardData();
         });
        
        
        function goLecturePage(){
        	var lecId = "${groupInfo.lecId}";
        	let html='';
        	html+='<li class="breadcrumb-item active">스터디 진행중인 강의: <a href="<c:url value="/view/detail?courseId='+encodeURIComponent(lecId)+'"/>" style="text-decoration: none; color: #fb8836;">${groupInfo.lecName}</a></li>'
        	$("#lectureName").append(html);
        }
        
        function getBoardData(){
        	var groupId = "${groupInfo.groupId}";
        	$.ajax({
                url: "/studyboard/"+groupId,
                type: "GET",
                contentType: "application/json; charset=utf-8;",
                dataType: "json",
                success: function(response){

                    console.log(response);

                    
                    let html = '';
                    
                    html += '<table class="table table-hover table-striped text-center" style="border: 1px solid;">';
            		html += '<thead>';
            		html += '<tr>';
                	html += '<th>번호</th>';
                	html += '<th>제목</th>';
                	html += '<th>글쓴이</th>';
                	html += '<th>작성일</th>';
                	html += '<th>조회수</th>';
                	html += '</tr>';
            		html += '</thead>';
            		html += '<tbody>';
            		
            		var i = 1;
                    $.each(response, function(index, obj){
                    	console.log(obj)
                    	
                    	let dateObj = new Date(obj.regDtm);
                    	let timeString_KR = dateObj.toLocaleString("ko-KR", {timeZone: "Asia/Seoul"});
                    	
                    	html += '<tr>';
        				html += '<td>'+i+'</td>';
        				html += '<td>'+obj.title+'</td>';
        				html += '<td>'+obj.userId+'</td>';
        				html += '<td>'+timeString_KR.substring(0,11)+'</td>';
        				html += '<td>'+obj.viewCnt+'</td>';
        				html += '</tr>';
        				i=i+1;
                    })
                    
                    html += '</tbody>';
                        	
                    html += '</table>';
                    html += '<hr/> <div class="pagination-div">';
					html += '<ul class="pagination">';
					html += '<li class="page-item disabled">';
					html += '<a class="page-link" href="#">&laquo;</a>';
					html += '</li> <li class="page-item active">';
					html += '<a class="page-link" href="#">1</a>';
					html += '</li> <li class="page-item">';
					html += '<a class="page-link" href="#">2</a>';
					html += '</li> <li class="page-item">';
					html += '<a class="page-link" href="#">3</a>';
					html += '</li> <li class="page-item">';
					html += '<a class="page-link" href="#">4</a>';
					html += '</li> <li class="page-item">';
					html += '<a class="page-link" href="#">5</a>';
					html += '</li> <li class="page-item">';
					html += '<a class="page-link" href="#">&raquo;</a>';
					html += '</li> </ul> </div>';
					
                    console.log("html")
                    console.log(html)
                    $("#board").append(html)

                },
                error: function(){
                    alert("err");
                }
            });    	
        }


		</script>
        
    </body>
</html>