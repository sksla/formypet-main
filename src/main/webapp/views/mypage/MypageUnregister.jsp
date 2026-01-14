<meta charset="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.formypet.mypage.model.vo.Point" %>
<%@ page import="java.util.List, java.util.Date, java.util.ArrayList" %>
<%
	List<Integer> userNoList = (List<Integer>) request.getAttribute("userNoList");
	List<Integer> orderNo = (List<Integer>) request.getAttribute("orderNo");
    List<Date> pointDate = (List<Date>) request.getAttribute("pointDate");
    List<Integer> pointAdd = (List<Integer>) request.getAttribute("pointAdd");
    List<Integer> pointUse = (List<Integer>) request.getAttribute("pointUse");
    List<Integer> pointReason = (List<Integer>) request.getAttribute("pointReason");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 브레드크럼 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/breadcrumb.css">

<!-- 마이페이지 css -->
<script src="<%= request.getContextPath()%>/resources/js/MypageUnregister.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/Mypage.css">

<!-- 회원 탈퇴 전용 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/MypageUnregister.css">

<!--head start-->
    <header>
    	<%@ include file="/views/common/header.jsp"%>
    </header>
    <!--head end-->
    
    <!-- 브레드크럼 start -->
    <div class="breadc">
        <ol>
            <li><a href="<%=request.getContextPath()%>">Home</a></li>
            <li class="separator">&gt;</li>
            <li><a href="<%=request.getContextPath()%>/MypageMain">마이페이지</a></li>
            <li class="separator">&gt;</li>
            <li>회원탈퇴</li>
            
        </ol>
    </div>
    <!-- 브레드크럼 end -->

	<!-- 적립금 페이지 start-->
    <!-- 제목 -->
    <h1 class="contentTitle">회원탈퇴</h1>
    
    <!-- section start -->
    <section>
      <!-- 좌우로 영역 나누기(사이드바, contents) start -->
      <div class="dividing_area1">
      
      
        	<!-- 사이드바 -->
            <div class="sidebar">
            	<%@ include file="/views/mypage/Sidebar.jsp"%>
            </div>
            
            

            <!-- 보여지는 화면 start -->
            <div class="content_div">
            
           		<% 
					int pointTotal = (int)request.getAttribute("pointTotal");
			    	String formattedPointTotal = String.format("%,d", pointTotal);
		    	%>
				<div>
					<div class="div_flex">
						<p>🔸현재 적립금 :</p>
						<p class="font_yellow"><%= formattedPointTotal %>🔸</p>
					</div>
				</div>

				<div class="info">
					<h3> 🚨 회원 탈퇴 안내 🚨 </h1>
					<ul>
						<li>🔷 회원탈퇴는 포마이펫에서 제공하는 온라인 웹사이트를 이용하실 수 없음을 의미합니다.</li>
						<li>🔷 거래 정보 관리를 위해서 회원ID, 상품정보, 거래내역 등의 기본정보는 5년간 보관됩니다.</li>
						<li>🔷 완료되지 않은 주문 거래에 대한 배송/조회는 고객센터(02-2696-8000)를 통해서 확인할 수 있습니다.</li>
						<li>🔷 회원탈퇴를 하시면 적립하신 적립금은 모두 소멸됩니다.</li>
						<li>🔷 회원탈퇴는 포마이펫에서 운영하는 온라인 웹사이트의 주문이 완료되어야 가능합니다.</li>
						<li>🔷 회원탈퇴 처리가 진행되는 과정에서 SMS문자 및 메일이 발송될 수 있습니다.</li>
						<li>🔷 회원 탈퇴 후 재가입시에는 신규가입 혜택이 제공되지 않습니다.</li>
					</ul>
				</div>
				
				<div class="checkbox_div" id="UnregisterCheck">
					<input type="checkbox" id="checkbox">위 내용을 확인 했으며, 회원탈퇴를 진행합니다.
				</div>
				
				<div class="PasswordCheck">
					<p>회원정보 확인을 위해 비밀번호를 입력해주세요.</p>
					비밀번호 : <input type="password" placeholder="비밀번호를 입력해주세요." id="user_Pwd">
				</div>
				
				<a href="<%=request.getContextPath()%>/MypageMain"><button class="UnregisterNo">뒤로가기</button></a>
				<button class="UnregisterOk" onclick="Unregister()">회원탈퇴</button>
				

            </div>
            <!-- 보여지는 화면 end -->
            <!-- ---------------------------------------- -->
        

      </div>
      <!-- 좌우로 영역 나누기(사이드바, contents) end -->
    </section>
    <!-- section end -->
    <!-- 적립금 페이지 End-->
    
    
    <!--footer start-->
    <header>
    	<%@ include file="/views/common/footer.jsp"%>
    </header>
    <!--footer end-->
	

</body>
</html>