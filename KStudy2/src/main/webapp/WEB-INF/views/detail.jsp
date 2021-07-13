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
    <link href="/css/styles.css" rel="stylesheet" />
    <link href="/css/styles2.css" rel="stylesheet" />
    
    <style>
      .btn-red {
		  color: #fff;
		  background-color: #fe4c39;
		  border-color: #fe4c39;
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
	        top:30%;
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
	    
	    .modal_close{
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
			
			</div>
            
        </div>
    </nav>
    <!-- Page Content-->
    <div class="container px-4 px-lg-5">
        <!-- Heading Row-->
        <div id=lecDetail></div>
        
        <!-- 
		
	
		  <div class="modal_content" 
		       title="클릭하면 창이 닫힙니다.">
		    여기에 모달창 내용을 적어줍니다.<br>
		    이미지여도 좋고 글이어도 좋습니다.
		  </div>
		</div>-->

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
			  	</ul> -->
			</div>
		</div>
        
        
        <!-- 도서 영역 -->
        <!-- <div style="margin-bottom:100px">
	   		<div style="float:left"><h3>관련 도서</h3></div>
	   	</div>-->

        
        <!-- 도서 Content-->
        <div id="bookData" class="row gx-4 gx-lg-5">

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
     	showDetail();        
		getStudyData(1);
		totalData = countStudyGroup();
		pagination(totalData, dataPerPage, pageCount, 1, "study");
		//GetBookData();
		test(lecName);
     });

    
     function test (keyword) {
     	
     	$.ajax({
             url: "/book/"+keyword,
             type: "GET",
             contentType: "application/json; charset=utf-8;",
             async: false,
             dataType: "json",
             success: function(data){
                 
                 $.each(data.results, function(index, obj){
                 	console.log(obj)
                 })
             },
             error: function(){
                 alert("err");
             }
         });
     }
    
     /*$(function(){ 

    	  $("#modal_btn").click(function(){
    	    $(".modal").fadeIn();
    	  });
    	  
    	  $(".modal_content").click(function(){
    	    $(".modal").fadeOut();
    	  });
    	  
    });*/
     
     $(function(){     	 
    	 
    	 function onClick() {
    	        document.querySelector('.modal_wrap').style.display ='block';
    	        document.querySelector('.black_bg').style.display ='block';
    	    }   
    	    function offClick() {
    	        document.querySelector('.modal_wrap').style.display ='none';
    	        document.querySelector('.black_bg').style.display ='none';
    	    }
    	 
    	    document.getElementById('modal_btn').addEventListener('click', onClick);
    	    document.querySelector('.modal_close').addEventListener('click', offClick);


   	  /*$("#modal_btn").click(function(){
   		document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';

   	  });
   	  
   	  $("#close_btn").click(function(){
   		document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';

   	  });*/
   	  
   });

     
     
     /*function modal(id) {
         var zIndex = 9999;
         var modal = document.getElementById(id);

         // 모달 div 뒤에 희끄무레한 레이어
         var bg = document.createElement('div');
         bg.setStyle({
             position: 'fixed',
             zIndex: zIndex,
             left: '0px',
             top: '0px',
             width: '100%',
             height: '100%',
             overflow: 'auto',
             // 레이어 색갈은 여기서 바꾸면 됨
             backgroundColor: 'rgba(0,0,0,0.4)'
         });
         document.body.append(bg);

         // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
         modal.querySelector('.modal_close_btn').addEventListener('click', function() {
             bg.remove();
             modal.style.display = 'none';
         });

         modal.setStyle({
             position: 'fixed',
             display: 'block',
             boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

             // 시꺼먼 레이어 보다 한칸 위에 보이기
             zIndex: zIndex + 1,

             // div center 정렬
             top: '50%',
             left: '55%',
             transform: 'translate(-50%, -50%)',
             msTransform: 'translate(-50%, -50%)',
             webkitTransform: 'translate(-50%, -50%)'
         });
     }

     // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
     Element.prototype.setStyle = function(styles) {
         for (var k in styles) this.style[k] = styles[k];
         return this;
     };*/
     
	 
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
             	html += '<li><a class="btn btn-primary" href="'+data.lecUrl+'" target="_blank">강의 바로가기</a>';
             	
             	html += '<button type="button" class="btn btn-primary" id="modal_btn">영어사전 보기</button>';
             	html += '<button type="button" class="btn btn-primary" id="modal_btn2">국어사전 보기</button></li>';

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
             	html += '<div><iframe src="https://web-public-service-smartall-dev.wjthinkbig.com/dictionary/engdicDetail?contractNumber=M100006092" width="100%" height="600px"></iframe></div> <div>';
             	
                console.log("html")
                console.log(html)
                $("#lecDetail").append(html)
            },
            error: function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
            
    	})
    
    }
    
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
                    html += '<a href="<c:url value="/view/info/'+obj.groupId+'"/>" style="text-decoration: none; color: #000b83"><h2 class="card-title">'+obj.groupName+'</h2></a>';
                    html += '<p class="card-text">'+obj.shortDsc+'</p>';
                    html += '<p class="card-text"> 학교명 | '+obj.schoolName+'<br/> 인원  | '+obj.curMem+' / '+obj.maxMem+'<br/> 생성일 | '+timeString_KR.substring(0,11)+'<br/> 개설자 | '+obj.regUser+'</p>';
                    html += '</div>';
                    if(checkJoin(obj.groupId,0)==0){
                    	html += '<div class="card-footer"><a class="btn btn-red btn-sm" style="cursor: default;">가입된 그룹</a></div>';
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
    
    /*window.onload=function(){
	    function onClick() {
		        document.querySelector('.modal_wrap').style.display ='block';
		        document.querySelector('.black_bg').style.display ='block';
		    }   
		    function offClick() {
		        document.querySelector('.modal_wrap').style.display ='none';
		        document.querySelector('.black_bg').style.display ='none';
		    }
		 
		    document.getElementById('modal_btn').addEventListener('click', onClick);
		    document.querySelector('.modal_close').addEventListener('click', offClick);
    }*/
    
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
	       	    if(option=="study"){
	       	   		pagination(totalData, dataPerPage, pageCount, selectedPage, "study");
		       	    getStudyData(selectedPage);
	       	    }

	       	    
	       	  });
       	

    }
    
    </script>
    
    
</body>
</html>