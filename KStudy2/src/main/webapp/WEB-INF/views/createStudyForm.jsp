  
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
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
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.0.min.js"></script> <!-- 얘 순서 바꾸니까 되네; -->
    <script src="/js/jquery.serialize-object.min.js"></script>
    
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js"></script>
    <link rel="Stylesheet" type="text/css" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css" />
    
    
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
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
    </style>

    
    <!-- Custom styles for this template -->
    <link href="/css/signin.css" rel="stylesheet">
	

</head>
<body class="text-center">
<%       	
	//request.setCharacterEncoding("UTF-8"); 
	//String courseId = request.getParameter("courseId");
    //String courseName = request.getParameter("lecName");
%>
<main class="form-signin">
  <form id="form">
 
    <h1 class="h3 mb-3 fw-normal">스터디 생성하기</h1>	
	    <div style="margin: 10px auto;" class="form-floating">
	      <input type="text" class="form-control" id="floatingName" placeholder="스터디명" name="groupName" required>
	    </div>
	
	    <div style="margin: 10px auto;" class="form-floating">
	      <input type="text" class="form-control" id="floatingSchool" placeholder="학교명" name="schoolName">
	    </div>
	    
	    <div style="margin: 10px auto;" class="form-floating">
	      <!--<input type="text" class="form-control" id="floatingPeople" placeholder="최대인원" name="maxMem">-->
	      <select class="form-control" id="floatingPeople" name="maxMem" required>
	      	  <option value="">최대인원 선택</option>
			  <option>1</option>
			  <option>2</option>
			  <option>3</option>
			  <option>4</option>
			  <option>5</option>
			  <option>6</option>
			  <option>7</option>
			  <option>8</option>
			  <option>9</option>
			  <option>10</option>
			</select>
	    </div>
	    
	    <div style="margin-bottom: 30px;" class="form-floating">
	      <textarea class="form-control" id="floatingDiscript" placeholder="스터디 소개" style="height:130px" name="shortDsc" required></textarea>
	    </div>

	  <input class="w-100 btn btn-lg btn-primary" type="submit" onclick="sendForm()" value="등록하기">
  </form>
  <p class="mt-5 mb-3 text-muted">&copy; 웅진 씽크빅 IT개발실</p>
</main>

<script>
	console.log('${lecture.lecName}');
	

	
	$("#floatingSchool").autocomplete({
	    source : function(request, response) {
	        $.ajax({
	              url : "/college/"+$("#floatingSchool").val(),
	              type : "GET",
	              data : {keyWord : $("#floatingSchool").val()}, // 검색 키워드
	              success : function(data){ // 성공
	              response(
	            		//console.log(data);
	                    $.map(data, function(item) {
	                    	console.log(item);
	                    	
	                        return {
	                              label : item.collegeName,   //목록에 표시되는 값
	                              value : item.collegeName    //선택 시 input창에 표시되는 값
	                        };
	                    })
	                );    //response
	            }
	            ,
	            error : function(){ //실패
	                alert("통신에 실패했습니다.");
	            }
	        });
	    }
	    , minLength : 1    
	    , autoFocus : false    
	    , select : function(evt, ui) {
	        console.log("전체 data: " + JSON.stringify(ui));
	        console.log("검색 데이터 : " + ui.item.value);
	    }
	    , focus : function(evt, ui) {
	        return false;
	    }
	    , close : function(evt) {
	    }
	});
	
	
	//스터디 생성 폼 처리
	function sendForm(){
		var form = $('#form').serializeObject();
		
		
		if(form.groupName!=""&&form.shortDsc!=""&&form.maxMem!=""){
			//alert('학교명을 제외한 정보를 모두 입력해주세요.');
		
			var schoolname = form.schoolName=="" ? "없음" : form.schoolName; 
			
			var formData = {
					lecId : '${lecture.lecId}',
	                groupName : form.groupName,
	                schoolName : schoolname,
	                maxMem : form.maxMem,
	                shortDsc : form.shortDsc,
	                lecName : '${lecture.lecName}'
	        }
			
			 
	
			$.ajax({
				url: '/studygroup',
				type: 'POST',
				async: false,
				contentType: 'application/json',
				data: JSON.stringify(formData),
				success: function(data){
					console.log(data);
				
					window.opener.parent.location.reload(); // 부모창 새로고침 
					window.self.close(); //현재창 닫기
				}, error: function(xhr, status,error){
					console.log(xhr.status+" error: "+error);
				}
			})
		}
	}
	
</script>
	
</body>
</html>