<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포마이펫 회원정보 수정</title>
<style>
  
  .main_content>div{
    border: 0px solid;
    width: 60%;
    margin: auto;
    margin-bottom : 200px; 
    min-height: 1200px;
    padding: center;
  }
  
  #table_signup input, #table_signup_sub input{
    width:25%;
  }

  #table_signup th, #table_signup_sub th{
    white-space: nowrap;
    vertical-align: middle;
  }
  
  .birthStyle span{
  		display: inline-block;
        margin-left: 5px; 
  }
  
  /* #table_signup, #table_signup_sub {
    table-layout: auto; /* 테이블의 너비를 내용에 맞게 조절 */
  

  /* 회원정보 수정 페이지 최상단 h2요소 중앙배치 */
  .center {
    display: flex;
    justify-content: center;
    white-space: nowrap;
  }

  .breadc{
    background-color: white;
  }

</style>
</head>
<body>

<!-- 부트스트랩 -->
<script src="../03_JavaScript/resources/js/sample.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 브레드크럼 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/breadcrumb.css">

<!-- 마이페이지 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/Mypage.css">

<!-- 회원정보 수정 전용 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/MypageModification.css">
<script src="<%= request.getContextPath()%>/resources/js/MypageModification.js"></script>

<!-- 사이드바 적용 js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<%= request.getContextPath()%>/resources/js/Mypage.js"></script>

	<!-- header start -->
	<%@ include file="/views/common/header.jsp" %>
	<!-- header end -->

        <!-- 브레드크럼 start -->
        <div class="breadc">
          <ol>
              <li><a href="<%= contextPath %>">Home</a></li>
              <li class="separator">&gt;</li>
              <li><a href="<%= contextPath %>/MypageMain">마이페이지</a></li>
              <li class="separator">&gt;</li>
              <li>회원정보 수정</li>
          </ol>
        </div>
        <!-- 브레드크럼 end -->
       
            <h1 class="contentTitle">회원정보 수정</h1>
	
	<!-- section start -->
	<section>
	
		<!-- 좌우로 영역 나누기(사이드바, contents) start -->
	        <div class="dividing_area1">
	        
	            <!-- 사이드바 -->
	            <div class="sidebar">
	            	<%@ include file="/views/mypage/Sidebar.jsp"%>
	            </div>
	
      
        <div class="signup_content">
          <p class="text_left">기본정보</p>
          
          
          
          <form action="<%= contextPath %>/MypageUpdate" method="post" onsubmit="return validateForm()">

            <div class="signUp">
              
              
              <table class="table updateForm">
							<tr>
								<th>아이디</th>
								<td class="d-flex">
									<input type="text" class="form-control date ms-3" id="update_id" style="width: 350px;" value="<%= loginUser.getUserId() %>"  readonly >
									&nbsp;&nbsp;<button class="btn btn-secondary ms-3" disabled>중복확인</button>
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td>
									<input type="password" id="update_pass" class="form-control ms-3" style="width: 350px;" value="<%= loginUser.getUserPwd() %>" readonly >
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td>
									<input type="password" id="update_check_pass" class="form-control ms-3" style="width: 350px;" value="<%= loginUser.getUserPwd() %>" readonly>
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" class="form-control ms-3" id="update_name" name="name" style="width: 350px;" value="<%= loginUser.getUserName() %>">
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>
									<div class="d-flex">
										<div class="d-flex">
											<input type="text" class="form-control ms-3 me-1" id="update_email_id" name="emailId" style="width: 130px;" > 
											@ 
											<input type="text" class="form-control ms-1" id="update_email_domain" name="emailDomain" list="emailList" style="width: 200px;" placeholder="직접입력">
											<input type="hidden" name="email">
										</div>
										<div class="ms-5">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="email_status" name="emailStatus" class="form-check-input" onchange="checkStatus();" value="0">
											정보/이벤트 메일에 수신
										</div>
									</div> 
									
								<script>
								$(function(){
									let email = '<%= loginUser.getEmail() %>';
									$("#update_email_id").val(email.substring(0, email.indexOf('@')));
	            					$("#update_email_domain").val(email.substring(email.lastIndexOf('@') + 1));
	            					$(".updateForm input[name='email']").val($("#update_email_id").val() + "@" + $("#update_email_domain").val());
	            					let eStatus = '<%= loginUser.getStatusEmail() %>';
	            					if(eStatus == 1){
	            		                $("#email_status").prop("checked", true);
	            		                $("#email_status").val(1);
	            		            } else{
	            		                $("#email_status").val(0);
	            		            }
	            					let sStatus = '<%= loginUser.getStatusSns() %>';
	            					if(sStatus == 1){
	            		                $("#update_sns_status").prop("checked", true);
	            		                $("#update_sns_status").val(1);
	            		            } else{
	            		                $("#update_sns_status").val(0);
	            		            }
	            					
	            					birthday = new Date('<%= loginUser.getUserBirth() %>');
	            		            birthday = birthday.toISOString().slice(0,10);
	            		            $("#update_birth").val(birthday);

	            					let type = '<%= loginUser.getPetType() %>'
	            		            if(type == 'N'){
	            		                $("input[name='petradio'][value='N']").prop("checked", true);
	            		            } else if(type == 'D'){
	            		                $("input[name='petradio'][value='D']").prop("checked", true);
	            		            } else{
	            		                $("input[name='petradio'][value='C']").prop("checked", true);
	            		            }
	            					
	            					let gender ='<%= loginUser.getPetGender() %>'
	            					if(gender == 'M'){
	            		                $("input[name='genderraio'][value='M']").prop("checked", true);
	            		            } else{
	            		                $("input[name='genderraio'][value='F']").prop("checked", true);
	            		            }
	            		            
								})
								
								
		            				        
            					</script>
            					
            					
									<datalist id="emailList">
										<option value="naver.com">naver.com</option>
										<option value="google.com">google.com</option>
										<option value="hanmail.net">hanmail.net</option>
                      					<option value="hotmail.com">hotmail.com</option>
                      					<option value="korea.com">korea.com</option>
                      					<option value="nate.com">nate.com</option>
                      					<option value="yahoo.com">yahoo.com</option>
									</datalist>
								</td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td>
									<div class="d-flex">
										<div>
											<input type="text" id="update_phone" name="phone" class="form-control ms-3" style="width: 350px;" value="<%= loginUser.getPhone() %>" >
										</div>
										<div class="ms-5">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="update_sns_status" name="snsStatus" class="form-check-input" onchange="checkStatus();" value="0">
											정보/이벤트 메일에 수신
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
                  					<div class="ms-3">
										<div class="d-flex">
											<input type="text" id="update_post" name="post" class="form-control" placeholder="우편번호" style="width: 100px;" readonly="readonly" value="<%= loginUser.getAddressPost() %>">
											&nbsp;&nbsp;<input type="button" onclick="postcode()" class="btn btn-secondary btn-sm ms-2" value="우편번호 찾기" style="width: 120px;">
										</div>
									</div>
									<div class="my-2 ms-3">
										<input type="text" value="<%= loginUser.getAddress() %>" id="update_address" name="address" class="form-control" placeholder="주소" style="width: 400px;" readonly>
									</div>
									<div class="mt-2 ms-3">
										<input type="text" value="<%= loginUser.getAddressDetail() %>" id="update_detail" name="detail" class="form-control" placeholder="상세주소" style="width: 400px;">
									</div>
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="date" id="update_birth" class="form-control date ms-3" name="birth" style="width: 350px;" value="<%= loginUser.getUserBirth() %>"></td>
							</tr>
						</table>
						
						
						
						
						<br>
						<table class="table">
							<tr>
								<th>반려동물</th>
								<td>
									<div class="d-flex justify-content-between col-8 ms-3" >
										<label class="form-check-label"> 
											<input type="radio"	class="form-check-input" id="update_petType_Dog" name="petradio" value="D" onchange="togglePetInputs();">강아지
										</label> 
										<label class="form-check-label"> 
											<input type="radio"	class="form-check-input" id="update_petType_Cat" name="petradio" value="C" onchange="togglePetInputs();">고양이
										</label> 
										<label class="form-check-label"> 
											<input type="radio"	class="form-check-input" id="update_petType_None" name="petradio" value="N" onchange="togglePetInputs();">없음
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<th>반려동물 이름</th>
								<td><input type="text" name="petName" class="form-control ms-3" style="width: 350px;" value="<%= loginUser.getPetName() %>"></td>
							</tr>
							<tr>
								<th>품종</th>
								<td><input type="text" name="petKind" class="form-control ms-3" style="width: 350px;" value="<%= loginUser.getPetKind() %>"></td>
							</tr>
							<tr>
								<th>나이</th>
								<td><input type="number" name="petAge" class="form-control ms-3" style="width: 350px;" value="<%= loginUser.getPetAge() %>"></td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<div class="d-flex justify-content-between col-4 ms-3">
										<label class="form-check-label"> 
											<input type="radio"	class="form-check-input" id="update_petGen_M" name="genderradio" value="M" checked>남
										</label> 
										<label class="form-check-label"> 
											<input type="radio"	class="form-check-input" id="update_petGen_F" name="genderradio" value="F">여
										</label>
									</div>
								</td>
							</tr>
<tr>
			        <th colspan="3" style="text-align:center;">
			            <a href="<%= request.getContextPath() %>/MypageMain" class="btn btn-outline-warning">뒤로가기</a>
			            <button type="submit" class="btn btn-outline-primary">회원정보 수정</button>
			        </th>
			    </tr>
						</table>

 
                
             </div>
	  </form>


    </div>

    </section>
	
	<!-- section end -->

	<!-- footer start -->
		<%@ include file="/views/common/footer.jsp" %>
	<!-- footer end -->

	</div>

</body>
</html> 