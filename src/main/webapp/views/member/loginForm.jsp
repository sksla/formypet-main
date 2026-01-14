<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포마이펫 로그인</title>
<style>

.main_content{
    min-height: 900px;
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


.login-wrapper{
    width: 400px;
    height: 350px;
    padding: 40px;
    box-sizing: border-box;
    margin-bottom: 200px;
}

.login-wrapper > h2{
    font-size: 24px;
    text-align: center;
    margin-bottom: 40px;
}

#login-form > input{
    width: 400px;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    background-color: #F8F8F8;
}
#login-form > input :placeholder{
    color: #818080;
}

#login-form > input[type="submit"]{
    color: black;
    font-size: 16px;
    background-color: rgb(255, 224, 96);
    margin-top: 20px;
}

#user_login, #not_login{
    padding: 10px 20px;
    font-size: 16px;
    margin-bottom: 30px;
    width: 200px;

}

.input_group {
    display: flex;
    justify-content: center;
    align-items: center;
}

.link_group{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 40px;
}

.link_group a {
    color: rgb(70, 70, 70);
    text-decoration: none;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 70px;
}

.line {
    border-top: 1px solid gray;
}

.text {
    padding: 0 20px;
    user-select: none;
    color: rgb(70, 70, 70);
}

.login_etc{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 40px;
    padding: 0px;
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
            <li>로그인</li>
        </ol>
      </div>
      <!-- 브레드크럼 end -->
   
   <!-- section start -->
   
   <section class="main_content">
        <div class="login-wrapper">
          <h2><b>로그인</b></h2>
          
          <!--
          <div class="center">
            <input type="button" value="기존회원" id="user_login" selected>
            <input type="button" value="비회원 주문조회" id="not_login">
          </div> 

          
          <script>
            
            const userLoginButton = document.getElementById('user_login');
            const notLoginButton = document.getElementById('not_login');
            
            userLoginButton.setAttribute('selected', true);
            userLoginButton.style.backgroundColor = 'rgb(255, 224, 96)';

            // 비회원 주문조회 버튼 클릭 시
            notLoginButton.addEventListener('click', function() {
                userLoginButton.removeAttribute('selected');
                notLoginButton.setAttribute('selected', true);

                userLoginButton.style.backgroundColor = '#F8F8F8';
                notLoginButton.style.backgroundColor = 'rgb(255, 224, 96)';
            });

            userLoginButton.addEventListener('click', function() {  
                notLoginButton.removeAttribute('selected');
                userLoginButton.setAttribute('selected', true);

                userLoginButton.style.backgroundColor = 'rgb(255, 224, 96)';
                notLoginButton.style.backgroundColor = '#F8F8F8';
            });
        </script>
        -->

          <script>
          $(document).ready(function() {
              // 로그인 실패 모달창
              <% if (request.getAttribute("errorMsg") != null) { %>
                  $('#loginFailureModal').modal('show');
              <% } %>
          });
		  </script>

        <div class="input_group">
          <form method="post" action="<%= contextPath %>/login.me" id="login-form">
              <input type="text" name="userId" placeholder="아이디"><br>
              <input type="password" name="userPwd" placeholder="비밀번호"><br>
              <label for="remember-check">
                  <input type="checkbox" id="remember-check" style="width: 17px; height: 17px; vertical-align: middle;">&nbsp;아이디 저장
              </label><br>
              <input type="submit" value="로그인">
              
			  <div class="modal fade" id="loginFailureModal" tabindex="-1" role="dialog" aria-labelledby="loginFailureModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			      <div class="modal-content">
			        <div class="modal-header">
			          <h5 class="modal-title" id="loginFailureModalLabel">로그인 실패</h5>
			          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			            <span aria-hidden="true">&times;</span>
			          </button>
			        </div>
			        <div class="modal-body">
			          아이디 또는 비밀번호를 잘못 입력했습니다. <br>입력하신 내용을 다시 확인해주세요.
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			        </div>
			      </div>
			    </div>
			  </div>
           
           
            </form>
          </div>	
          


        <div class="link_group">
          <a href="<%=contextPath%>/selectIdForm.me">아이디 찾기</a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="<%=contextPath%>/selectPwdForm.me">비밀번호 찾기</a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="<%=contextPath%>/signupSelect.me">회원가입</a>
        </div>

        <div class="container">
          <div class="line" style="width: 200px;"></div>
          <div class="text">또는</div>
          <div class="line" style="width: 200px;"></div>
        </div>

        <div class="login_etc">
          <a href="javascript:kakaoLogin()"><img src="<%=contextPath%>/resources/images/kakaoLogin.png" style="width: 210px; height: 50px;" id="kakao"></a>
	        </div>

		<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script type="text/javascript">
		    Kakao.init('cb3188a23706c5d5dac3a5bc6f481457');
	        console.log( Kakao.isInitialized() ); // 초기화 판단여부

	        
		    function kakaoLogin() {
		        Kakao.Auth.login({
		            success: function (authObj) {
		                console.log(authObj); // access토큰 값
		                Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장

		                	getInfo();
		     		},
		            fail: function (err) {
		            	console.log(err);
		            }
		   		});
		    }
		                
		 // 4. 엑세스 토큰을 발급받고, 아래 함수를 호출시켜서 사용자 정보를 받아옴.
			function getInfo() {
			    Kakao.API.request({
			        url: '/v2/user/me',
			        success: function (res) {
			            console.log(res);
			            // 이메일, 성별, 닉네임, 프로필 이미지 등을 가져와서 서버로 전송
			            var email = res.kakao_account.email;
			            var userName = res.kakao_account.profile.nickname;
			
			            // Ajax 요청을 통해 서버로 회원 정보 전달
			            $.ajax({
			                type: "POST",
			                url: "<%=contextPath%>/kakaoLogin.me", // 카카오 회원 정보 저장을 처리하는 서블릿 URL
			                data: { email: email, userName: userName },
			                success: function (response) {
			                    // 회원 정보 저장에 성공한 경우, 홈 화면으로 리다이렉트
			                    window.location.href = "<%=contextPath%>";
			                },
			                error: function () {
			                    alert('회원 정보를 저장하는데 실패했습니다.');
			                }
			            });
			        },
			        fail: function (error) {
			            alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
			        }
			    });
			}
		</script>



      </div>
    
    </section>
   
   <!-- section end -->
   
   
   
   <!-- footer start -->
   <%@ include file="/views/common/footer.jsp" %>
   <!-- footer end -->
   
   
   
   </div>

</body>
</html>