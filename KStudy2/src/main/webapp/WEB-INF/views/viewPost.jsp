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
        <script src="/js/jquery.serialize-object.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
        
        <link href='/css/main.css' rel='stylesheet' />
		<script src='/js/main.js'></script>
		
		<style>
		
            .mt-4-1{
            	margin-bottom: 1rem;
            }
            
            .pagination, .dataTable-pagination ul{
            	padding-left: 730px;
            }
            
            .tg  {border-collapse:collapse;border-spacing:0;}
			.tg td{border-style:solid;border-width:0px;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;
			  padding:10px 5px;word-break:normal;}
			.tg th{border-style:solid;border-width:0px;font-family:Arial, sans-serif;font-size:14px;font-weight:normal;
			  overflow:hidden;padding:10px 5px;word-break:normal;}
			.tg .tg-uqo3{background-color:#efefef;text-align:center;vertical-align:top}
			.tg .tg-yj5y{background-color:#efefef;border-color:inherit;text-align:center;vertical-align:top}
			.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
			.tg .tg-0lax{text-align:left;vertical-align:top}
			
			.btn-red {
				color: #fff;
				background-color: #fe4c39;
				border-color: #fe4c39;
			}
				
			.btn-red:hover {
				color: #fff;
				background-color: #fe4c39;
				border-color: #0a58ca;
			}
			
			.btn-green {
				color: #fff;
				background-color: #06AC19;
				border-color: #06AC19;
			}
				
			.btn-green:hover {
				color: #fff;
				background-color: #06AC19;
				border-color: #0a58ca;
			}
			
			
            
   		</style>
		
    </head>
    <body class="sb-nav-fixed">
    <%       	
		request.setCharacterEncoding("UTF-8"); 
       	//String boardId = request.getParameter("boardId");
       	//String groupId = request.getParameter("groupId");
    %>
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
                                <font size=5>���͵� ����</font>
                            </a>
                            <a class="nav-link" href="<c:url value='/view/schedule/${groupInfo.groupId}'/>">
                                <font size=5>���� ����</font>
                            </a>
                            <a class="nav-link" href="<c:url value='/view/studyboard/${groupInfo.groupId}'/>">
                                <font size=5>���� �Խ���</font>
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
                        <ol id="lectureName" class="breadcrumb mb-4">

                        </ol>
                        
                        
                        <h4></h4>
                        <hr>
                        <div style="float:left;" class="mt-4-1"><button class="btn btn-primary" onclick="location.href='/view/studyboard/${groupInfo.groupId}?page=2&searchType=����+����&keyword=����¡'">��Ϻ���</button></div>
                        <div id="board" style="margin-bottom: 100px;">
                        
                        	<table id="datatable-scroller" class="table table-bordered tbl_Form">

								<tbody>
								  <tr>
								    <th class="tg-yj5y" width=250px>����</th>
								    <td class="tg-0pky">${post.title}</td>
								    <th class="tg-uqo3" width=250px>�ۼ���</th>
								    <td class="tg-0lax">${post.regDtm}</td>
								  </tr>
								
								
								  <tr>
								    <th class="tg-yj5y">�ۼ���</th>
								    <td class="tg-0pky">${post.userId}</td>
								    <th class="tg-uqo3">��ȸ��</th>
								    <td class="tg-0lax">${post.viewCnt}</td>
								  </tr>
								  
								  
								  <tr>
								    <td class="tg-0pky" colspan="4"><pre>${post.content}</pre></td>
								  </tr>
								</tbody>
							</table>
                        
<%--                         	<div class="mb-3">					
								<pre>${post.content}</pre>			
							</div>	 --%>
                        
		                    <div style="float:right;" class="mt-4-1"><button class="btn btn-red" onclick="deletePost()">����</button></div>
		                    <div style="float:right; margin-right:10px;" class="mt-4-1"><button class="btn btn-green" onclick="updatePost()">����</button></div>
                        </div>
                    
                    	<hr>
                    	
                    	<!-- ��� ���� -->
                    	<div id="comments" style="margin-bottom:50px;">
                    		<!-- ��� ���� â -->
	                    	<div class="card mb-2">
								<div class="card-header bg-light">
									<i class="fa fa-comment fa"></i> ���
								</div>
								<div class="card-body">
									<ul class="list-group list-group-flush">
									    <li class="list-group-item">
										<form name="form" id="form" role="form">
											<textarea class="form-control" rows="3" name="newComment" id="newComment"></textarea>
										</form>
										<button type="button" class="btn btn-dark mt-3" onClick="addComment()">��� ���</button>
									    </li>
									</ul>
								</div>
							</div>
							
							<div id="commentList">
							<!-- ����� -->
							<!-- <div class="card mt-2">
								<div class="card-header p-2">
									<table>
										<tr class="align-middle">
											<td rowspan="2" class="pr-2"><i class="fa fa-user-o fa-2x"></i></td>
											<td class="ml">11</td>
										</tr>
										<tr>
											<td>
												<font size="2">2020-09-14 22:41:03</font> 
												
											</td>
										</tr>
									</table>
							    </div>
							    <div class="card-body">
									<p class="card-text">������ ����Դϴ�.</p>
									<span class="badge badge-dark" style="cursor:pointer"><a onClick="javascript:showReReplyArea(176,126);">���</a></span>
									<li>
									<button type="button" class="btn btn-dark mt-3" onClick="javascript:showReReplyArea(176,126);">����</button>
									<button type="button" class="btn btn-dark mt-3" onClick="javascript:showReReplyArea(176,126);">����</button>
									<button type="button" class="btn btn-dark mt-3" onClick="showReplyArea()">���</button></li>
								</div>
							</div>
								
								
							���� �Է�â
							<div id="replyInput"  style="display: none !important;">
							<div class="d-flex">
								<div class="p-2"><i class='mt-3 fa fa-reply fa fa-rotate-180' aria-hidden='true'></i></div>
								<div class="flex-fill">
									<div class="card mb-2">
										<div class="card-header bg-light">
										        <i class="fa fa-comment fa"></i> REPLY
										</div>
										<div class="card-body">
											<ul class="list-group list-group-flush">
											    <li class="list-group-item">
									
												<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
												<button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">post reply</button>
											    </li>
											</ul>
										</div>
									</div>
								</div>
							</div>	
							</div>
								
							����	
							<div class="d-flex">
								<div class="p-2"><i class='mt-3 fa fa-reply fa fa-rotate-180' aria-hidden='true'></i></div>
								<div class="flex-fill">
									<div class="card mt-2">
										<div class="card-header">
											<table>
												<tr class="align-middle">
													<td rowspan="2" class="pr-2"><i class="fa fa-user-o fa-2x"></i></td>
													<td class="ml">11</td>
												</tr>
												<tr>
													<td>
														<font size="2">2020-09-14 22:41:11</font> 
														
													</td>
												</tr>
											</table>
										</div>
										<div class="card-body">
											<p class="card-text">������ ����Դϴ�.</p>
											
										</div>
									</div>
								</div>
							</div> -->
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


        var groupId = "${groupInfo.groupId}";
        var boardId="${post.boardId}";
        
        $(document).ready(function(){
        	goLecturePage();
        	getComments();
        });
        

        
        function goLecturePage(){
        	var lecId = "${groupInfo.lecId}";
        	let html='';
        	html+='<li class="breadcrumb-item active">���͵� �������� ����: <a href="<c:url value="/view/detail?courseId='+encodeURIComponent(lecId)+'"/>" style="text-decoration: none; color: #fb8836;">${groupInfo.lecName}</a></li>';
        	$("#lectureName").append(html);
        }
        
        function deletePost(){
        	        	
        	if("${post.userId}"=="${user}"){
	        	var con = confirm('�����Ͻðڽ��ϱ�?');
	           	if(con==true){
		        	$.ajax({
		    			url: '/studyboard/'+boardId,
		    			type: 'DELETE',
		    			async: false,
		    			success: function(data){
		    				console.log(data);
		    				if(data.result=="success"){
		    					alert('�����Ǿ����ϴ�.')
		    					window.location.replace("/view/studyboard/"+groupId);
		    				}
		    				else{
		    					alert('���� ����')
		    				}
		    			}, error: function(xhr, status,error){
		    				console.log(xhr.status+" error: "+error);
		    			}
		    		})
	           	}
        	}
        	else{
        		alert("������ �Խñ� �ۼ��ڸ� �����մϴ�.");
        	}
        }
        
        function updatePost(){
        	if("${post.userId}"=="${user}"){
        		location.href="/view/studyboard/update/"+${groupInfo.groupId}+"/"+${post.boardId};
        	}
        	else{
        		alert("������ �Խñ� �ۼ��ڸ� �����մϴ�.");
        	}
        }
        
		//���â ���̱�/�����       
        function showReplyArea(rid){
        	if($('#replyInput'+rid).css("display")=="none"){	
        		console.log("rid: "+rid);
        		$('#replyInput'+rid).show();
        	}
        	else if($('#replyInput'+rid).css("display")!="none"){
        		$('#replyInput'+rid).hide();
        	}
        }
		
		function showUpdateArea(commentId, rid, content, regUser, useYn){
			if(useYn=="n"){
				alert('������ ����Դϴ�.');
			}
			else{
				if(regUser=="${user}"){
					$('#textArea'+rid).empty();
					let html='';
					html+='<ul class="list-group list-group-flush">';
					html+='<li class="list-group-item">';
					html+='<form name="form" id="updateForm'+rid+'" role="form">';
					html+='<textarea class="form-control" rows="3" name="updateComment" id="updateComment">'+content+'</textarea>';
					html+='</form>';
					html+='<button type="button" class="btn btn-dark mt-3" onClick="updateComment('+rid+','+commentId+')">���</button>';
					html+='&nbsp;<button type="button" class="btn btn-dark mt-3" onClick="getComments()">���</button>';
					html+='</li></ul>';
					$('#textArea'+rid).append(html)
				}
				else{
					alert('������ �����ϴ�.');
				}
			}
		}
        
        function getComments() {
        	$("#commentList").empty();
        	
        	$.ajax({
                url: "/comments/"+groupId+"/"+boardId,
                type: "GET",
                contentType: "application/json; charset=utf-8;",
                dataType: "json",
                success: function(data){
                    console.log(data);
                                    
                    let html = '';
                    var rid = 1;
                    $.each(data, function(index, obj){
                    	console.log(obj)
                    	

                    	
                    	//����
                    	if(obj.depth==0){
                    		html+='<div class="card mt-2">';
        	                html+='<div class="card-header p-2">';
        	                html+='<table><tr class="align-middle">';
        	                html+='<td rowspan="2" class="pr-2"></td>';
        	                html+='<td class="ml"><i class="fas fa-user"></i>&nbsp;'+obj.regUser+'</td></tr>';
        	                html+='<tr><td><font size="2"><i class="far fa-clock"></i>&nbsp;'+obj.regDtm+'</font></td></tr></table>';
        	                html+='</div>';
        	                html+='<div id="textArea'+rid+'" class="card-body">';
        	                html+='<p class="card-text">'+obj.content+'</p>	';
        	                
                    		if(obj.useYn=="n"){						                    	
    	                    	html+='</div>';
    	                    	html+='</div>';
                        	}
                    		else{					
		                    	html+='<li style="list-style: none;"><button type="button" class="btn btn-dark mt-3" onClick="showUpdateArea('+obj.commentId+','+rid+',\''+obj.content+'\',\''+obj.regUser+'\',\''+obj.useYn+'\')">����</button>';
		                    	html+='&nbsp;<button type="button" class="btn btn-dark mt-3" onClick="deleteOriginalComment('+obj.commentId+',\''+obj.regUser+'\',\''+obj.useYn+'\')">����</button>';		                    	
		                    	html+='&nbsp;<button type="button" class="btn btn-dark mt-3" onClick="showReplyArea('+rid+')">���</button></li>';
		                    	html+='</div>';
		                    	html+='</div>';
                    		}
                    	}
                    	
                    	//���
                    	else if(obj.depth==1){		
                    		html+='<div class="d-flex">';
	                    	html+='<div class="p-2"><i class="mt-3 fa fa-reply fa fa-rotate-180" aria-hidden="true"></i></div>';
	                    	html+='<div class="flex-fill"><div class="card mt-2">';
	                    	html+='<div class="card-header">';
	                    	html+='<table><tr class="align-middle">';
	                    	html+='<td rowspan="2" class="pr-2"></td>';
	                    	html+='<td class="ml"><i class="fas fa-user"></i>&nbsp;'+obj.regUser+'</td></tr>';
	                    	html+='<tr><td><font size="2"><i class="far fa-clock"></i>&nbsp;'+obj.regDtm+'</font></td></tr>';
	                    	html+='</table></div>';
	                    	html+='<div id="textArea'+rid+'" class="card-body"><p class="card-text">'+obj.content+'</p>';
	                    	html+='<li style="list-style: none;"><button type="button" class="btn btn-dark mt-3" onClick="showUpdateArea('+obj.commentId+','+rid+',\''+obj.content+'\',\''+obj.regUser+'\')">����</button>';
	                    	html+='&nbsp;<button type="button" class="btn btn-dark mt-3" onClick="deleteComment('+obj.commentId+',\''+obj.regUser+'\')">����</button></div>';
	                    	html+='</div></div></div>';  
                    	}
                    	
                    	
						
                    	//��� ���� â
                    	html+='<div id="replyInput'+rid+'"  style="display: none !important;">';
                    	html+='<div class="d-flex">';
                    	html+='<div class="p-2"><i class="mt-3 fa fa-reply fa fa-rotate-180" aria-hidden="true"></i></div>';
                    	html+='<div class="flex-fill">';
                    	html+='<div class="card mb-2">';
                    	html+='<div class="card-header bg-light"><i class="fa fa-comment fa"></i>���</div>';
                    	html+='<div class="card-body">';
                    	html+='<ul class="list-group list-group-flush">';
                    	html+='<li class="list-group-item">';
                    	html+='<form id="replyForm'+rid+'" name="replyForm" role="form"><textarea class="form-control" id="replyComment" name="replyComment" rows="3"></textarea></form>';
                    	html+='<button type="button" class="btn btn-dark mt-3" onClick="addReplyComment('+obj.bundleId+','+rid+')">��� ���</button></li>';
                    	html+='</ul></div></div></div></div></div>';
						
					
                    	rid = rid+1;
                    	
                    })
                    
                    $("#commentList").append(html)
                    
                },
                error: function(){
                    alert("err");
                }
            });
        }
        
        
        function addComment(){
        	var form = $('#form').serializeObject();

    		if(form.newComment!=""){
    			var formData = {
    						groupId : groupId,   
    						boardId : boardId,
    		                content : form.newComment	                       
    		   	}
    										 	
    			$.ajax({
    				url: '/comment',
    				type: 'POST',
    				contentType: 'application/json',
    				data: JSON.stringify(formData),
    				success: function(data){
    					console.log(data);
    					if(data==1){
    						alert('��ϵǾ����ϴ�');
    						$('#newComment').val('');
    						getComments();
    						//window.location.replace("/view/studyboard/"+groupId);
    					}
    					else{
    						alert('��� ����');
    					}

    				}, error: function(xhr, status,error){
    					console.log(xhr.status+" error: "+error);
    				}
    			})
    		}
        }
        
        function addReplyComment(bundleId, rid){
        	var form = $('#replyForm'+rid).serializeObject();
			console.log(form);
			//var newStr = "replyComment"+rid;
			
    		if(form.replyComment!=""){
    			var formData = {
    						groupId : groupId,   
    						boardId : boardId,
    						bundleId : bundleId,
    		                content : form.replyComment                     
    		   	}
    										 	
    			$.ajax({
    				url: '/comment/reply',
    				type: 'POST',
    				contentType: 'application/json',
    				data: JSON.stringify(formData),
    				success: function(data){
    					console.log(data);
    					if(data==1){
    						getComments();
    						//window.location.replace("/view/studyboard/"+groupId);
    					}
    					else{
    						alert('��� ����');
    					}

    				}, error: function(xhr, status,error){
    					console.log(xhr.status+" error: "+error);
    				}
    			})
    		}
        }
        
        function deleteComment(commentId, register){
       	    
        	if(register=="${user}"){
	        	var con = confirm('�����Ͻðڽ��ϱ�?');
	           	if(con==true){
		        	$.ajax({
		    			url: '/comment/'+commentId,
		    			type: 'DELETE',
		    			success: function(data){
		    				console.log(data);
		    				if(data==1){
		    					alert('�����Ǿ����ϴ�.')
		    					getComments();
		    				}
		    				else{
		    					alert('���� ����')
		    				}
		    			}, error: function(xhr, status,error){
		    				console.log(xhr.status+" error: "+error);
		    			}
		    		})
	           	}
        	}
        	else{
        		alert("������ �����ϴ�.");
        	}
        	
        }
        
        function deleteOriginalComment(commentId, register, useYn){
        	console.log(commentId);
        	if(useYn=="n"){
        		alert('������ ����Դϴ�.');
        	}        	
        	else{
	        	if(register=="${user}"){
		        	var con = confirm('�����Ͻðڽ��ϱ�?');
		           	if(con==true){
			        	$.ajax({
			    			url: '/comment/original/'+commentId,
			    			type: 'PUT',
			    			success: function(data){
			    				console.log(data);
			    				if(data==1){
			    					alert('�����Ǿ����ϴ�.')
			    					getComments();
			    				}
			    				else{
			    					alert('���� ����')
			    				}
			    			}, error: function(xhr, status,error){
			    				console.log(xhr.status+" error: "+error);
			    			}
			    		})
		           	}
	        	}
	        	else{
	        		alert("������ �����ϴ�.");
	        	}
        	}
        }
        
        function updateComment(rid, commentId){
        	var form = $('#updateForm'+rid).serializeObject();
        	
        	var formData = {
					commentId : commentId,   
	                content : form.updateComment                     
        	}
        	
        	$.ajax({
    			url: '/comment',
    			type: 'PUT',
    			contentType: 'application/json',
				data: JSON.stringify(formData),
    			success: function(data){
    				console.log(data);
    				if(data==1){
    					alert('�����Ǿ����ϴ�.')
    					getComments();
    				}
    				else{
    					alert('���� ����')
    				}
    			}, error: function(xhr, status,error){
    				console.log(xhr.status+" error: "+error);
    			}
    		})
        }
		</script>
        
    </body>
</html>