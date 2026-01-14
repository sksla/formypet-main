<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


				<!-- 카카오 로그인 기능 완벽히 수행 후 로그아웃 기능 수정예정
		          <script>
		          sessionStorage.setItem('loginType', 'normal');
		          sessionStorage.setItem('loginType', 'kakao');
		          
		          function logout() {
		        	    var loginType = sessionStorage.getItem('loginType');
		        	    if (loginType === 'normal') {
		        	        // 일반 회원 로그아웃 함수 호출
		        	        location.href = '<%=//contextPath%>/logout';
		        	    } else if (loginType === 'kakao') {
		        	        // 카카오 로그아웃 함수 호출
		        	        kakaoLogout();
		        	    } else {
		        	        alert('Unknown login type');
		        	    }
		          }
		          
		          
		          function kakaoLogout() {
		                if (!Kakao.Auth.getAccessToken()) {
		                	alert('로그인 상태가 아닙니다.');
		                    return;
		                }
		                Kakao.Auth.logout(function() {
		                    alert('로그아웃 되었습니다.' + Kakao.Auth.getAccessToken());
		                });
		          }
		              
		          </script>
		          -->

</body>
</html>