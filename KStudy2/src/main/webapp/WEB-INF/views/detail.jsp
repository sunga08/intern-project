<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>K-STUDY</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../resources/css/styles.css" rel="stylesheet" />
    
    <style>
      .btn-red {
		  color: #fff;
		  background-color: #fe4c39;
		  border-color: #fe4c39;
	  }
		

    </style>
    
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

	<%       	
		request.setCharacterEncoding("UTF-8"); 
       	String id = request.getParameter("courseId");
    %>
    <!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="<c:url value='/main'/>">K-STUDY</a>
       
<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
	<li class="nav-item"><a class="nav-link active" aria-current="page" href="<c:url value='/main'/>">Home</a></li>
	<li class="nav-item"><a class="nav-link" href="#!">My Page</a></li>

</ul>

</div>
            
        </div>
    </nav>
    <!-- Page Content-->
    <div class="container px-4 px-lg-5">
        <!-- Heading Row-->
        <div id=lecDetail>
	        
	   
		</div>
	   	<div style="margin-bottom:100px">
	   		<div style="float:left"><h3>이 강의로 진행중인 스터디</h3></div>
	   		<div style="float:right"><a class="btn btn-primary" onclick="createStudy()">스터디 생성하기</a></div>
	   	</div>
    	<!-- <div><a class="btn btn-primary" href="#" onclick="createStudy()">스터디 생성하기</a></div>-->

        
        <!-- 스터디 Content -->
        <div id="studygroup" class="row gx-4 gx-lg-5">

        </div>
        
        <div style="margin-bottom:100px">
	   		<div style="float:left"><h3>관련 도서</h3></div>
	   	</div>
    	<!-- <div><a class="btn btn-primary" href="#" onclick="createStudy()">스터디 생성하기</a></div>-->

        
        <!-- 도서 Content-->
        <div id="bookData" class="row gx-4 gx-lg-5">

        </div>
        
    </div>
    
    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; 웅진 씽크빅 IT개발실</p></div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../resources/js/scripts.js"></script>
    <script type="text/javascript">
     
     
     $(document).ready(function(){
     	console.log("<%=id%>");
     	showDetail();        
		GetStudyData();
		GetBookData();
     });
     
	 var lecName;
     function showDetail() {

     	$.ajax({
            url: "/detail/"+"<%=id%>",
            type: "GET",
            async:false,
            dataType: "json",
            success: function(data){
                console.log(data);
				lecName=data.lecName;
				
                let html = '';
                
                html += '<div class="row gx-4 gx-lg-5 align-items-center my-5">';
                html += '<div class="col-lg-7">';
                html += '<img class="img-fluid rounded mb-4 mb-lg-0" src="'+data.image+'" alt="..." /></div>';
                
                html += '<div class="col-lg-5">';
                
             	html += '<p><h1 class="font-weight-light">'+data.lecName+'</h1></p>';
             	html += '<p>제공기관 | '+data.orgName+'<br>';
             	html += '강사명  | '+data.teachers+'<br>'; 
             	html += '등록기간 | '+data.enrollStart.substring(0,10)+'~'+data.enrollEnd.substring(0,10)+'</p>';
             	html += '<a class="btn btn-primary" href="'+data.lecUrl+'" target="_blank">강의 바로가기</a>';
                html += '</div>';
                html += '</div>';
                html += '<div class="card text-white bg-secondary my-5 py-4 text-center">';
	            html += '<div class="card-body">';
	            html += '<p class="text-white m-0">'+data.shortDsc+'</p>';
	            html += '</div>';
	        	html += '</div>';
             
                console.log("html")
                console.log(html)
                $("#lecDetail").append(html)
            },
            error: function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
            
    	})
    
    }
    
    function GetStudyData() {

    	$.ajax({
            url: "/lecture/studygroup/"+"<%=id%>",
            type: "GET",
            dataType: "json",
            success: function(data){

                console.log(data);

                let html = '';
                if(data.length==0){
                	html += '<div style="margin-top:100px;margin-bottom:100px;text-align:center;"><h5>아직 생성된 스터디가 없습니다.</h3></div>';	
                }
                
                $.each(data, function(index, obj){
                	console.log(obj)
                	
                	let dateObj = new Date(obj.createDate);
                	let timeString_KR = dateObj.toLocaleString("ko-KR", {timeZone: "Asia/Seoul"});
                	console.log(timeString_KR);
                	
                	html += '<div class="col-md-4 mb-5">';
                    html += '<div class="card h-100">';
                    html += '<div class="card-body">';
                    html += '<a href="<c:url value="/view/info/'+obj.groupId+'"/>" style="text-decoration: none; color: #000b83"><h2 class="card-title">'+obj.groupName+'</h2></a>';
                    html += '<p class="card-text">'+obj.shortDsc+'</p>';
                    html += '<p class="card-text"> 학교명 | '+obj.schoolName+'<br/> 인원  | '+obj.curMem+' / '+obj.maxMem+'<br/> 생성일 | '+timeString_KR.substring(0,11)+'<br/> 개설자 | '+obj.regUser+'</p>';
                    html += '</div>';
                    if(checkJoin(obj.groupId,0)==0){
                    	html += '<div class="card-footer"><a class="btn btn-red btn-sm">가입된 그룹</a></div>';
                    }
                    else if(checkJoin(obj.groupId,0)==1){
                    	html += '<div class="card-footer"><a class="btn btn-primary btn-sm" onclick="checkJoin('+obj.groupId+',1)">참여하기</a></div>';
                    }
                    html += '</div>';
                    html += '</div>';
                	
                })
                console.log("html")
                console.log(html)
                $("#studygroup").append(html)

            },
            error: function(){
                alert("err");
            }
        });

    }
    
    
    function GetBookData() {

    	$.ajax({
            url: "/lecture/studygroup/"+"<%=id%>",
            type: "GET",
            dataType: "json",
            success: function(data){

                console.log(data);

                let html = '';
                
                html += '<div style="margin-top:50px;margin-bottom:50px;text-align:center;"><h5>관련 도서가 없습니다.</h3></div>';	
                

                $("#bookData").append(html)

            },
            error: function(){
                alert("err");
            }
        });

    }
    
    
    function createStudy(){
    	window.open('/studygroup/add/'+encodeURIComponent("<%=id%>"), '스터디 생성하기','width=800, height=500');
    	window.opener.document.getElementById('form').submit();

    }
    
    function joinStudyAlert(groupId){

    	$.ajax({
            url: "/studygroup/"+groupId,
            type: "GET",
            dataType: "json",            
            success: function(groupData){

                console.log('groupData:'+groupData);
                          
               	var con = confirm('스터디 참여가 가능합니다. 참여하시겠습니까?');
               	if(con==true){
               		joinStudy(groupData);                		
               		location.reload();
               	}
            },
            error: function(){
                alert("가입창 오류");
            }
        });
    }
    
    function joinStudy(groupData){
    	$.ajax({
			url: '/studygroup/join',
			type: 'POST',
			data: JSON.stringify(groupData),
			async: false,
			contentType: 'application/json',
			success: function(data){
				console.log(data);
				if(data==1){
					alert('참여가 완료되었습니다.');	
				}
				else{
					alert('참여에 실패하였습니다.');
				}
			}, error: function(xhr, status,error){
				console.log(xhr.status+" error: "+error);
			}
		})
    }
    
    function checkJoin(groupId, tmp){
    	var check=1;

    	$.ajax({
			url: '/studygroup/check/'+groupId,
			type: 'GET',
			async: false,
			contentType: 'application/json',
			success: function(data){
				console.log(data);
				
				if(data==0){
					//alert('이미 가입된 그룹입니다.');	
					check=data;
				}
				else if(data==-1 && tmp==1){
					alert('인원이 가득차 참여할 수 없습니다.');
				}
				else if(data==1 && tmp==1){
					joinStudyAlert(groupId);
				}


			}, error: function(xhr, status,error){

				console.log(xhr.status+" error: "+error);
			}
		})
		
		return check;
    }

    
    </script>
    
    
</body>
</html>