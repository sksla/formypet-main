<%@page import="com.formypet.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인 전 : null
	// 로그인 성공 후 : 로그인한 회원 데이터가 담겨있는 Member
	
	// jsp에서는 session객체 곧바로 접근 가능(생성구문 X)
	String alertMsg = (String)session.getAttribute("alertMsg");
	// 서비스 요청 전 : null
	// 서비스 요청 성공 후 : alert 띄워주고자하는 알람 문구
	
	
	if(loginUser == null || !loginUser.getStatus().equals("A")){
		
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>회원등록 페이지</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <!-- <link href="resources/img/favicon.png" rel="icon"> -->
  <!-- <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon"> -->

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<%=contextPath %>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=contextPath %>/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="<%=contextPath %>/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="<%=contextPath %>/resources/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="<%=contextPath %>/resources/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="<%=contextPath %>/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="<%=contextPath %>/resources/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<%=contextPath %>/resources/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>


	<% if(alertMsg != null) { // alert시킬만한 알람문구가 존재할 경우 %>
	<script>
		alert('<%=alertMsg%>');
		//alert('성공적으로 회원가입 되었습니다!');

	</script>
	<% 
		session.removeAttribute("alertMsg");
	   } 
	
	%>
	<% if(loginUser == null || !loginUser.getStatus().equals("A")){ %>
	<script>
		alert("관리자만 접근 가능한 페이지입니다!!");
		location.href = "<%=contextPath%>";
	</script>
	<% } %>
	
	

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="<%=contextPath %>" class="logo d-flex align-items-center">
        <img src="<%=contextPath %>/resources/images/logo.png" alt="로고">
        <span class="d-none d-lg-block">포마이펫</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
        <li class="nav-item pe-3">
          <!-- 프로필이미지 -->
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="<%=contextPath %>">
            <!-- 로그인 전 -->
            <img src="<%=contextPath %>/resources/images/managerLogout.png" class="rounded-circle">
          </a><!-- End Profile Iamge Icon -->
        </li>
        <!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

</body>
</html>