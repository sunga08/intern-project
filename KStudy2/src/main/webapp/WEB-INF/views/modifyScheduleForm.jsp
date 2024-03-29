<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>K-STUDY</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    
    
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="/js/jquery.serialize-object.min.js"></script>
    
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/css/bootstrap.min.css" rel="stylesheet" />
	
	<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      .form-signin{
      	max-width: 400px;
      }
      
      .form-inline .form-control{
      	width: 300px;
      }
      
      .form-inline{
      	width: 400px;
      }
      
      .mb-3{
      	margin-bottom: 3rem !important;
      }
      
      .btn-red {
		  color: #fff;
		  background-color: #fe4c39;
		  border-color: #fe4c39;
	  }
		
	  .btn-red:hover {
		  color: #fff;
		  background-color: #0b5ed7;
		  border-color: #0a58ca;
	  }
	  
	  .w-101 {
		  width: 45% !important;
		  margin: 5px;
	   }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="/css/signin.css" rel="stylesheet">
	

</head>
<body class="text-center">
<%       	
	//request.setCharacterEncoding("UTF-8"); 
	//String startStr = request.getParameter("startStr");
    //String endStr = request.getParameter("endStr");
    
    
%>
<main class="form-signin">
  <h1 class="h3 mb-3 fw-normal" style="text-align: center; margin-bottom:100px;">일정 수정</h1>	
  <form class="form-inline" id="form">
 
   		<div class="form-group" style="margin-bottom: 10px;">
    	<label for="planTitle"> 일정명 &nbsp; &nbsp; &nbsp; &nbsp;</label>
    	<!-- <div  class="form-floating" style="margin: 10px auto;">-->
	      	<input type="text" class="form-control" id="planTitle" placeholder="일정명" name="planTitle" value="${schedule.planTitle}" required>
    	<!-- </div>-->
    	</div>
	   
	
	    <div style="margin-bottom: 10px;" class="form-group">
	    <label for="startDate"> 시작일 &nbsp; &nbsp; &nbsp; &nbsp;</label>
	      <input class="form-control" id="startDate" name="startDate" type="date" value="${schedule.startDate}">
	    </div>
	    
	    <div style="margin-bottom: 10px;" class="form-group">
	    <label for="endDate"> 종료일 &nbsp; &nbsp; &nbsp; &nbsp;</label>
	      <input class="form-control"id="endDate" name="endDate" type="date" value="${schedule.endDate}">
	    </div>
	    
	    <div style="margin-bottom: 30px;" class="form-group">
	    <label for="planContent"> 일정 상세 &nbsp; &nbsp;</label>
	      <textarea class="form-control" id="planContent" placeholder="일정상세" style="height:130px" name="planContent">${schedule.planContent}</textarea>
	    </div>
	    	    
	  <input class="w-101 btn btn-lg btn-primary" type="submit" onclick="updateSchedule()" value="수정하기">
	  <button class="w-101 btn btn-lg btn-red" onclick="deleteSchedule()">삭제하기</button>
  </form>
  <p class="mt-5 mb-3 text-muted">&copy; 웅진 씽크빅 IT개발실</p>
</main>

<script>

	function updateSchedule(){
		var form = $('#form').serializeObject();
		
		//var sday = new Date(document.querySelector("#startDate").value);
		//var eday = new Date(document.querySelector("#endDate").value);

		var formData = {
					scheduleId : ${schedule.scheduleId},
	                startDate : form.startDate,
	                endDate : form.endDate,
	                planTitle : form.planTitle,
	                planContent : form.planContent	                       
	   	}
									 	
		$.ajax({
			url: '/schedule',
			type: 'PUT',
			async: false,
			contentType: 'application/json',
			data: JSON.stringify(formData),
			success: function(data){
				console.log(data);
				if(data==1){
					alert('수정되었습니다.');
				}
				else{
					alert('수정 실패')
				}
				window.opener.parent.location.reload(); // 부모창 새로고침 
				window.self.close(); //현재창 닫기
			}, error: function(xhr, status,error){
				console.log(xhr.status+" error: "+error);
			}
		})
	}
	
	
	function deleteSchedule(){
		var scheduleId = "${schedule.scheduleId}";
		$.ajax({
			url: '/schedule/'+scheduleId,
			type: 'DELETE',
			async: false,
			success: function(data){
				console.log(data);
				if(data==1){
					alert('삭제되었습니다.');
				}
				else{
					alert('삭제 실패')
				}
				window.opener.parent.location.reload(); // 부모창 새로고침 
				window.self.close(); //현재창 닫기
			}, error: function(xhr, status,error){
				console.log(xhr.status+" error: "+error);
			}
		})
	}

	
</script>
</html>