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
        <script src="/js/jquery.serialize-object.min.js"></script>
        
        <link href='/css/main.css' rel='stylesheet' />
		<script src='/js/main.js'></script>
		<script src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
		
		<style>
		
            .mt-4-1{
            	margin-bottom: 1rem;
            }
            
            .pagination, .dataTable-pagination ul{
            	padding-left: 730px;
            }
            
            
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
    	//String state = request.getParameter("state");
    %>
    <%-- <c:set var="st" value="<%=state %>"/> --%>
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
                                <font size=5><i class="fas fa-info-circle"></i>&nbsp; 스터디 정보</font>
                            </a>
                            <a class="nav-link" href="<c:url value='/view/schedule/${groupInfo.groupId}'/>">
                                <font size=5><i class="far fa-calendar-alt"></i>&nbsp; 일정 관리</font>
                            </a>
                            <a class="nav-link" href="<c:url value='/view/studyboard/${groupInfo.groupId}'/>">
                                <font size=5><i class="far fa-clipboard"></i>&nbsp; 자유 게시판</font>
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
                        
                        
                        <div id="board" style="margin-top:30px;">
                        
                        	<form name="form" id="form" role="form">

								<div class="mb-3">			
									<label for="title">제목</label>			
									<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요" value="${post.title}">			
								</div>
				
							</form>
								
								<div class="mb-3">			
									<label for="content">내용</label>			
									<textarea class="form-control" rows="20" name="content" id="content" placeholder="내용을 입력해 주세요">${post.content}</textarea>			
								</div>
																								                        
                        
	                    <div style="float:right;" class="mt-4-1"><button class="btn btn-primary" onclick="submitPost()">등록</button></div>

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
        	CKEDITOR.replace('content', {
            	toolbar : 'Full',
                height : 500,
                removePlugins:['ImageUpload']
            });
        });
        
        
        function goLecturePage(){
        	var lecId = "${groupInfo.lecId}";
        	let html='';
        	html+='<li class="breadcrumb-item active">스터디 진행중인 강의: <a href="<c:url value="/view/detail?courseId='+encodeURIComponent(lecId)+'"/>" style="text-decoration: none; color: #fb8836;">${groupInfo.lecName}</a></li>';
        	$("#lectureName").append(html);
        }
        
        function submitPost(){
        	var form = $('#form').serializeObject();
    		var groupId = "${groupInfo.groupId}";
    		var boardId = "${post.boardId}";
    		var editor = CKEDITOR.instances.content;

    		if(form.title!=""&&form.content!=""){
    			var formData = {
    						boardId : '${post.boardId}',   		                
    		                title : form.title,
    		                content : editor.getData()	                       
    		   	}
    										 	
    			$.ajax({
    				url: '/studyboard',
    				type: 'PUT',
    				async: false,
    				contentType: 'application/json',
    				data: JSON.stringify(formData),
    				success: function(data){
    					console.log(data);
    					if(data==1){
    						alert('수정되었습니다.');
    						window.location.replace("/view/studyboard/detail/"+groupId+"/"+boardId);
    					}
    					else{
    						alert('수정 실패');
    					}

    				}, error: function(xhr, status,error){
    					console.log(xhr.status+" error: "+error);
    				}
    			})
    		}
        }
        
        
		</script>
        
    </body>
</html>