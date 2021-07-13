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
		       title="Ŭ���ϸ� â�� �����ϴ�.">
		    ���⿡ ���â ������ �����ݴϴ�.<br>
		    �̹������� ���� ���̾ �����ϴ�.
		  </div>
		</div>-->

	   	<div style="margin-bottom:100px">
	   		<div style="float:left"><h3>�� ���Ƿ� �������� ���͵�</h3></div>

	   		<div style="float:right"><a class="btn btn-primary" onclick="createStudy()">���͵� �����ϱ�</a></div>
	   	</div>
    	<!-- <div><a class="btn btn-primary" href="#" onclick="createStudy()">���͵� �����ϱ�</a></div>-->

        
        <!-- ���͵� Content -->
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
        
        
        <!-- ���� ���� -->
        <!-- <div style="margin-bottom:100px">
	   		<div style="float:left"><h3>���� ����</h3></div>
	   	</div>-->

        
        <!-- ���� Content-->
        <div id="bookData" class="row gx-4 gx-lg-5">

        </div>
        
        
    </div>
		 
    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; ���� ��ũ�� IT���߽�</p></div>
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
     
    let totalData; //�� ������ ��
    let dataPerPage = 6; //�� �������� ��Ÿ�� �� ��
    let pageCount = 5; //����¡�� ��Ÿ�� ������ ��
    let globalCurrentPage=1; //���� ������
     
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

         // ��� div �ڿ� ��������� ���̾�
         var bg = document.createElement('div');
         bg.setStyle({
             position: 'fixed',
             zIndex: zIndex,
             left: '0px',
             top: '0px',
             width: '100%',
             height: '100%',
             overflow: 'auto',
             // ���̾� ������ ���⼭ �ٲٸ� ��
             backgroundColor: 'rgba(0,0,0,0.4)'
         });
         document.body.append(bg);

         // �ݱ� ��ư ó��, �ò��� ���̾�� ��� div �����
         modal.querySelector('.modal_close_btn').addEventListener('click', function() {
             bg.remove();
             modal.style.display = 'none';
         });

         modal.setStyle({
             position: 'fixed',
             display: 'block',
             boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

             // �ò��� ���̾� ���� ��ĭ ���� ���̱�
             zIndex: zIndex + 1,

             // div center ����
             top: '50%',
             left: '55%',
             transform: 'translate(-50%, -50%)',
             msTransform: 'translate(-50%, -50%)',
             webkitTransform: 'translate(-50%, -50%)'
         });
     }

     // Element �� style �ѹ��� ������Ʈ�� �����ϴ� �Լ� �߰�
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
             	html += '<p>������� | '+data.orgName+'<br>';
             	html += '�����  | '+data.teachers+'<br>'; 
             	html += '��ϱⰣ | '+data.enrollStart.substring(0,10)+'~'+data.enrollEnd.substring(0,10)+'</p>';
             	html += '<li><a class="btn btn-primary" href="'+data.lecUrl+'" target="_blank">���� �ٷΰ���</a>';
             	
             	html += '<button type="button" class="btn btn-primary" id="modal_btn">������� ����</button>';
             	html += '<button type="button" class="btn btn-primary" id="modal_btn2">������� ����</button></li>';

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
                	html += '<div style="margin-top:100px;margin-bottom:100px;text-align:center;"><h5>���� ������ ���͵� �����ϴ�.</h3></div>';	
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
                    html += '<p class="card-text"> �б��� | '+obj.schoolName+'<br/> �ο�  | '+obj.curMem+' / '+obj.maxMem+'<br/> ������ | '+timeString_KR.substring(0,11)+'<br/> ������ | '+obj.regUser+'</p>';
                    html += '</div>';
                    if(checkJoin(obj.groupId,0)==0){
                    	html += '<div class="card-footer"><a class="btn btn-red btn-sm" style="cursor: default;">���Ե� �׷�</a></div>';
                    }
                    else if(checkJoin(obj.groupId,0)==1){
                    	html += '<div class="card-footer"><a class="btn btn-primary btn-sm" onclick="checkJoin('+obj.groupId+',1)">�����ϱ�</a></div>';
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
                
                html += '<div style="margin-top:50px;margin-bottom:50px;text-align:center;"><h5>���� ������ �����ϴ�.</h3></div>';	
                

                $("#bookData").append(html)

            },
            error: function(){
                alert("err");
            }
        });

    }
    
    
    function createStudy(){
    	window.open('/studygroup/add/'+encodeURIComponent("<%=id%>"), '���͵� �����ϱ�','width=800, height=500');
    	window.opener.document.getElementById('form').submit();

    }
    
    function joinStudyAlert(groupId){

    	$.ajax({
            url: "/studygroup/"+groupId,
            type: "GET",
            dataType: "json",            
            success: function(groupData){

                console.log('groupData:'+groupData);
                          
               	var con = confirm('���͵� ������ �����մϴ�. �����Ͻðڽ��ϱ�?');
               	if(con==true){
               		joinStudy(groupData);                		
               		location.reload();
               	}
            },
            error: function(){
                alert("����â ����");
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
					alert('������ �Ϸ�Ǿ����ϴ�.');	
				}
				else{
					alert('������ �����Ͽ����ϴ�.');
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
					//alert('�̹� ���Ե� �׷��Դϴ�.');	
					check=data;
				}
				else if(data==-1 && tmp==1){
					alert('�ο��� ������ ������ �� �����ϴ�.');
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
	  	        	       	
	  	totalPage = Math.ceil(totalData / dataPerPage); //�� ������ ��

	  	
	   	  if(totalPage<pageCount){ //��ü������ ��<����¡�� ��Ÿ�� ������ ��
	   	    pageCount=totalPage; //����¡�� ��Ÿ�� ������ �� = ��ü������ ��
	   	  }
	   	  
	   	  let pageGroup = Math.ceil(currentPage / pageCount); // ������ �׷� (����������/����¡�� ��Ÿ�� ������ ��) = 1(1~5), 2(6~10)...
	   	  let last = pageGroup * pageCount; //ȭ�鿡 ������ ������ ������ ��ȣ
	   	  
	   	  
	   	  if (last > totalPage) {
	   	    last = totalPage;
	   	  }
	
	   	  let first = (pageGroup-1)*pageCount+1; //ȭ�鿡 ������ ù��° ������ ��ȣ
	   	  let next = last + 1;
	   	  let prev = first - 1;
	
	   	  let pageHtml = "";
	   	  
	   	  pageHtml += '<ul class="pagination">';
	
	   	  if (prev > 0) {
	   	    pageHtml += "<li class='page-item'><a class='page-link' id='prev' href='#'>&laquo;</a></li>";
	   	  }
	
	   	 //����¡ ��ȣ ǥ�� 
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
	       	    
	       	    //���������� ������ ������ ��ȣ�� ��´�...
	       	    globalCurrentPage = selectedPage;
	       	    console.log("selectedPage "+selectedPage);

       	    	//����¡ ǥ�� ��ȣ��
	       	    if(option=="study"){
	       	   		pagination(totalData, dataPerPage, pageCount, selectedPage, "study");
		       	    getStudyData(selectedPage);
	       	    }

	       	    
	       	  });
       	

    }
    
    </script>
    
    
</body>
</html>