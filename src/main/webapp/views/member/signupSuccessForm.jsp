<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포마이펫</title>
<style>

.main_content>div{
    /* border: 2px solid #1ABC9C; */
    width: 80%;
    margin: auto;
    margin-top: 0px;
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

.signup-success-wrapper {
    width: 100%;
    height: 20%;
    display: flex;
    align-items: center;
    flex-direction: column;
    box-sizing: border-box;
}

.signup-success-wrapper > * {
    margin: 10px 0;
    text-align: center;
}

.signup-success a[type="button"]{
    width: 180px;
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

.signup-success {
    display: flex;
    justify-content: center;

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
        
       
		<!-- section start --> 
      	<section class="main_content">
        	<div class="signup-success-wrapper">
        
        		<img src="<%= request.getContextPath() %>/resources/images/dog2.png" style="width: 400px; height: 350px;">
          
          		<div>
            		<h4 style="margin-bottom: 30px;"><b>소중한 회원님! 회원 가입을 축하드립니다.</b></h4>
            		<h4 style="margin-bottom: 50px;"><b>포마이펫에서 행복한 쇼핑 되세요!</b></h4>
          				
          			<div class="signup-success">
            			<a type="button" href="<%=contextPath%>/loginForm.me">로그인</a>
          				<div style="width: 30px;"></div>
           				<a type="button" href="<%=request.getContextPath()%>">홈으로</a>
          			</div>
          
        		</div>
 	
 		    </div>
    
    </section>
    <!-- Section end -->

        
    <!-- footer start -->
	<%@ include file="/views/common/footer.jsp" %>
	<!-- footer end -->
	
	
	
	</div>
	
        


</body>
</html>