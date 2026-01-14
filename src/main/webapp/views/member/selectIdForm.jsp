<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포마이펫 로그인 - 아이디 찾기</title>
<style>

.main_content{
    min-height: 800px;
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


.id-search-wrapper{
    width: 400px;
    height: 350px;
    padding: 40px;
    box-sizing: border-box;
}

.id-search-wrapper > h2{
    font-size: 24px;
    text-align: center;
    margin-bottom: 40px;
}

#id-search-form > input[type="submit"], #userName{
    width: 400px;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    background-color: #F8F8F8;
}

#id-search-form > #email{
    width: 400px;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 3px;
    background-color: #F8F8F8;
    color: rgb(70, 70, 70);
}


#id-search-form > input::placeholder{
    color: #818080;
}

#id-search-form > input[type="submit"]{
    font-size: 16px;
    background-color: rgb(255, 224, 96);
    margin-top: 20px;
}

#id-search-form > a{
    width: 400px;
    height: 48px;
    padding: 0 10px;  
    font-size: 16px;
    background-color: rgb(255, 224, 96);
    margin-top: 0px;
    justify-content: center;
    align-items: center;
    display: inline-block;
    text-align: center;
    text-decoration: none;
    color: black;
    line-height: 48px;

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
    margin-top: 70px;
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
        <li class="separator"><a href="<%=contextPath%>/loginForm.me">로그인</a></li>
        <li class="separator">&gt</li>
        <li>아이디 찾기</li>
      </ol>
    </div>
    <!-- 브레드크럼 end -->

	  <!-- Section start -->
      <!-- 아이디찾기 섹션 -->
      
      <section class="main_content">
        <div class="id-search-wrapper">
          <h2><b>아이디 찾기</b></h2>
       
       
   


		<!-- 스크립트 -->
		<script>
		 $(document).ready(function() {
		        <% 
		        String errorMsg = (String)request.getAttribute("errorMsg");
		        if (errorMsg != null) {
		        %>
		        var modal = $('#selectFailureModal');
		        modal.modal('show');
		        // errorMsg에 따라서 모달 내용을 설정합니다.
		        var modalBody = modal.find('.modal-body');
		        
		        // errorMsg에 따라 분기 처리
		        var errorMsgValue = "<%= errorMsg %>";
		        if (errorMsgValue === "noUserId") {
		            $('#selectFailureModal .modal-body').text("일치하는 회원이 없습니다.");
		            $('#selectFailureModal').modal('show');
		            $('#selectFailureModal').on('hidden.bs.modal', function () {
		                // 모달이 닫힐 때 로그인 페이지로 이동
		                window.location.replace("<%= request.getContextPath() %>/selectIdForm.me");
		            });
		            
		        } else if (errorMsgValue === "userIdFound") {
		            var userId = '<%= request.getAttribute("userId") %>';
		            var userName = '<%= request.getAttribute("userName") %>';
		            $('#selectFailureModal .modal-body').html(userName + "님의 아이디는 [ " + userId + " ] 입니다.<br>로그인 페이지로 이동합니다.");
		            $('#selectFailureModal').modal('show');
		            $('#selectFailureModal').on('hidden.bs.modal', function () {
		                // 모달이 닫힐 때 로그인 페이지로 이동
		                window.location.replace("<%= request.getContextPath() %>/loginForm.me");
		            });
		        }
		        <% } %>
        
    
  
		        
		        // 닫기 버튼 클릭 이벤트
		        $('.modal-footer button[data-dismiss="modal"]').click(function() {
		            modal.modal('hide');
		        });
		    });
		</script>
        


        <div class="input_group">
          <form method="post" action="<%= contextPath %>/selectId.me" id="id-search-form" onsubmit="return validateForm()">
              <input type="text" name="userName" placeholder="이름" id="userName" autocomplete="username"><br>
              <input type="text" name="email" placeholder="이메일 주소" id="email" autocomplete="email"><br>
              <p style="font-size: 12px;">&nbsp;* 포마이펫 가입 시 사용하신 이메일 주소를 입력해주세요.</p>
              <input type="submit" value="아이디 찾기" id="popbutton"><br>
              <a type="button" href="<%= contextPath%>/loginForm.me">로그인 하러가기</a>

			<!-- 모달 -->
			<div id="selectFailureModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="selectFailureModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="selectFailureModalLabel">아이디 찾기</h5>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <div class="modal-body">
			                <!-- 모달 내용 -->
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			            </div>
			        </div>
			    </div>
			</div>

        <script>
	    function validateForm() {
	        var userName = document.getElementById("userName").value;
	        var email = document.getElementById("email").value;
	
	        if (userName.trim() === "" || email.trim() === "") {
	            alert("이름과 이메일을 모두 입력해주세요.");
	            return false; // 폼 제출을 막음
	        }
	        return true; // 폼 제출 허용
	    }
		</script>

          </form>
        </div>

        <div class="link_group">
          <a href="<%=contextPath%>/selectIdForm.me">아이디 찾기</a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="<%=contextPath%>/selectPwdForm.me">비밀번호 찾기</a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="<%=contextPath%>/signupSelect.me">회원가입</a>
        </div>

 

      </div>
    
    </section>
    <!-- 아이디찾기 섹션 끝 -->
    <!-- Section end -->



   <!-- footer start -->
   <%@ include file="/views/common/footer.jsp" %>
   <!-- footer end -->
   
   </div>

</body>
</html>