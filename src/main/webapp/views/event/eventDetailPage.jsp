<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.formypet.event.model.vo.*" %>
<%
	Event ev = (Event)request.getAttribute("ev");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event detail page</title>

  <style>
    .event_content {
      padding-top: 30px;
    }

    .event_content img {
      padding: 20px;
    }

    button {
      float: right;
      font-size: smaller;
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
			<% if(ev !=null){%>
			    <div class="e-detail-body">
			        <button class="move_list">이벤트 목록</button>
			        <br>
			        <br>
			        <div class="e-detail-area">
			            <h2><%= ev.getEventTitle() %></h2>
			            <div class="event_content">
			                <img src="<%= contextPath + '/' + ev.getEventMainImgPath() %>"> <br>
			                <br>
			                <br>
			                <pre>
			      <!-- 이벤트 상세 이미지 -->
			                </pre>
			            </div>
			        </div>
			    </div>
			<% } %>


		</section>
		<!--section end-->
		<script>
		$(function(){
			
			$(".move_list").click(function(){
	    		location.href = "<%=contextPath%>/list.e?page=1";
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