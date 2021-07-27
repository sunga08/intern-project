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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/css/styles.css" rel="stylesheet" />
    <link href="/css/styles2.css" rel="stylesheet" />
    
    <style>
      .btn-red {
		  color: #fff;
		  background-color: #fe4c39;
		  border-color: #fe4c39;
	  }
	  
	  .btn-green {
		  color: #fff;
		  background-color: #04B431;
		  border-color: #04B431;
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
		
	   

		.row-cols-xl-4 > *{
   			width: 20%;
		}
		
    </style>
    
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

	<%       	
		request.setCharacterEncoding("UTF-8"); 
       	//String id = request.getParameter("courseId");
    %>
    <!-- Responsive navbar-->
    <div class="black_bg"></div>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="<c:url value='/main'/>">K-STUDY</a>
       
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="<c:url value='/main'/>">Home</a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="#!">My Page</a></li> -->
				
				</ul>
			
				<div id="naver_id_login" style="text-align:center">					
					<c:if test="${nickname!=null}">
						<div class="d-flex"><h5 style="color:white;">${nickname} 님 &nbsp;</h5><button class="btn btn-primary btn-sm" onclick="logout()">로그아웃</button></div>							
					</c:if>
										
				</div>
			</div>
			
            
        </div>
    </nav>
    <!-- Page Content-->
    <div class="container px-4 px-lg-5">
        <!-- Heading Row-->       

	   	<div style="margin-bottom:100px">
	   		<div style="float:left"><h3>내가 개설한 스터디</h3></div>
	   	</div>
       
        <!-- 스터디 Content -->
        <div id="studygroup" class="row gx-4 gx-lg-5">
        </div>        
        
        
        <div class=container style="margin-top:10px; margin-bottom:30px;">
			<div id="pagination" class="pagination-div">			  	
			</div>
		</div>
		
		
		<div style="margin-bottom:100px">
	   		<div style="float:left"><h3>가입한 스터디</h3></div>
	   	</div>
       
        <!-- 스터디 Content -->
        <div id="studygroup" class="row gx-4 gx-lg-5">
        </div>        
        
        
        <div class=container style="margin-top:10px; margin-bottom:30px;">
			<div id="pagination" class="pagination-div">			  	
			</div>
		</div>
        
        
    </div>
		 
    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; 웅진 씽크빅 IT개발실</p></div>
    </footer>

     <!-- <div class="modal">
	 <div class="modal_wrap">
	    <div class="modal_close" id="close_btn"><a href="#">close</a></div>
	    <div>
	        <iframe src="https://web-public-service-smartall-dev.wjthinkbig.com/dictionary/engdicDetail?contractNumber=M100006092" width="800px" height="600px"></iframe>
	    </div>
     <div> -->
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="/js/scripts.js"></script>
    <script type="text/javascript">
     
    let totalData; //총 데이터 수
    let dataPerPage = 6; //한 페이지에 나타낼 글 수
    let pageCount = 5; //페이징에 나타낼 페이지 수
    let globalCurrentPage=1; //현재 페이지
     
    var lecName;
    
     $(document).ready(function(){
		getStudyData(1); //스터디 그룹 목록 1페이지
		totalData = countStudyGroup();
		pagination(totalData, dataPerPage, pageCount, 1, "study");
     });
      
    
    //스터디 그룹 목록 조회
    function getStudyData(page) {
    	$("#studygroup").empty()
    	
    	$.ajax({
            url: "/mypage/"+page,
            type: "GET",
            async: false,
            dataType: "json",
            success: function(data){

                console.log(data);

                let html = '';
                if(data.length==0){
                	html += '<div style="margin-top:100px;margin-bottom:100px;text-align:center;"><h5>개설한 스터디가 없습니다.</h3></div>';	
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
                    //html += '<a href="javascript:void(0);" onclick="checkMemberState('+obj.groupId+')" style="text-decoration: none; color: #000b83"><h2 class="card-title">'+obj.groupName+'</h2></a>';
                    html += '<p class="card-text">'+obj.shortDsc+'</p>';
                    html += '<p class="card-text"> 학교명 | '+obj.schoolName+'<br/> 인원  | '+obj.curMem+' / '+obj.maxMem+'<br/> 생성일 | '+timeString_KR.substring(0,11)+'<br/> 개설자 | '+obj.regUser+'</p>';
                    html += '</div>';
                    
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
    
    function loginAlert(){
    	alert('로그인이 필요합니다.');
    }
        

    function countStudyGroup(){
		var cnt;
    	
    	$.ajax({
            url: "/studygroup/count/my";
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
    
    

    
    //가입 여부 판단
    function isJoin(groupId){
    	var res=-1;

    	$.ajax({
			url: '/studygroup/check/member/'+groupId, 
			type: 'GET',
			async: false,
			contentType: 'application/json',
			success: function(data){
				console.log(data);
				
				if(data.result=="member"){
					res = 1;	
				}
				else if(data.result=="not member"){
					res = 0;
				}


			}, error: function(xhr, status,error){

				console.log(xhr.status+" error: "+error);
			}
		})
		
		return res;
    }
    
    
    //개설자 여부
    function memberState(groupId){
    	var res=1;

    	$.ajax({
			url: '/studygroup/check/state/'+groupId, 
			type: 'GET',
			async: false,
			contentType: 'application/json',
			success: function(data){
				console.log(data);
				
				if(data.result=="leader"){
					res=1;	
				}
				else if(data.result=="member"){
					res=0;
				}

			}, error: function(xhr, status,error){

				console.log(xhr.status+" error: "+error);
			}
		})
		
		return res;
    }
    
    //가입하려는 그룹 정보 가져오기
    function confirmJoin(groupId){

    	$.ajax({
            url: "/studygroup/"+groupId,
            type: "GET",
            dataType: "json",            
            success: function(groupData){

                console.log('groupData:'+groupData);
                          
               	var con = confirm('스터디 참여가 가능합니다. 참여하시겠습니까?');
               	if(con==true){
               		joinStudy(groupData);  //가입처리              		
               		location.reload();
               	}
            },
            error: function(){
                alert("가입창 오류");
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
	       	    
	       	    
	       	    globalCurrentPage = selectedPage; //선택된 페이지 번호


       	    	//페이징 표시 재호출
	       	    if(option=="study"){
	       	   		pagination(totalData, dataPerPage, pageCount, selectedPage, "study");
		       	    getStudyData(selectedPage);
	       	    }

	       	    
	       	  });
       	
    }
    
    function logout(){
    	$.ajax({
    	    url: "/logout/naver",
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