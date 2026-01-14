<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 기능</title>
</head>

<!-- 날짜 기능 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/MypageDate.css">
  
<body>
	<!-- 다른 페이지에서 가져다 쓰는 달력 기능 -->
	<div class="dateTab">
		<div class="date_left mouse_hover">
			<div class="tab div_selected" onclick="openTab(event, 'tab1')">1개월</div>
			<div class="tab div_NoSelected" onclick="openTab(event, 'tab2')">3개월</div>
			<div class="tab div_NoSelected" onclick="openTab(event, 'tab3')">6개월</div>
			<div class="tab div_NoSelected" onclick="openTab(event, 'tab4')">12개월</div>
	    </div>
	    <div class="date_right">
	        <input type="date" id="startDate">
	        ~
	        <input type="date" id="endDate">
	
	
	    </div>
	</div>

</body>
</html>