<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        
        <link href='/css/main.css' rel='stylesheet' />
		<script src='/js/main.js'></script>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
		
		<style>
		
            .mt-4-1{
            	margin-bottom: 1rem;
            }
            
            .pagination, .dataTable-pagination ul{
            	padding-left: 750px;
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
                                <font size=5><i class="fas fa-info-circle"></i>&nbsp; ���͵� ����</font>
                            </a>
                            <a class="nav-link" href="<c:url value='/view/schedule/${groupInfo.groupId}'/>">
                                <font size=5><i class="far fa-calendar-alt"></i>&nbsp; ���� ����</font>
                            </a>
                            <a class="nav-link" href="<c:url value='/view/studyboard/${groupInfo.groupId}'/>">
                                <font size=5><i class="far fa-clipboard"></i>&nbsp; ���� �Խ���</font>
                            </a>
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Copyright &copy;</div>
                        ���� ��ũ�� IT ���߽�
                    </div>
                </nav>
            </div>
            
            
            <!-- ���� ���� -->
            <div id="layoutSidenav_content" style="padding-left:300px">
                <main>
                    <div class="container-fluid px-4">       
                        <div style="padding-bottom:80px;">           
	                        <div style="float:left;"><h1 class="mt-4">${groupInfo.groupName}</h1></div>
	                    </div>
	                    
	                    <!-- ���� �ٷΰ��� -->
                        <ol id="lectureName" class="breadcrumb mb-4">
                        </ol>
                        
                        <hr>
                        
                        <!-- �˻�â -->
                        <div style="float:left;" class="mt-4-1">	                        
                        	<select name="searchType" id="searchType">
                        		<option value="����+����">����+����</option>
                        		<option value="�ۼ���">�ۼ���</option>
                        	</select>
                        	<input type="text" id="searchKeyword"><button type="button" id="searchBtn" onclick="search();">�˻�</button>
                        </div>
	                    
	                    <!-- �Խñ� �ۼ� ��ư -->
                        <div style="float:right;" class="mt-4-1"><button class="btn btn-primary" onclick="location.href='/view/studyboard/write/${groupInfo.groupId}'">�۾���</button></div>
                        
                        <!-- �Խñ� ��� -->
                        <div id="board">                	                        		                        
						</div>     
						
						<!-- ����¡ ǥ�� -->
						<div class=container>
		                    <div id="pagination" class="pagination-div">							  	
							</div>   
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
        <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
		<script src="https://unpkg.com/tippy.js@6"></script>
		
        <script type="text/javascript">

        let totalData; //�� ������ ��
        let dataPerPage = 10; //�� �������� ��Ÿ�� �� ��
        let pageCount = 5; //����¡�� ��Ÿ�� ������ ��
        let globalCurrentPage=1; //���� ������
        var groupId = "${groupInfo.groupId}";
        var keyword;
        
        $(document).ready(function(){
        	document.getElementById('searchKeyword').readonly=false;
			lectureInfo();
			totalData = ${groupInfo.postCnt};
			getBoardData(1);
			pagination(totalData, dataPerPage, pageCount, 1, "default");
         });
        
        //���͵� �������� ���� ����
        function lectureInfo(){
        	var lecId = "${groupInfo.lecId}";
        	let html='';
        	html+='<li class="breadcrumb-item active">���͵� �������� ����: <a href="<c:url value="/view/detail?courseId='+encodeURIComponent(lecId)+'"/>" style="text-decoration: none; color: #fb8836;">${groupInfo.lecName}</a></li>'
        	$("#lectureName").append(html);
        }
        
        //�Խñ� ��� ��ȸ
        function getBoardData(page){
        	var groupId = "${groupInfo.groupId}";
        	var lecId = "${groupInfo.lecId}";
        	
        	$("#board").empty()
        	
        	$.ajax({
                url: "/studyboard/"+groupId+"/"+page,
                type: "GET",
                contentType: "application/json; charset=utf-8;",
                dataType: "json",
                success: function(response){
                    
                    let html = '';
                    
                    html += '<table class="table table-hover text-center" style="border: 1px solid;">';
            		html += '<thead>';
            		html += '<tr>';
                	html += '<th>��ȣ</th>';
                	html += '<th>����</th>';
                	html += '<th>�۾���</th>';
                	html += '<th>�ۼ���</th>';
                	html += '<th>��ȸ��</th>';
                	html += '</tr>';
            		html += '</thead>';
            		
            		//var postCnt ="${groupInfo.postCnt}"; //�Խñ� ��ȣ => �׷캰 �� �Խñ� ��  ===> API �����ϱ�,,
            		var postCnt = countTotal();
            		var num = postCnt-dataPerPage*(page-1);
            		if(postCnt==0){
            			html += '<tbody><tr><td colspan="5" algint="center">';
            			html+='<h5>��ϵ� �Խñ��� �����ϴ�.</h5></td></tr>';
            		}
            		else{
	                    $.each(response, function(index, obj){
	                    	console.log(obj)
	                    	
	                    	let dateObj = new Date(obj.regDtm);
	                    	let timeString_KR = dateObj.toLocaleString("ko-KR", {timeZone: "Asia/Seoul"});
	                    	
	            			html += '<tbody>';
	                    	html += '<tr>';
	        				html += '<td>'+num+'</td>';
	        				html += '<td><a href="<c:url value="/view/studyboard/detail/'+groupId+'/'+obj.boardId+'"/>" style="text-decoration: none; color: #000b83">'+obj.title+'</a></td>';
	        				//html += '<td><a href="javascript:void(0);" onclick="getBoardDetail('+obj.boardId+')" style="text-decoration: none; color: #000b83">'+obj.title+'</a></td>';
	        				html += '<td>'+obj.regUser+'</td>';
	        				html += '<td>'+timeString_KR.substring(0,11)+'</td>';
	        				html += '<td>'+obj.viewCnt+'</td>';
	        				html += '</tr>';
	        				num=num-1; //���ҽ�Ű��
	                    })
            		}
                    
                    html += '</tbody>';
                        	
                    html += '</table>';
                    html += '<hr/> ';
                    
					
                    console.log("html")
                    console.log(html)
                    $("#board").append(html)

                },
                error: function(){
                    alert("err");
                }
            });    	
        }
        
		//�˻� �ɼǿ� ���� �Լ� ȣ��
        function search(){
        	var option = $("select[name=searchType]").val();
        	keyword = document.getElementById('searchKeyword').value;
        	
        	if(keyword==""){
        		alert('�˻�� �Է����ּ���.');
        	}
        	else{
	        	if(option=="����+����"){
	        		totalTCData = countSearchTC(keyword);
	        		getSearchData(keyword, 1, totalTCData, 1);
	        		pagination(totalTCData, dataPerPage, pageCount, 1, "TC");
	        	}
	        	
	        	else if(option=="�ۼ���"){
	        		console.log("������ �˻�");
	        		totalWData = countSearchW(keyword);
	        		getSearchData(keyword, 1, totalWData, 2);
	        		pagination(totalWData, dataPerPage, pageCount, 1, "W");
	        	}
        	}
        	
        }
        
        //�˻� ��� ��ȸ
        function getSearchData(keyword, page, searchCnt, option){ 
        	
        	$("#board").empty();
        	
        	$.ajax({
                url: "/studyboard/"+groupId+"/search/"+option+"/"+keyword+"/"+page,
                type: "GET",
                contentType: "application/json; charset=utf-8;",
                dataType: "json",
                success: function(response){
                   
                    let html = '';
                    
                    html += '<table class="table table-hover text-center" style="border: 1px solid;">';
            		html += '<thead>';
            		html += '<tr>';
                	html += '<th>��ȣ</th>';
                	html += '<th>����</th>';
                	html += '<th>�۾���</th>';
                	html += '<th>�ۼ���</th>';
                	html += '<th>��ȸ��</th>';
                	html += '</tr>';
            		html += '</thead>';
            		
            		var postCnt = searchCnt; //�Խñ� ��ȣ => �׷캰 �� �Խñ� ��
            		var num = postCnt-dataPerPage*(page-1);
                    $.each(response, function(index, obj){
                    	console.log(obj)
                    	
                    	let dateObj = new Date(obj.regDtm);
                    	let timeString_KR = dateObj.toLocaleString("ko-KR", {timeZone: "Asia/Seoul"});
                    	
            			html += '<tbody>';
                    	html += '<tr>';
        				html += '<td>'+num+'</td>';
        				html += '<td><a href="<c:url value="/view/studyboard/detail/'+groupId+'/'+obj.boardId+'"/>" style="text-decoration: none; color: #000b83">'+obj.title+'</a></td>';
        				//html += '<td><a href="javascript:void(0);" onclick="getBoardDetail('+obj.boardId+')" style="text-decoration: none; color: #000b83">'+obj.title+'</a></td>';
        				html += '<td>'+obj.regUser+'</td>';
        				html += '<td>'+timeString_KR.substring(0,11)+'</td>';
        				html += '<td>'+obj.viewCnt+'</td>';
        				html += '</tr>';
        				num=num-1; //���ҽ�Ű��
                    })
                    
                    html += '</tbody>';
                        	
                    html += '</table>';
                    html += '<hr/> ';
                    
					
                    console.log("html")
                    console.log(html)
                    $("#board").append(html)

                },
                error: function(){
                    alert("err");
                }
            });
        }
               
        
        //����¡ ǥ��
        function pagination(totalData, dataPerPage, pageCount, currentPage, option){
        	let html='';
        	
        	var postCnt ="${groupInfo.postCnt}"; 
        	        	       	
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
	       	    
	       	    
	       	    globalCurrentPage = selectedPage; //���õ� ������
	       	    console.log("selectedPage "+selectedPage);
	       	    
	       	    //����¡ ǥ�� ��ȣ��
	       	    if(option=="default"){ //��ü ��� ��ȸ��
		       	    pagination(totalData, dataPerPage, pageCount, selectedPage, "default");
		       	    getBoardData(selectedPage);
	       	    }
	       	    else if(option=="TC"){ //����+���� �˻� ��� ��ȸ��
		       	    pagination(totalData, dataPerPage, pageCount, selectedPage, "TC");
		       		getSearchData(keyword, selectedPage, totalData, 1);	       	    	
	       	    }
	       	 	else if(option=="W"){ //�ۼ��� �˻� ��� ��ȸ��
		       	    pagination(totalData, dataPerPage, pageCount, selectedPage, "W");
		       		getSearchData(keyword, selectedPage, totalData, 2);	       	    	
	       	    }
	       	  });

        }
        
        //��ü �Խñ� �˻� ��� ����
        function countTotal(){
        	var cnt;
        	
        	$.ajax({
                url: "/studyboard/count/"+groupId,
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
        	        	
        	console.log(cnt);
        	return cnt;
        }
        
        //����+�ۼ��� �˻� ��� ����
        function countSearchTC(keyword){
        	var cnt;
        	
        	$.ajax({
                url: "/studyboard/countTC/"+groupId+"/"+keyword,
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
        	        	
        	console.log(cnt);
        	return cnt;
        }
        
        //�ۼ��� �˻� ��� ����
        function countSearchW(keyword){
        	var cnt;
        	
        	$.ajax({
                url: "/studyboard/countW/"+groupId+"/"+keyword,
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
        	        	
        	console.log(cnt);
        	return cnt;
        }
        
        /* function getBoardDetail(boardId){
        	
        	$("#board").empty()
        	$.ajax({
                url: "/studyboard/detail/"+boardId,
                type: "GET",
                contentType: "application/json; charset=utf-8;",
                dataType: "json",
                success: function(response){

                    console.log(response);

                    
                    let html = '';
                    
                    html += '<table id="datatable-scroller" class="table table-bordered tbl_Form">';

					html += '<tbody>';
					html += '<tr><th class="tg-yj5y" width=250px>����</th>';
					html += '<td class="tg-0pky"></td>';
					html += '<th class="tg-uqo3" width=250px>�ۼ���</th>';
					html += '<td class="tg-0lax"></td></tr>';
					
					
					html += '<tr><th class="tg-yj5y">�ۼ���</th>';
					html += '<td class="tg-0pky"></td>';
					html += '<th class="tg-uqo3">��ȸ��</th>';
					html += '<td class="tg-0lax"></td> </tr>';
					html += '<tr><th class="tg-yj5y">����</th>';
					html += '<td class="tg-0pky" colspan="3"></td> </tr>';
					html += '</tbody></table></div>';
                
                
					html += '<div style="float:right;" class="mt-4-1"><button class="btn btn-green">����</button></div>';
					html += '<div style="float:right;" class="mt-4-1"><button class="btn btn-red">����</button></div>';

					
                    console.log("html")
                    console.log(html)
                    $("#board").append(html)

                },
                error: function(){
                    alert("err");
                }
            });    	
        } */

        

		</script>
        
    </body>
</html>