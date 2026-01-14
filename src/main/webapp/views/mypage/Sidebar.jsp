<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이드바</title>
</head>
<body class="body">
	<div class="sidebar">
        <h3>나의 주문</h3>
        <ul>
            <li><a href="<%=request.getContextPath()%>/MypageOrder"><span>주문·교환·반품·취소 내역</span></a></li>
            <li><a href="<%=request.getContextPath()%>/MypageAddress"><span>배송지 관리</span></a></li>
        </ul>
        
        <h3>나의 쇼핑 혜택</h3>
        <ul>
            <li><a href="<%=request.getContextPath()%>/MypagePoint"><span>적립급</span></a></li>
        </ul>
    
        <h3>나의 활동</h3>
        <ul>
            <li><a href="<%=request.getContextPath()%>/MypageWish"><span>위시리스트</span></a></li>
            <!-- <li><a href="<%=request.getContextPath()%>/MypageEvent"><span>이벤트 참여 내역</span></a></li> -->
            <!-- <li><a href=""><span>상품 리뷰</span></a></li> -->
        </ul>
    
        <h3>내 정보</h3>
        <ul>
            <li><a href="<%=request.getContextPath()%>/MypageModification"><span>회원정보 수정</span></a></li>
            <li><a href="<%=request.getContextPath()%>/MypageUnregister"><span>회원 탈퇴</span></a></li>
        </ul>
    </div>
</body>
</html>