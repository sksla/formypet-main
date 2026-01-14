<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.formypet.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>header</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common.css">

<style>

</style>

</head>
<body>
  <div>

    <!--head start-->
    <header class="header-top-section">

      <nav class="header_nav">
        <div width="80%">
          <div class="menu_logo">
            <a href="<%= contextPath %>"><img src="<%=contextPath%>/resources/images/logo.png" style="width: 200px;"></a>

          </div>

          <div class="menu_item" id="menu_e"><a href="<%=contextPath %>/list.ev?page=1">EVENT</a></div>
          <div class="menu_item" id="menu_d"><a href="<%=contextPath %>/list.d?kind=D&page=1">강아지</a></div>
          <div class="menu_item" id="menu_c"><a href="<%=contextPath %>/list.c?kind=C&page=1">고양이</a></div>
          <div class="menu_item" id="menu_r"><a href="<%=contextPath %>/list.rv?page=1">리뷰</a></div>
          <div class="menu_item" id="menu_b"><a href="<%=contextPath %>/list.b?page=1">게시판</a></div>
          <div class="menu_item" id="menu_cs"><a href="<%=contextPath %>/home.cs">고객센터</a></div>
        </div>
       
        <div class="section">
		  <ul class="d-flex list-unstyled justify-content-between">
		    <li class="dropdown">
		      <!-- 비로그인이 아닐 경우 (회원, 관리자) -->
		      <% if(loginUser != null) { %>
		      	<!-- 관리자 로그인 --> 
		        <% if("A".equals(loginUser.getStatus())) { %>
		          <a href="<%=contextPath%>/index.m"><img src="<%=contextPath%>/resources/images/managerHome.png" style="height: 75px; width: 75px; margin-right: 20px;"></a>
		          <a href="<%=contextPath%>/logout.me"><img src="<%=contextPath%>/resources/images/managerLogout.png" style="height: 60px; width: 60px; margin-left: 20px;"></a>
		        
		        <!-- 회원 로그인 -->
		        <% } else { %>
		          <a href="#" data-bs-toggle="dropdown"><img src="<%=contextPath%>/resources/images/main_login.png" style="height: 45px; margin-left: 40px;"></a>
		          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
		            <li>
		              <a class="dropdown-item" href="<%=contextPath%>/MypageMain">마이페이지</a>
		            </li>
		            <li>
		              <a class="dropdown-item" href="<%=contextPath%>/logout.me">로그아웃</a>
		            </li>
		          </ul>
		          
		          
		        <% } %>
		      
		      <!-- 비로그인 -->
		      <% } else { %>
		        <a href="#" data-bs-toggle="dropdown"><img src="<%=contextPath%>/resources/images/main_login.png" style="height: 45px; margin-left: 40px;"></a>
		        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
		          <li>
		            <a class="dropdown-item" href="<%=contextPath%>/loginForm.me">로그인</a>
		          </li>
		          <li>
		            <a class="dropdown-item" href="<%=contextPath%>/signupSelect.me">회원가입</a>
		          </li>
		        </ul>
		      <% } %>
		    
		    </li>
		    
		    <!-- 비로그인, 회원 로그인 -->
		    <% if(loginUser == null || (loginUser != null && !"A".equals(loginUser.getStatus()))) { %>
		      <li>
		        <a href="<%=contextPath %>/search.do"><img src="<%=contextPath %>/resources/images/main_search.png" style="height: 40px; margin-left: 10px;"></a>
		      </li>
		      <li>
		        <a href="<%= contextPath %>/MypageWish"><img src="<%=contextPath %>/resources/images/main_wish.png" style="height: 50px; margin-left: 10px;"></a>
		      </li>
		      <li>
		        <a href="#"><img src="<%=contextPath %>/resources/images/main_cart.png" style="height: 45px; margin-left: 10px;"></a>
		      </li>
		    <% } %>
		  </ul>
		</div>
      </nav>

    </header>
  </div>
    <!--head end-->
</body>
</html>