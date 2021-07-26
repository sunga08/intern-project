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
		
	   #my_modal {
           display: none;
           width: 500px;
           height: 200px;
           padding: 20px 60px;
           background-color: #fefefe;
           border: 2px solid #888;
           border-radius: 3px;
       }

       #my_modal .modal_close_btn {
           position: absolute;
           bottom: 10px;
           right: 10px;
       }
       
       .modal_wrap{
	        display: none;
	        width: 800px;
	        height: 600px;
	        position: absolute;
	        left: 40%;
	        margin: -250px 0 0 -250px;
	        background:#FFFFFF;
	        z-index: 2;
	    }
	    
	    .modal_wrap2{
	        display: none;
	        width: 800px;
	        height: 600px;
	        position: absolute;
	        left: 40%;
	        margin: -250px 0 0 -250px;
	        background:#FFFFFF;
	        z-index: 2;
	    }
	    
	    .black_bg{
	        display: none;
	        position: absolute;
	        content: "";
	        width: 100%;
	        height: 120%;
	        background-color:rgba(0, 0,0, 0.3);
	        top:0;
	        left: 0;
	        z-index: 1;
	    }
	    
	    .black_bg2{
	        display: none;
	        position: absolute;
	        content: "";
	        width: 100%;
	        height: 120%;
	        background-color:rgba(0, 0,0, 0.3);
	        top:0;
	        left: 0;
	        z-index: 1;
	    }
	    
	    .modal_close{
	        width: 26px;
	        height: 26px;
	        position: absolute;
	        top: -30px;
	        right: 0;
	    }
	    
	    .modal_close2{
	        width: 26px;
	        height: 26px;
	        position: absolute;
	        top: -30px;
	        right: 0;
	    }
	    
	    .modal_close> a{
	        display: block;
	        width: 100%;
	        height: 100%;
	        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
	        text-indent: -9999px;
	    }
	    
	    .modal_close2> a{
	        display: block;
	        width: 100%;
	        height: 100%;
	        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
	        text-indent: -9999px;
	    }

		.modal{ 
		  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
		}
		
		.modal_content{
		  width:400px; height:200px;
		  background:#fff; border-radius:10px;
		  position:relative; top:50%; left:50%;
		  margin-top:-100px; margin-left:-200px;
		  text-align:center;
		  box-sizing:border-box; padding:74px 0;
		  line-height:23px; cursor:pointer;
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
       	String id = request.getParameter("courseId");
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
        <div id=lecDetail></div>
        &nbsp;

	   	<div style="margin-bottom:100px">
	   		<div style="float:left"><h3>이 강의로 진행중인 스터디</h3></div>

	   		<div style="float:right"><a class="btn btn-primary" onclick="createStudy()">스터디 생성하기</a></div>
	   	</div>
    	<!-- <div><a class="btn btn-primary" href="#" onclick="createStudy()">스터디 생성하기</a></div>-->

        
        <!-- 스터디 Content -->
        <div id="studygroup" class="row gx-4 gx-lg-5">
        </div>        
        
        
        <div class=container style="margin-top:10px; margin-bottom:30px;">
			<div id="pagination" class="pagination-div">			  	
			</div>
		</div>
        
        <hr>
        <!-- 도서 영역 -->
        <div style="margin-bottom:100px">
	   		<div style="float:left"><h3>강좌 연관 도서</h3></div>
	   	</div>

        
        <!-- 도서 Content-->
        <!-- <div id="bookData" class="row gx-4 gx-lg-5"> -->
        <div id="bookData" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
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
     	console.log("<%=id%>");
     	showDetail(); //강좌 상세정보 조회   
		getStudyData(1); //스터디 그룹 목록 1페이지
		totalData = countStudyGroup();
		pagination(totalData, dataPerPage, pageCount, 1, "study");
		getBookData(lecName); //관련 도서 조회
     });

    
     //관련 도서
     function getBookData (keyword) {
     	
     	$.ajax({
             url: "/book/"+keyword,
             type: "GET",
             contentType: "application/json; charset=utf-8;",
             async: false,
             dataType: "json",
             success: function(data){
            	 let html = '';
            	 console.log(data.length);
            	 
            	 if(data.length==0){
                 	html += '<div style="margin-top:100px;margin-bottom:100px;text-align:center;"><h5>관련 도서 정보가 없습니다.</h3></div>';	
                 }
            	 
            	 
            	 else{
	                 $.each(data.items, function(index, obj){
	                 	
	                 	html += '<div class="col mb-5">';
	                	html += '<div class="card h-100" style="min-width:200px;">';
	                	html += '<a href="'+obj.link+'" target="_blank"><img class="card-img-top" style="width:50%; margin-left:25%;" src="'+obj.image+'" alt="..." width="100" height="150"/>';
	                	html += '<div class="card-body p-4">';
	                	html += '<div class="text-center">';
	                	html += '<a href="'+obj.link+'" target="_blank" style="text-decoration: none; color: #000000"><h5 class="fw-bolder">';
	                	html += obj.title;
	                	html += '</h5></a>';
	                	html += '['+obj.publisher+']';
	                	html += '</div>';
	                	html += '<p></p>';
	                	html += '<p class="text-style-1">저자<br/>';
	                	html += obj.author;
	                	html += '</p>' 
	                	html += '<p class="text-style-1">가격<br/>';
	                	html += obj.price+'원';
	                	html += '</p>'               	
	                	
	                	html += '</div>';
							
	                	/* html += '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
	                	html += '<div class="text-center">';
	                	html += '<a class="btn btn-outline-dark mt-auto" href="'+obj.link+'">';
	                	html += '자세히 보기</a>';
	                	html += '</div>';
	                	html += '</div>'; */
	                	html += '</div>';	
	                	html += '</div>';
	                	
	                 })
            	 }
               	 $("#bookData").append(html)
             },
             error: function(){
                 alert("err");
             }
         });
     }

     //사전 보기 버튼 이벤트
     $(function(){     	 
    	 
    	 	function onClick() {
    	        document.querySelector('.modal_wrap').style.display ='block';
    	        document.querySelector('.black_bg').style.display ='block';
    	    }   

    	 	
    	    function offClick() {
    	        document.querySelector('.modal_wrap').style.display ='none';
    	        document.querySelector('.black_bg').style.display ='none';
    	    }
    	    
    	    function onClick2() {
    	        document.querySelector('.modal_wrap2').style.display ='block';
    	        document.querySelector('.black_bg').style.display ='block';
    	    }   

    	 	
    	    function offClick2() {
    	        document.querySelector('.modal_wrap2').style.display ='none';
    	        document.querySelector('.black_bg').style.display ='none';
    	    }

    	 
    	    document.getElementById('modal_btn').addEventListener('click', onClick);
    	    document.getElementById('modal_btn2').addEventListener('click', onClick2);
    	    document.querySelector('.modal_close').addEventListener('click', offClick);
    	    document.querySelector('.modal_close2').addEventListener('click', offClick2);
   	  
   });     
	 
     //강좌 상세정보 조회
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
                html += '<div class="col-lg-7" style="width:30%;">';
                html += '<img class="img-fluid rounded mb-4 mb-lg-0" src="'+data.image+'" alt="..." /></div>';
                
                html += '<div class="col-lg-5" style="width:70%">';
                
             	html += '<p><h1 class="font-weight-light">'+data.lecName+'</h1></p>';
             	html += '<p>제공기관 | '+data.orgName+'<br>';
             	html += '강사명  | '+data.teachers+'<br>'; 
             	html += '등록기간 | '+data.enrollStart.substring(0,10)+'~'+data.enrollEnd.substring(0,10)+'</p>';
             	html += '<li style="list-style: none;"><a class="btn btn-primary" href="'+data.lecUrl+'" target="_blank">강의 바로가기</a>';
             	
             	html += '&nbsp;<button type="button" class="btn btn-primary" id="modal_btn">영어사전 보기</button>';
             	html += '&nbsp;<button type="button" class="btn btn-primary" id="modal_btn2">국어사전 보기</button></li>';

                html += '</div>';
                html += '</div>';
                html += '<div class="card text-white bg-secondary my-5 py-4">';
	            html += '<div class="card-body">';
	            html += '<p class="text-white m-0">'+data.shortDsc+'</p>';
	            html += '</div>';
	        	html += '</div>';
             
             	html += '<div class="black_bg"></div>';     	
             	html += '<div class="modal_wrap">';
             	html += '<div class="modal_close"><a href="#">close</a></div>';
             	html += '<div><iframe src="https://web-public-service-smartall-dev.wjthinkbig.com/dictionary/engdicDetail?contractNumber=M100006092" width="100%" height="600px"></iframe></div></div>';
             	
             	
             	html += '<div class="modal_wrap2">';
             	html += '<div class="modal_close2"><a href="#">close</a></div>';
             	html += '<div><iframe class="kor" src="https://web-public-service-smartall-dev.wjthinkbig.com/dictionary/kordicList?contractNumber=M100006092" width="100%" height="600px"></iframe></div></div>';
             	
             	
                console.log("html")
                console.log(html)
                $("#lecDetail").append(html)
            },
            error: function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
            
    	})
    
    }
    
    //스터디 그룹 목록 조회
    function getStudyData(page) {
    	$("#studygroup").empty()
    	
    	$.ajax({
            url: "/lecture/studygroup/"+"<%=id%>"+"/"+page,
            type: "GET",
            async: false,
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
                    //html += '<a href="<c:url value="/view/info/'+obj.groupId+'"/>" style="text-decoration: none; color: #000b83"><h2 class="card-title">'+obj.groupName+'</h2></a>';
                    html += '<a href="javascript:void(0);" onclick="checkMemberState('+obj.groupId+')" style="text-decoration: none; color: #000b83"><h2 class="card-title">'+obj.groupName+'</h2></a>';
                    html += '<p class="card-text">'+obj.shortDsc+'</p>';
                    html += '<p class="card-text"> 학교명 | '+obj.schoolName+'<br/> 인원  | '+obj.curMem+' / '+obj.maxMem+'<br/> 생성일 | '+timeString_KR.substring(0,11)+'<br/> 개설자 | '+obj.regUser+'</p>';
                    html += '</div>';
                    //가입여부 체크
                    /* if(checkJoin(obj.groupId,0)==0){ //가입된 그룹
                    	html += '<div class="card-footer"><a class="btn btn-red btn-sm" style="cursor: default;">가입된 그룹</a></div>';
                    }
                    else if(checkJoin(obj.groupId,0)==1){ //가입되지 않은 그룹
                    	html += '<div class="card-footer"><a class="btn btn-primary btn-sm" onclick="checkJoin('+obj.groupId+',1)">참여하기</a></div>';
                    } */
                    if(isJoin(obj.groupId)==1){ //가입된 그룹
                    	if(memberState(obj.groupId)==1){
                    		html += '<div class="card-footer"><a class="btn btn-green" style="cursor: default;">개설한 그룹</a></div>';
                    	}
                    	else{
	                    	html += '<div class="card-footer"><a class="btn btn-green" style="cursor: default;">가입된 그룹</a></div>';                    		
                    	}
                    }
                    else if(isJoin(obj.groupId)==0){ //가입되지 않은 그룹
                    	//html += '<div class="card-footer"><a class="btn btn-primary btn-sm" onclick="checkJoin('+obj.groupId+',1)">참여하기</a></div>';
                    	html += '<div class="card-footer"><a class="btn btn-primary btn-sm" onclick="isOverMaxMember('+obj.groupId+')">참여하기</a></div>';
                    }
                    else if(isJoin(obj.groupId)==-1){//로그인하지 않은 사용자
                    	html += '<div class="card-footer"><a class="btn btn-primary btn-sm" onclick="loginAlert()">참여하기</a></div>';
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
    
    function loginAlert(){
    	alert('로그인이 필요합니다.');
    }
    
    //스터디 클릭시 사용자 권한 체크
    function checkMemberState(groupId){
    	
    	$.ajax({
			url: '/studygroup/check/member/'+groupId, 
			type: 'GET',
			async: false,
			contentType: 'application/json',
			success: function(data){
				console.log(data);
				
				if(data.result=="member"){
					var state = memberState(groupId);
					if(state==1){
						//개설자
						location.href='/view/info/'+groupId+'?state=leader';
					}
					else{
						//멤버
						location.href='/view/info/'+groupId+'?state=member';
					}
				}
				else if(data.result=="not member"){
					location.href='/view/info/'+groupId+'?state=nmember';
				}

			}, error: function(xhr, status,error){

				console.log(xhr.status+" error: "+error);
			}
		})
		
		
    }
    
    function showStudyDetail(state, groupId){
    	location.href='/view/info/'+groupId+'?state='+state;
    }

    function countStudyGroup(){
		var cnt;
    	
    	$.ajax({
            url: "/lecture/groupcount/"+"<%=id%>",
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
    
    
    //사용 X
    function GetBookData() {

    	$.ajax({
            url: "/lecture/studygroup/"+"<%=id%>",
            type: "GET",
            dataType: "json",
            success: function(data){

                console.log(data);

                let html = '';
                
                html += '<div style="margin-top:50px;margin-bottom:50px;text-align:center;"><h5>관련 도서가 없습니다.</h3></div>';	                

                $("#bookData").append(html);

            },
            error: function(){
                alert("err");
            }
        });

    }
    
    
    //스터디 생성하기 창 띄우기
    function createStudy(){
    	window.open('/studygroup/add/'+encodeURIComponent("<%=id%>"), '스터디 생성하기','width=800, height=500');
    	window.opener.document.getElementById('form').submit();

    }
    
    //가입여부, 인원초과 여부 판단
    /* function checkJoin(groupId, tmp){
    	var check=1;

    	$.ajax({
			url: '/studygroup/check/'+groupId, //반환값 수정하기
			type: 'GET',
			async: false,
			contentType: 'application/json',
			success: function(data){
				console.log(data);
				
				if(data==0){
					check=data;
				}
				else if(data==-1 && tmp==1){
					alert('인원이 가득차 참여할 수 없습니다.');
				}
				else if(data==1 && tmp==1){
					confirmJoin(groupId);
				}


			}, error: function(xhr, status,error){

				console.log(xhr.status+" error: "+error);
			}
		})
		
		return check;
    } */
    
    
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
    
    //인원초과 여부 판단
    function isOverMaxMember(groupId){
    	var res=1;

    	$.ajax({
			url: '/studygroup/check/count/'+groupId, 
			type: 'GET',
			async: false,
			contentType: 'application/json',
			success: function(data){
				console.log(data);
				
				if(data.result=="not over"){
					confirmJoin(groupId);	
				}
				else if(data.result=="over"){
					alert("인원이 가득차 참여할 수 없습니다.");
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
    
    
    //그룹 가입
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
    	    url: "/logout",
    	    type: "GET",
    	    async: false,
    	    contentType: "application/json; charset=utf-8;",
    	    success : function(response){
   	    		
	    		window.location="/main";
	    	    
    	    },
    	    error : function(){
    	      alert("에러")		
    	    }
    	  });
    }
    
    </script>
    
    
</body>
</html>