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
        
        <link href='/css/main.css' rel='stylesheet' />
		<script src='/js/main.js'></script>
		
		<style>
			#container{
				width: 600px;
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
            
             .popper,.tooltip {
			    position: absolute;
			    z-index: 9999;
			    background: #FFC107;
			    color: black;
			    width: 150px;
			    border-radius: 3px;
			    box-shadow: 0 0 2px rgba(0,0,0,0.5);
			    padding: 10px;
			    text-align: center;
			  }
			  .style5 .tooltip {
			    background: #1E252B;
			    color: #FFFFFF;
			    max-width: 200px;
			    width: auto;
			    font-size: .8rem;
			    padding: .5em 1em;
			  }
			  .popper .popper__arrow,
			  .tooltip .tooltip-arrow {
			    width: 0;
			    height: 0;
			    border-style: solid;
			    position: absolute;
			    margin: 5px;
			  }
			
			  .tooltip .tooltip-arrow,
			  .popper .popper__arrow {
			    border-color: #FFC107;
			  }
			  .style5 .tooltip .tooltip-arrow {
			    border-color: #1E252B;
			  }
			  .popper[x-placement^="top"],
			  .tooltip[x-placement^="top"] {
			    margin-bottom: 5px;
			  }
			  .popper[x-placement^="top"] .popper__arrow,
			  .tooltip[x-placement^="top"] .tooltip-arrow {
			    border-width: 5px 5px 0 5px;
			    border-left-color: transparent;
			    border-right-color: transparent;
			    border-bottom-color: transparent;
			    bottom: -5px;
			    left: calc(50% - 5px);
			    margin-top: 0;
			    margin-bottom: 0;
			  }
			  .popper[x-placement^="bottom"],
			  .tooltip[x-placement^="bottom"] {
			    margin-top: 5px;
			  }
			  .tooltip[x-placement^="bottom"] .tooltip-arrow,
			  .popper[x-placement^="bottom"] .popper__arrow {
			    border-width: 0 5px 5px 5px;
			    border-left-color: transparent;
			    border-right-color: transparent;
			    border-top-color: transparent;
			    top: -5px;
			    left: calc(50% - 5px);
			    margin-top: 0;
			    margin-bottom: 0;
			  }
			  .tooltip[x-placement^="right"],
			  .popper[x-placement^="right"] {
			    margin-left: 5px;
			  }
			  .popper[x-placement^="right"] .popper__arrow,
			  .tooltip[x-placement^="right"] .tooltip-arrow {
			    border-width: 5px 5px 5px 0;
			    border-left-color: transparent;
			    border-top-color: transparent;
			    border-bottom-color: transparent;
			    left: -5px;
			    top: calc(50% - 5px);
			    margin-left: 0;
			    margin-right: 0;
			  }
			  .popper[x-placement^="left"],
			  .tooltip[x-placement^="left"] {
			    margin-right: 5px;
			  }
			  .popper[x-placement^="left"] .popper__arrow,
			  .tooltip[x-placement^="left"] .tooltip-arrow {
			    border-width: 5px 0 5px 5px;
			    border-top-color: transparent;
			    border-right-color: transparent;
			    border-bottom-color: transparent;
			    right: -5px;
			    top: calc(50% - 5px);
			    margin-left: 0;
			    margin-right: 0;
			  }
			  
			  .add-button{
			  	position:absolute;
			  	top: 1px;
			  	right: 230px;
			  	background: #2C3E50;
			  	border: 0;
			  	color: white;
			  	height: 35px;
			  	border-radius: 3px;
			  	width: 157px;
			  
			  }
   	</style>
		
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="<c:url value='/main'/>">K-STDUY</a>
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
                                <font size=5>스터디 정보</font>
                            </a>
                            <a class="nav-link" href="<c:url value='/view/schedule/${groupInfo.groupId}'/>">
                                <font size=5>일정 관리</font>
                            </a>
                            <a class="nav-link" href="<c:url value='/view/studyboard/${groupInfo.groupId}'/>">
                                <font size=5>자유 게시판</font>
                            </a>
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Copyright &copy;</div>
                        웅진 씽크빅 IT 개발실
                    </div>
                </nav>
            </div>
            
            
            <!-- 메인 내용 -->
            <div id="layoutSidenav_content" style="padding-left:300px">
                <main>
                    <div class="container-fluid px-4">       
                        <div style="padding-bottom:80px;">           
	                        <div style="float:left;"><h1 class="mt-4">${groupInfo.groupName}</h1></div>
	                    </div>
                        <ol id="lectureName" class="breadcrumb mb-4">

                        </ol>
                        <hr>
                        
                        
                        <div id="calendar" style="position: relative; height:850px; width: 90%">
                        	
                        </div>
                        
                        <div id="my_modal">
            				일정 상세 확인 창
            				<a class="modal_close_btn" id="modalButton" href='javascript:void(0);' style="text-decoration: none; color: #fb8836;">닫기</a>
        				</div>
                        
                    </div>
                </main>
                
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; 웅진 씽크빅 IT 개발실</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
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


        $(document).ready(function(){
        	goLecturePage();
         	cal();
         });
        
        
        
        function modal(id) {
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
        };

        function goLecturePage(){
        	var lecId = "${groupInfo.lecId}";
        	let html='';
        	html+='<li class="breadcrumb-item active">스터디 진행중인 강의: <a href="<c:url value="/view/detail?courseId='+encodeURIComponent(lecId)+'"/>" style="text-decoration: none; color: #fb8836;">${groupInfo.lecName}</a></li>'
        	$("#lectureName").append(html);
        }
        
	      function cal(){
	    	  var groupId = "${groupInfo.groupId}";
	    	  $.ajax({
	      		url: '/schedule/'+groupId,
	      		type: 'GET',
	      		success: function(res){
	      			var list = res;
	      			console.log(list);
	      			
	      			
	       			var calendarEl = document.getElementById('calendar');
	      			
	       			
	       			
	      			var events = list.map(function(item) {
	      				var endd = new Date(item.endDate);
	      				endd.setDate(endd.getDate()+1);
	      				console.log(endd);
	      				
	      				return {
	  						title : item.planTitle,
	  						start : item.startDate,
	  						end : endd,
	  						description : item.planContent,
	  						allDay : item.allDay,
	  						id : item.scheduleId
	  					}
	      			});
	      			
	  				var calendar = new FullCalendar.Calendar(calendarEl, {
	  					customButtons: {
	  					    myCustomButton: {
	  					      text: '일정 추가',
	  					      click: function() {
	  					        alert('clicked the custom button!');
	  					      }
	  					    }
	  					  },
	  					  headerToolbar: {	  						 	  					    
	  					  	left: 'myCustomButton',
	  					    center: 'title',
	  					  	right: 'today prev,next'
	  					  },
	  					editable: true,
	  		          	selectable: true,
	  		          	businessHours: true,
	  		          	dayMaxEvents: true,
	  		          	nextDayThreshold: '01:00:00',
	  		          	
		  		        eventDidMount: function(info) {
		  		          tippy(info.el, {
		  		        	  title: info.event.extendedProps.title,
		  		              content:  "상세설명: "+info.event.extendedProps.description//이벤트 디스크립션을 툴팁으로 가져옵니다. 
		  		          });
		  		          
		  		        },
	  					events : events,
	  					eventTimeFormat: { // like '14:30:00'
						    hour: '2-digit',
						    minute: '2-digit',
						    hour12: false
						},
						
	  					//eventMouseEnter: function(enter){
	  					//	modal('my_modal');
	  					//},
	  					//eventMouseLeave: function(leave){
	  					//	document.getElementById("modalButton").click();
	  					//},
	  					//eventDidMount: function(info) {
					    //    var to oltip = new Tooltip(info.el, {
					   //       title: info.event.title,
					    //      placement: 'top',
					    //      trigger: 'hover',
					    //      container: 'body'
					   //     });
					    //},
	  					eventClick: function(info) {
	     						console.log(info);
	  				        //alert(
	  				        //  '수정 창 연결'  + info.event.title + ' '+ info.event.start + ' ' + info.event.end + '\n ID: '+ info.event.id			           
	  				       // );
	  				        //alert(info.event.end);
	  				        //var endd = new Date(info.event.end);
		      				//endd.setDate(endd.getDate());
		      				//var endStr = endd.toISOString().substr(0,10);
	  				      	window.open('/view/schedule/edit/'+info.event.id, '일정 수정','width=800, height=500');
	  				   },
					    
					  
	  				   select: function(info){
	  						console.log('selected '+info.startStr+' to '+info.endStr);
	  						var end = new Date(info.endStr);
		      				end.setDate(end.getDate()-1);
		      				var endStr = end.toISOString().substr(0,10);
		      				console.log(end.toISOString().substr(0,10));
	  						window.open('/view/schedule/add/'+${groupInfo.groupId}+'?startStr='+info.startStr+'&endStr='+endStr, '일정 추가','width=800, height=500');
	  				   }
	  				   
	  				   
	  				});
	  				//calendar.on('dateClick', function(info){
	  				//	alert(info.event.start);
	  				//});
	  				calendar.render();
	  				
	  				
	      		}
	      	});
	      }

		</script>
        
    </body>
</html>