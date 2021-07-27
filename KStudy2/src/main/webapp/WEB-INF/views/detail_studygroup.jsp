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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
    </head>
    <body class="sb-nav-fixed">
    <%       	
		request.setCharacterEncoding("UTF-8"); 
       	String id = request.getParameter("studyGroup");
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
                                <font size=5><i class="fas fa-info-circle"></i>&nbsp; 스터디 정보</font>
                            </a>
                            <!-- <a class="nav-link"  href='javascript:void(0);' onclick="goSchedulePage();">-->
                            <a class="nav-link"  href='javascript:void(0);' onclick="checkMember('schedule');">
                                <font size=5><i class="far fa-calendar-alt"></i>&nbsp; 일정 관리</font>
                            </a>
                            <a class="nav-link" href='javascript:void(0);' onclick="checkMember('board');">
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
                    <div id="maincontent" class="container-fluid px-4">
                    	<div id="maincontent1">       
                        <div style="padding-bottom:80px;">           
	                        <div style="float:left;"><h1 class="mt-4">${groupInfo.groupName}</h1></div>
	                        <div style="float:right;" class="mt-4"><button type="button" class="btn btn-primary" onclick="checkDeleteMember()">탈퇴하기</button></div>
	                    </div>
                        <ol id="lectureName" class="breadcrumb mb-4">
                            
                        </ol>
                        <hr>
                        <div style="margin-bottom: 30px; height: 50px" class="form-floating">
                        	<div style="float:left;"><h3 class="mt-4"><i class="far fa-file-alt"></i> 스터디 상세 설명</h3></div>
                        	<div class="mt-4" style="float:left; padding-left:30px;">
                        		<button type="button" class="btn btn-primary" onclick="viewModifyForm()">스터디 정보 수정</button>
                        	</div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xl-6" style="width:100%">
                                <div class="card mb-4" style="width:800px">
                                    <div class="card-body">
                                    	<pre><c:if test="${not empty groupInfo.longDsc}"><c:out value="${groupInfo.longDsc}" /></c:if><c:if test="${empty groupInfo.longDsc}"><c:out value="스터디 운영방식, 규칙 등 상세 설명을 입력해주세요." /></c:if></pre>
                                    </div>
                                </div>
                            </div>
                                                    
                        </div>
                        <h3 class="mt-4"><i class="fas fa-users"></i> 스터디 참여 멤버</h3>
                        <div id="members" class="row">
							<div class="col-xl-3-1 col-md-6">
                        		<div class="card bg-primary text-white mb-4">
                        			<div class="card-body">${groupInfo.regUser} (개설자)</div>
                       			</div>
                    		</div>
                        </div>
                        
                        <!-- <h3 class="mt-4">사전</h3>
                        <div id="members" class="row">
							<div class="col-xl-3-1 col-md-6">
                        		<iframe src="https://web-public-service-smartall-dev.wjthinkbig.com/dictionary/engdicDetail?contractNumber=M100006092" width="800px" height="600px"></iframe>
                    		</div>
                        </div> -->
                        
                      </div>   
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
        
        <script>
        
        
        var state = ${state};
        
        $(document).ready(function(){
        	lectureInfo();
        	showMembers();
        });
        
                
        
        /* function goSchedulePage(){
        	var groupId = "${groupInfo.groupId}";
        	console.log(groupId);
        	
        	$("#maincontent1").empty();
        	
        	let html='';
        	html+='일정관리 페이지';
        	$("#maincontent1").append(html)
        }
        
        function goBoardPage(){
        	var groupId = "${groupInfo.groupId}";
        	console.log(groupId);
        	
        	$("#maincontent1").empty();
        	
        	let html='';
        	html+='자유게시판 페이지';
        	$("#maincontent1").append(html)
        } */
        
        //스터디 진행중인 강의 정보 표시
        function lectureInfo(){
        	var lecId = "${groupInfo.lecId}";
        	let html='';
        	html+='<li class="breadcrumb-item active">스터디 진행중인 강의: <a href="<c:url value="/view/detail?courseId='+encodeURIComponent(lecId)+'"/>" style="text-decoration: none; color: #fb8836;">${groupInfo.lecName}</a></li>'
        	$("#lectureName").append(html);
        }
        
        //개설자 외 멤버 표시
        function showMembers(){
        	var groupId = "${groupInfo.groupId}";
        	
        	$.ajax({
                url: "/studygroup/users/"+groupId,
                type: "GET",
                dataType: "json",            
                success: function(data){
                    console.log('userData:'+data);
                              
                   	let html = '';
                    $.each(data, function(index, obj){
                    	console.log(obj);
   	                 	html += '<div class="col-xl-3-1 col-md-6">';
                        html += '<div class="card bg-primary text-white mb-4">';
                        //html += '<div class="card-body">'+obj.userName+'<c:if test="${groupInfo.regUser eq '+obj.userName+'}"><h5>(개설자)</h5></c:if></div>';
                        html += '<div class="card-body">'+obj.userName+'</div>';
                        html += '</div>';
                    	html += '</div>';
                    })
                    
                    $("#members").append(html)
                
                },
                error: function(){
                    alert("멤버 정보 가져오기 오류");
                }
            });
                	        	
        }
       	
        //권한 확인 후 정보 수정 폼 띄우기
/*         function viewModifyForm(){
        	var groupId = "${groupInfo.groupId}";
        	
        	$.ajax({
    			url: '/studygroup/check/register/'+groupId,
    			type: 'GET',
    			async: false,
    			contentType: 'application/json',
    			success: function(data){
    				console.log(data);
    				if(data==1){ //개설자인 경우
    					window.open('/studygroup/edit/${groupInfo.groupId}', '스터디 정보 수정','width=1200, height=700');
    		        	window.opener.document.getElementById('form').submit();
    				}
    				else if(data==0 || data==-1){ //미가입 멤버 또는 가입 멤버인 경우
    					alert('그룹 개설자만 수정이 가능합니다.');
    				}


    			}, error: function(xhr, status,error){

    				console.log(xhr.status+" error: "+error);
    			}
    		})
        	
        } */
        
        
        function viewModifyForm(){
        	if(state=="leader"){ //개설자인 경우
				window.open('/studygroup/edit/${groupInfo.groupId}', '스터디 정보 수정','width=1200, height=700');
	        	window.opener.document.getElementById('form').submit();
			}
			else if(state=="member" || state=="nmember"){ //미가입 멤버 또는 가입 멤버인 경우
				alert('그룹 개설자만 수정이 가능합니다.');
			}
        	
        }
        
        //탈퇴하기 => 권한 확인 후 그룹 삭제 or 탈퇴 or 경고창
/*         function checkDeleteMember(){
        	var groupId = "${groupInfo.groupId}";
        	
        	$.ajax({
    			url: '/studygroup/check/register/'+groupId,
    			type: 'GET',
    			async: false,
    			contentType: 'application/json',
    			success: function(data){
    				console.log(data);
    				if(data==1){ //개설자인 경우
    					var con = confirm('그룹 개설자가 탈퇴 시 스터디 그룹이 삭제됩니다. 탈퇴하시겠습니까?');
    					if(con==true){
    						deleteStudyGroup();
    					}
    				}
    				else if(data==-1){ //미가입 멤버인 경우
    					alert('가입된 멤버가 아닙니다.');
    				}
    				else if(data==0){ //멤버인 경우
    					deleteMember();
    				}


    			}, error: function(xhr, status,error){

    				console.log(xhr.status+" error: "+error);
    			}
    		})
        } */
        
        
        function checkDeleteMember(){
        	//var state=${state};
        	if(state=="leader" ){
        		var con = confirm('그룹 개설자가 탈퇴 시 스터디 그룹이 삭제됩니다. 탈퇴하시겠습니까?');
				if(con==true){
					deleteStudyGroup();
				}
        	}
        	else if(state=="member"){
        		deleteMember();
        	}
        	else if(state=="nmember"){
        		alert('가입된 멤버가 아닙니다.');
        	}
        	else{
        		alert('권한 확인 오류');
        	}
        }
        
        //멤버 탈퇴
        function deleteMember(){
        	var groupId = "${groupInfo.groupId}";
        	
        	var con = confirm('탈퇴하시겠습니까?');
           	if(con==true){
           		$.ajax({
        			url: '/studygroup/member/'+groupId,
        			type: 'DELETE',
        			async: false,
        			contentType: 'application/json',
        			success: function(data){
        				console.log(data);
    					if(data==1){
    						alert('탈퇴되었습니다.');    						
    					}
    					else if(data==0){
    						alert('탈퇴 실패!');
    					}

        			}, error: function(xhr, status,error){

        				console.log(xhr.status+" error: "+error);
        			}
        		})       		
        		location.reload();
           	}
        	    		    		
        }
        
        //그룹 삭제
        function deleteStudyGroup(){
        	var groupId = "${groupInfo.groupId}";
        	var lecId = "${groupInfo.lecId}"
        	$.ajax({
    			url: '/studygroup/'+groupId,
    			type: 'PUT',
    			async: false,
    			contentType: 'application/json',
    			success: function(data){
    				console.log(data);
					if(data==1){
						alert('스터디 그룹이 삭제되었습니다.');
						window.location.href = '/view/detail?courseId='+encodeURIComponent(lecId);
					}
					else if(data==0){
						alert('삭제 실패!');
					}

    			}, error: function(xhr, status,error){

    				console.log(xhr.status+" error: "+error);
    			}
    		})       
        }
        
        //권한 확인 후 일정 관리, 자유 게시판 페이지 이동
/*         function checkMember(num){
        	var groupId = "${groupInfo.groupId}";
        	
        	$.ajax({
    			url: '/studygroup/check/member/'+groupId,
    			type: 'GET',
    			async: false,
    			contentType: 'application/json',
    			success: function(data){
    				console.log(data);
					if(data.result=="member" && num==1){						
						window.location.href = "/view/schedule/"+${groupInfo.groupId};
					}
					else if(data.result=="member" && num==2){
						window.location.href = "/view/studyboard/"+${groupInfo.groupId};
					}
					else if(data.result=="not member"){
						alert('그룹 가입자만 볼 수 있습니다.');
					}

    			}, error: function(xhr, status,error){

    				console.log(xhr.status+" error: "+error);
    			}
    		})       
        } */
        
        function checkMember(option){
        	
        	//var state = "${state}";
        	//if(${member}=="leader" || ${member}=="member"){
        	if(state=="member"||state=="leader"){
        		if(option=="schedule"){
	        		window.location.href = "/view/schedule/"+${groupInfo.groupId};
        		}
        		else if(option=="board"){
        			window.location.href = "/view/studyboard/"+${groupInfo.groupId};
        		}
        	}
        	else if(state=="nmember"){
        		alert('그룹 가입자만 볼 수 있습니다.');
        	}
        	else{
        		alert('권한 확인 오류');
        	}
        }
        
        </script>
    </body>
</html>