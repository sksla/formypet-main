<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포마이펫 회원가입</title>
<style>

.main_content>div{
    /* border: 2px solid #1ABC9C; */
    width: 80%;
    margin: auto;
    margin-top:0px;
    margin: bottom 50px; 
    min-height: 700px;
    padding: 50px;
    border-radius: 10px;
    
}

*{
    padding: 0;
    margin: 0;
    border: none;
}
body{
    font-size: 14px;
    font-family: 'Roboto', sans-serif;
}

.signup-select-wrapper {
    width: 100%;
    height: 20%;
    display: flex;
    align-items: center;
    flex-direction: column;
    box-sizing: border-box;
}

.signup-select-wrapper > * {
    margin: 10px 0;
    text-align: center;
}

.signup-common button[type="button"]{
    width: 400px;
    height: 48px;
    padding: 0 10px;  
    font-size: 16px;
    background-color: rgb(255, 224, 96);
    margin-top: 10px;
    text-decoration: none;
    color: black;
    line-height: 48px;
    display: inline-block;
    font-size: 18px;
    
}

.line {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 70px;
    border-top: 1px solid gray;
}

.signup_etc{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 40px;
}


.logo-container {
    text-align: center;
}

.logo-container img {
    width: 55px;
    height: 55px;
}



/* 언더라인 긋는 3가지 방법 :
.login > a { font-size: 14px; color: #666; text-decoration: underline;}

.login > a { position: relative; font-size: 14px; color: #666;}
.login > a:after { content:""; position:absolute; left:0; bottom:0; width: 100%;
height: 1px; background: #666; \}

.login > a { padding: 0 0 2px; font-size: 14px; color: #666; border-bottom: 1px solid #666;}
주변에 다른 컨텐츠가 있으면 padding을 쓰면 안된다. 주변에 영향을 미치기 때문! 주의하자~!*/

  
  /* 로그인페이지 최상단 h2요소 중앙배치 */
  .center {
    display: flex;
    justify-content: center;
    white-space: nowrap;
  }

  .breadcrumb{
    background-color: white;
  }

</style>
</head>
<body>

	<!-- 브레드크럼 css -->
  	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/breadcrumb.css">



	<div class="wrap">
	
	<!-- header start -->
	<%@ include file="/views/common/header.jsp" %>
	<!-- header end -->

    <!-- 브레드크럼 start -->
    <div class="breadc">
      <ol>
        <li><a href="<%= contextPath %>">Home</a></li> <!--홈화면으로 갈수있게-->
        <li class="separator">&gt</li>
        <li>회원가입</li>
      </ol>
    </div>
    <!-- 브레드크럼 end -->
        
      <!-- Section start -->
      <section class="main_content">
        <div class="signup-select-wrapper">
			<div class="signup-common">
	          <h2><b>회원가입</b></h2>
	          <p style="font-size: 13px; margin-top: 20px;">포마이펫 회원가입하고 알뜰 쇼핑하세요!</p><br>
			  <button type="button" onclick="location.href='<%= contextPath %>/terms.me'">일반 회원가입</button>	          
	          <!-- 약관동의페이지로 링크연결해주기 -->
	        </div>
          
          <div class="line" style="width: 450px;"></div>

          <br><br>

    
    </section>
    <!-- Section end -->
    
        
    <!-- footer start -->
	<%@ include file="/views/common/footer.jsp" %>
	<!-- footer end -->
	
	
	
	</div>
	
        



</body>
</html>