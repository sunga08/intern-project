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
		
            .mt-4-1{
            	margin-bottom: 1rem;
            }
            
            .pagination, .dataTable-pagination ul{
            	padding-left: 730px;
            }
            
            .tg  {border-collapse:collapse;border-spacing:0;}
			.tg td{border-style:solid;border-width:0px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;
			  padding:10px 5px;word-break:normal;}
			.tg th{border-style:solid;border-width:0px;font-family:Arial, sans-serif;font-size:14px;font-weight:normal;
			  overflow:hidden;padding:10px 5px;word-break:normal;}
			.tg .tg-uqo3{background-color:#efefef;text-align:center;vertical-align:top}
			.tg .tg-yj5y{background-color:#efefef;border-color:inherit;text-align:center;vertical-align:top}
			.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
			.tg .tg-0lax{text-align:left;vertical-align:top}
			
			.btn-red {
				color: #fff;
				background-color: #fe4c39;
				border-color: #fe4c39;
			}
				
			.btn-red:hover {
				color: #fff;
				background-color: #fe4c39;
				border-color: #0a58ca;
			}
			
			.btn-green {
				color: #fff;
				background-color: #06AC19;
				border-color: #06AC19;
			}
				
			.btn-green:hover {
				color: #fff;
				background-color: #06AC19;
				border-color: #0a58ca;
			}
			
			
            
   		</style>
		
    </head>
    <body class="sb-nav-fixed">
    <%       	
		request.setCharacterEncoding("UTF-8"); 
       	//String boardId = request.getParameter("boardId");
       	//String groupId = request.getParameter("groupId");
    %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="<c:url value='/main'/>">K-STUDY</a>
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
                        
                        
                        <h4></h4>
                        <hr>
                        <div style="float:left;" class="mt-4-1"><button class="btn btn-primary" onclick="location.href='/view/studyboard/${groupInfo.groupId}'">목록보기</button></div>
                        <div id="board">
                        
                        	<table id="datatable-scroller" class="table table-bordered tbl_Form">

							<tbody>
							  <tr>
							    <th class="tg-yj5y" width=250px>제목</th>
							    <td class="tg-0pky">${post.title}</td>
							    <th class="tg-uqo3" width=250px>작성일</th>
							    <td class="tg-0lax">${post.regDtm}</td>
							  </tr>
							
							
							  <tr>
							    <th class="tg-yj5y">작성자</th>
							    <td class="tg-0pky">${post.userId}</td>
							    <th class="tg-uqo3">조회수</th>
							    <td class="tg-0lax">${post.viewCnt}</td>
							  </tr>
							  <tr>
							    <th class="tg-yj5y">내용</th>
							    <td class="tg-0pky" colspan="3"><pre>${post.content}</pre></td>
							  </tr>
							</tbody>
						</table>
                        
                        </div>
                        
                        
	                    <div style="float:right;" class="mt-4-1"><button class="btn btn-red" onclick="deletePost()">삭제</button></div>
	                    <div style="float:right; margin-right:10px;" class="mt-4-1"><button class="btn btn-green" onclick="updatePost()">수정</button></div>
                    </div>

                    
                </main>

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
        	html+='<li class="breadcrumb-item active">스터디 진행중인 강의: <a href="<c:url value="/view/detail?courseId='+encodeURIComponent(lecId)+'"/>" style="text-decoration: none; color: #fb8836;">${groupInfo.lecName}</a></li>';
        	$("#lectureName").append(html);
        }
        
        function deletePost(){
        	var boardId="${post.boardId}";
        	var groupId="${groupInfo.groupId}";
        	        	
        	if("${post.userId}"=="${user}"){
	        	var con = confirm('삭제하시겠습니까?');
	           	if(con==true){
		        	$.ajax({
		    			url: '/studyboard/'+boardId,
		    			type: 'DELETE',
		    			async: false,
		    			success: function(data){
		    				console.log(data);
		    				if(data.result=="success"){
		    					alert('삭제되었습니다.')
		    					window.location.replace("/view/studyboard/"+groupId);
		    				}
		    				else{
		    					alert('삭제 실패')
		    				}
		    			}, error: function(xhr, status,error){
		    				console.log(xhr.status+" error: "+error);
		    			}
		    		})
	           	}
        	}
        	else{
        		alert("삭제는 게시글 작성자만 가능합니다.");
        	}
        }
        
        function updatePost(){
        	if("${post.userId}"=="${user}"){
        		location.href="/view/studyboard/update/"+${groupInfo.groupId}+"/"+${post.boardId};
        	}
        	else{
        		alert("수정은 게시글 작성자만 가능합니다.");
        	}
        }
        

		</script>
        
    </body>
</html>