<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.formypet.common.model.vo.PageInfo"%>
<%@page import="com.formypet.event.model.vo.Event"%>
<%@page import="java.util.List"%>

<%
	List<Event> list = (List<Event>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event detail page</title>

  <style>
     .event-area {
      padding-top: 30px;
      display: flex;
      padding:15px;
      text-align: center;
      flex-direction: column;
    }
    .event{
      display: flex;
      flex-wrap:wrap;
      
      justify-content: space-around;
      
    }
    .e-img{
    	width:300px;
    }
   
    .e-detail-area{
      padding-top: 30px;
      padding-bottom: 20px;
      border: 4px double; 
      margin-bottom: 40px; 
      text-align: center;
    }
  </style>
</head>
<body>
	<div class="wrap">

		<!--head start-->
		<%@ include file="/views/common/header.jsp"%>
		<!--head end-->

		<!--section start-->
    	<section class="main_content">
    	<div style="width:80%;">
			<div class="event">
			<%if(list != null){ 
				for(Event e : list){ %>
				<div class="event-area">
				<input type="hidden" value="<%=e.getEventNo() %>">
					<img src="<%=contextPath +"/"+e.getEventMainImgPath() %>" class="e-img">
					<div class="e-detail">
						<h5 class="e-title"><%=e.getEventTitle() %></h5>
						<p class="e-text">이벤트 내용</p>
					</div>
				</div>
				<%} %>
			<%} %>
			</div>
			<!-- <div class="pagination pagination-sm justify-content-center"> -->
	        <ul class="pagination pagination-sm justify-content-center">
	          <%if(pi.getCurrentPage() == 1){ %>
	                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a></li>
                    <%} else{ %>
	                <li class="page-item">
	                	<a class="page-link" 
	                	href="<%=contextPath%>/list.e?page=<%=pi.getCurrentPage() - 1%>" 
	                	tabindex="-1" aria-disabled="true">
	                	&lt;
	                	</a>
	                </li>
	                <%} %>
	                <%for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
		                <%if(p == pi.getCurrentPage()){ %>
		                	<li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
		                <%} else{ %>
		                	<li class="page-item">
		                		<a class="page-link" href="<%=contextPath%>/list.e?page=<%=p%>"><%=p %></a>
		            		</li>
	                    	<%} %>
                    <%} %>
                    <%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&gt;</a></li>
                    <%} else{ %>
                    	<li class="page-item">
                    		<a class="page-link" href="<%=contextPath%>/list.e?page=<%=pi.getCurrentPage() + 1%>">&gt;</a>
                    	</li>
                 	<%} %>
            </ul>
	    
		
		</div>
		</section>
    <!--section end-->
    
    <script>
	    function setPageBackground() {
	        // 현재 페이지 번호 가져오기
	        var currentPage = <%= pi.getCurrentPage() %>;
	        // 페이지 숫자 요소들을 가져옴
	        var pageItems = document.querySelectorAll('.page-item');
	
	        // 각 페이지 숫자 요소에 대해 현재 페이지에 해당하는 요소에 active 클래스 추가
	        pageItems.forEach(function(item) {
	            if (parseInt(item.innerText) === currentPage) {
	                item.classList.add('active');
	            }
	        });
	    }
	
	    // 페이지 로드가 완료되면 배경색 변경 함수를 호출
	    window.onload = function() {
	        setPageBackground();
	    };
	    
	    $(function(){
	    	$(".event-area").click(function(){
	    		location.href = "<%=contextPath%>/detail.e?no="+$(this).children().eq(0).val();
	    	})
	    })
    </script>



		<!--footer start-->
		<%@ include file="/views/common/footer.jsp"%>
		<!--footer end-->


	</div>




	</div>


</body>
</html>