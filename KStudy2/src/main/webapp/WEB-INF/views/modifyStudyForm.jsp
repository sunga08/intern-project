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
      	max-width: 800px;
      }
      
      .form-inline .form-control{
      	width: 700px;
      }
      
      .form-inline{
      	width: 800px;
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
<main class="form-signin" style="max-width:900px;">
 
    <h1 class="h3 mb-3 fw-normal">���͵� ���� ����</h1>	
  	<form id="form" class="form-inline" style="width:800px;">
  	
    
    
	    <div style="margin: 10px auto;" class="form-group">
	    <label for="groupName"> ���͵�� &nbsp; &nbsp; &nbsp; </label>
	      	<input type="text" class="form-control" id="groupName" placeholder="���͵��" name="groupName" value="${studyGroup.groupName}" required>
	    </div>
	
	    <div style="margin: 10px auto;" class="form-group">
	    <label for="schoolName"> �б��� &nbsp; &nbsp; &nbsp; &nbsp;</label>
	      	<input type="text" class="form-control" id="schoolName" placeholder="�б���" name="schoolName" value="${studyGroup.schoolName}">
	    </div>
	    
	    <div id="options" style="margin: 10px auto;" class="form-group">
	    <label for="endDate"> �ִ��ο� &nbsp; &nbsp; &nbsp;</label>
	      <!--<input type="text" class="form-control" id="floatingPeople" placeholder="�ִ��ο�" name="maxMem">-->
	    	<select class="form-control" id="maxMem" name="maxMem" required>
	      	  <option value="">�ִ��ο� ����</option>
			  <option <c:if test="${studyGroup.maxMem==1}">selected</c:if>>1</option>
			  <option <c:if test="${studyGroup.maxMem==2}">selected</c:if>>2</option>
			  <option <c:if test="${studyGroup.maxMem==3}">selected</c:if>>3</option>
			  <option <c:if test="${studyGroup.maxMem==4}">selected</c:if>>4</option>
			  <option <c:if test="${studyGroup.maxMem==5}">selected</c:if>>5</option>
			  <option <c:if test="${studyGroup.maxMem==6}">selected</c:if>>6</option>
			  <option <c:if test="${studyGroup.maxMem==7}">selected</c:if>>7</option>
			  <option <c:if test="${studyGroup.maxMem==8}">selected</c:if>>8</option>
			  <option <c:if test="${studyGroup.maxMem==9}">selected</c:if>>9</option>
			  <option <c:if test="${studyGroup.maxMem==10}">selected</c:if>>10</option>
			</select>
	    </div>
	    
	    <div style="margin-bottom: 30px;" class="form-group">
	    <label for="shortDsc"> �Ұ� &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</label>
	      <textarea class="form-control" id="shortDsc" placeholder="������ ���͵� �Ұ��� �Է����ּ���." style="height:130px" name="shortDsc" required>${studyGroup.shortDsc}</textarea>
	    </div>
	    
	    <div style="margin-bottom: 30px;" class="form-group">
	    <label for="longDsc"> �󼼼��� &nbsp; &nbsp; &nbsp;</label>
	      <textarea class="form-control" id="longDsc" placeholder="���͵� � ���, ��Ģ �� �� ������ �Է����ּ���." style="height:230px" name="longDsc">${studyGroup.longDsc}</textarea>
	    </div>
	  
  </form>
  <input class="w-100 btn btn-lg btn-primary" type="submit" onclick="check()" value="����ϱ�">
  <p class="mt-5 mb-3 text-muted">&copy; ���� ��ũ�� IT���߽�</p>
</main>

<script>

	
	function check(){
	
		var form = $('#form').serializeObject();

		if(form.maxMem<${studyGroup.curMem}){
			alert('�����ο����� �ִ��ο��� �۰� ������ �� �����ϴ�.');
		}
		
		else{
			sendForm();
		}

	}
	
	
	function sendForm(){
		var form = $('#form').serializeObject();

		
		if(form.groupName!=""&&form.shortDsc!=""&&form.maxMem!=""){

		
			var schoolname = form.schoolName=="" ? "����" : form.schoolName; 
			

			var formData = {
					groupId : '${studyGroup.groupId}',
	                groupName : form.groupName,
	                schoolName : schoolname,
	                maxMem : form.maxMem,
	                shortDsc : form.shortDsc,
					longDsc : form.longDsc	         
	        }
			
						 
	
			$.ajax({
				url: '/studygroup',
				type: 'PUT',
				async: false,
				contentType: 'application/json',
				data: JSON.stringify(formData),
				success: function(data){
					console.log(data);
					if(data==1){
						alert('���͵� ������ �����Ǿ����ϴ�.');
					}
					else{
						alert('���� ����')
					}
					window.opener.parent.location.reload(); // �θ�â ���ΰ�ħ 
					window.self.close(); //����â �ݱ�
				}, error: function(xhr, status,error){
					console.log(xhr.status+" error: "+error);
				}
			})
		}


	}

	
</script>
	
</body>
</html>