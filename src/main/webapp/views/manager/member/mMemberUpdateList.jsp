<%@page import="com.formypet.common.model.vo.PageInfo"%>
<%@page import="com.formypet.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<Member> list = (List<Member>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	boolean check = (boolean)request.getAttribute("check");
	String main = "";
	String search = "";
	if(check){
		main = (String)request.getAttribute("main");
		search = (String)request.getAttribute("search");		
	}
	
	Member update = new Member();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록/변경/삭제</title>
</head>
<body>
	<%@ include file="/views/manager/common/header.jsp" %>
	
	<%@ include file="/views/manager/common/sidebar.jsp" %>
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>회원관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">홈</a></li>
					<li class="breadcrumb-item">회원관리</li>
					<li class="breadcrumb-item active">회원등록/변경/삭제</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col">
					<div class="card">
						<div class="card-title">회원등록/변경/삭제</div>
						<!-- <div class="ms-5" style="display: flex;">
							<button class="btn btn-outline-warning" style="width: 80px;">일별</button>
							<button class="btn btn-outline-warning" style="width: 80px;">주별</button>
							<button class="btn btn-outline-warning" style="width: 80px;">월별</button>
							<button class="btn btn-outline-warning" style="width: 80px;">전체</button>
							<i class="bi bi-calendar ms-5 justify-content-center"></i> <input
								type="date" class="form-control date mx-2" style="width: 200px;">
							~ <input type="date" class="form-control date me-5 ms-2"
								style="width: 200px;">
							<button class="btn btn-outline-secondary justify-content-end">조회하기</button>
						</div> -->
						<!--날짜 선택-->
						<br>
						<br>
						<div class="product">
							<form action="<%=contextPath %>/search.mm" method="get" id="search_form" class="search-form ms-5" style="display: flex">
								<input type="hidden" name="page" id="paging" value="1">
								<input type="hidden" name="update" value="1">
								<select name="main" class="form-select me-2" style="width: 130px;">
									<option value="no" selected>회원번호</option>
									<option value="id">아이디</option>
									<option value="name">이름</option>
									<option value="email">이메일</option>
									<option value="phone">휴대폰번호</option>
									<option value="birth">생년월일</option>
								</select> 
									<input type="text" name="search" placeholder="Search" title="Enter search keyword" id="searchbar" style="width: 300px;">
								<button type="submit" title="Search">
									<i class="bi bi-search"></i>
								</button>
							</form>
						</div>
						<!--검색도구-->
						<hr>
						<div class="d-flex justify-content-end me-3">
							<button class="btn btn-secondary" data-toggle="modal" data-target="#member_insert">
							회원등록하기
							</button>
						</div>
						<br>
						<div class="mx-3">
							<!-- Default Table -->
							<table class="table member">
								<thead>
									<tr>
										<th>회원번호</th>
										<th>아이디</th>
										<th>이름</th>
										<th>이메일</th>
										<th>휴대폰번호</th>
										<th>생년월일</th>
										<th>Email 수신</th>
										<th>SNS 수신</th>
										<th>상세정보</th>
										<td style="border: none;"></td>
									</tr>
								</thead>
								<tbody>
									<%for (Member m : list) {%>
									<tr>
										<td><%=m.getUserNo()%></td>
										<td><%=m.getUserId()%></td>
										<td><%=m.getUserName()%></td>
										<td><%=m.getEmail()%></td>
										<td><%=m.getPhone()%></td>
										<td><%=m.getUserBirth()%></td>
										<td><input type="checkbox"
											<%if (m.getStatusEmail() == 1) {%> checked <%}%>>
										</td>
										<td><input type="checkbox"
											<%if (m.getStatusSns() == 1) {%> checked <%}%>>
										</td>
										<td>
											<button type="button" class="btn btn-outline-warning" data-toggle="modal" data-target="#member_update" 
											onclick="updateForm('<%=m.getUserId()%>'
															  , '<%=m.getUserPwd()%>'
															  , '<%=m.getUserName()%>'
															  , '<%=m.getEmail()%>'
															  , '<%=m.getStatusEmail() %>'
															  , '<%=m.getPhone()%>'
															  , '<%=m.getStatusSns() %>'
															  , '<%=m.getAddressPost()%>'
															  , '<%=m.getAddress()%>'
															  , '<%=m.getAddressDetail() %>'
															  , '<%=m.getUserBirth() %>'
															  , '<%=m.getStatus() %>'
															  , '<%=m.getPetType() %>'
															  , '<%=m.getPetName()%>'
															  , '<%=m.getPetKind()%>'
															  , '<%=m.getPetAge()%>'
															  , '<%=m.getPetGender()%>'
															  , '<%=m.getUserNo()%>');">
											수정
											</button>
										</td>
										<td style="border: none">
											<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#member_delete" 
											onclick="deleteMember(<%=m.getUserNo()%>,'<%=m.getUserId()%>');"
											<%if(m.getStatus().equals("N")){ %>
												disabled
											<%} %>>
											ㅡ
											</button>
										</td>
									</tr>
									<%}%>
								</tbody>
							</table>
							<!-- End Default Table Example -->
						</div>
						
						<!-- 페이징시작 -->
						<div>
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<%if(pi.getCurrentPage() == 1){ %>
									<li class="page-item disabled"><a class="page-link"	href="#" tabindex="-1" aria-disabled="true">&lt;</a></li>
									<%} else{ %>
									<li class="page-item">
										<a class="page-link"
										<%if(!check){ %>
										href="<%=contextPath%>/list.mm?page=<%=pi.getCurrentPage() - 1%>"
										<%} else { %> href="#"
										onclick="return searchPage(<%=pi.getCurrentPage() - 1%>);"
										<%} %> tabindex="-1" aria-disabled="true"> &lt; </a></li>
									<%} %>
									<%for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
									<%if(p == pi.getCurrentPage()){ %>
									<li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
									<%} else{ %>
									<li class="page-item"><a class="page-link"
										<%if(!check){ %> href="<%=contextPath%>/list.mm?page=<%=p%>"
										<%} else { %> href="#"
										onclick="return searchPage(<%=p%>); <%}%>"> <%=p %>
									</a></li>
									<%} %>
									<%} %>
									<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
									<li class="page-item disabled"><a class="page-link"
										href="#" tabindex="-1" aria-disabled="true">&gt;</a></li>
									<%} else{ %>
									<li class="page-item"><a class="page-link"
										<%if(!check){ %>
										href="<%=contextPath%>/list.mm?page=<%=pi.getCurrentPage() + 1%>"
										<%} else { %> href="#"
										onclick="return searchPage(<%=pi.getCurrentPage() + 1%>);"
										<%} %>> &gt; </a></li>
									<%} %>
								</ul>
							</nav>
						</div>
						<!-- 페이징끝 -->
					</div>
				</div>
			</div>
		</section>
		<!-- 회원등록 모달 -->
		<div class="modal" id="member_insert">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title m-auto">신규회원 등록</h4>
					</div>

					<!-- Modal body -->
					<form action="<%=contextPath%>/insert.mm" method="post" onsubmit="return validateForm()">
					<div class="modal-body">
						<table class="table new">
							<tr>
								<th>* 아이디</th>
								<td class="d-flex">
									<input type="text" class="form-control date ms-3" id="userId" name="userId" placeholder="영문 / 숫자 (4~14자)" style="width: 350px;" required onblur="validateId()">
									<button type="button" class="btn btn-secondary ms-3" onclick="idCheck();">중복확인</button>
									<div style="margin-top: 5px;">
                  						<span id="idMessage" style="font-size: 14px;"></span>
              						</div>
								</td>
							</tr>
							<tr>
								<th>* 비밀번호</th>
								<td>
									<input type="password" class="form-control ms-3" style="width: 350px;" id="userPwd" name="userPwd" placeholder="영문, 숫자 포함 (8~16자)" required onblur="validatePassword()">
									<span id="pwdMessage" style="font-size: 14px;"></span>
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td>
									<input type="password" class="form-control ms-3" style="width: 350px;" id="userPwdCheck" placeholder="확인을 위해 비밀번호를 다시 입력해주세요." required onblur="checkPassword()">
									<span id="passwordMessage" style="font-size: 14px;"></span>
								</td>
							</tr>
							<tr>
								<th>* 이름</th>
								<td>
									<input type="text" class="form-control ms-3" style="width: 350px;" name="userName" id="userName" placeholder="이름을 입력해주세요." required onblur="validateName()">
									<span id="nameMessage" style="font-size: 14px;"></span>
								</td>
							</tr>
							<tr>
								<th>* 이메일</th>
								<td>
									<div class="d-flex">
										<div class="d-flex">
											<input type="text" class="form-control ms-3 me-1" id="email_id" name="emailId" style="width: 130px;" required> 
											@ 
											<input type="text" class="form-control ms-1" name="emailDomain" list="emailList" style="width: 200px;" placeholder="직접입력" required>
											<input type="hidden" name="email">
										</div>
										<div class="ms-5">
											<input type="checkbox" id="eStatus" name="emailStatus" class="form-check-input" onchange="checkStatus();" value="0">
											정보/이벤트 메일에 수신
										</div>
									</div>
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
								<th>* 휴대폰번호</th>
								<td>
									<div class="d-flex">
										<div>
											<input type="text" id="phone" name="phone" class="form-control ms-3" style="width: 350px;" placeholder="- 포함 휴대폰 번호를 입력해주세요." onblur="validatePhone()">
										</div>
										<div class="ms-5">
											<input type="checkbox" id="sStatus" name="snsStatus" class="form-check-input" onchange="checkStatus();" value="0">
											정보/이벤트 메일에 수신
										</div>
									</div>
									<span id="phoneMessage" style="font-size: 14px;"></span>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
                  					<div class="ms-3">
										<div class="d-flex">
											<input type="text" name="addressPost" class="form-control" placeholder="우편번호" style="width: 100px;" readonly="readonly">
											<input type="button" onclick="postcode()" class="btn btn-secondary btn-sm ms-2" value="우편번호 찾기" style="width: 120px;">
										</div>
									</div>
									<div class="my-2 ms-3">
										<input type="text" name="address" class="form-control" placeholder="주소" style="width: 400px;" readonly>
									</div>
									<div class="mt-2 ms-3">
										<input type="text" name="detail" class="form-control" placeholder="상세주소" style="width: 400px;">
									</div>
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="date" class="form-control date ms-3" name="birth" style="width: 350px;"></td>
							</tr>
						</table>
						<div class="d-flex justify-content-end">
							<!-- 사용자 관리자 구분 -->
							<select name="status" class="form-select me-2" style="width: 130px;">
								<option value="Y" selected>사용자</option>
								<option value="A">관리자</option>
							</select>
						</div>
						<br>
						<table class="table">
							<tr>
								<th>반려동물</th>
								<td>
									<div class="d-flex justify-content-between col-8 ms-3">
										<label class="form-check-label"> 
											<input type="radio"	class="form-check-input" id="petType_Dog" name="petradio" value="D" onchange="togglePetInputs();">강아지
										</label> 
										<label class="form-check-label"> 
											<input type="radio"	class="form-check-input" id="petType_Cat" name="petradio" value="C" onchange="togglePetInputs();">고양이
										</label> 
										<label class="form-check-label"> 
											<input type="radio"	class="form-check-input" id="petType_None" name="petradio" value="N" onchange="togglePetInputs();" checked>없음
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<th>반려동물 이름</th>
								<td><input type="text" id="petName" name="petName" class="form-control ms-3" style="width: 350px;" readonly></td>
							</tr>
							<tr>
								<th>품종</th>
								<td><input type="text" id="petKind" name="petKind" class="form-control ms-3" style="width: 350px;" readonly></td>
							</tr>
							<tr>
								<th>나이</th>
								<td><input type="number" id="petAge" name="petAge" class="form-control ms-3" style="width: 350px;" readonly></td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<div class="d-flex justify-content-between col-4 ms-3">
										<label class="form-check-label"> 
											<input type="radio"	class="form-check-input" id="petGen_M" name="genderradio" value="M" disabled>남
										</label> 
										<label class="form-check-label"> 
											<input type="radio"	class="form-check-input" id="petGen_F" name="genderradio" value="F" disabled>여
										</label>
									</div>
								</td>
							</tr>
						</table>
						<br>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary m-auto col" onclick="emailSet();">
						등록
						</button>
						<button type="button" class="btn btn-secondary m-auto col" data-dismiss="modal">
						취소
						</button>
					</div>
					</form>

				</div>
			</div>
		</div>

		<!-- 회원수정 모달 -->
		<div class="modal" id="member_update">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title m-auto">회원정보 수정</h4>
					</div>

					<!-- Modal body -->
					<form action="<%=contextPath%>/update.mm" method="post">
					<input type="hidden" id="update_no" name="no">
					<div class="modal-body">
						<table class="table updateForm">
							<tr>
								<th>아이디</th>
								<td class="d-flex">
									<input type="text" class="form-control date ms-3" id="update_id" style="width: 350px;" readonly >
									<button class="btn btn-secondary ms-3" disabled>중복확인</button>
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td>
									<input type="password" id="update_pass" class="form-control ms-3" style="width: 350px;" readonly value="<%=update.getUserPwd()%>">
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td>
									<input type="password" id="update_check_pass" class="form-control ms-3" style="width: 350px;" readonly>
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" class="form-control ms-3" id="update_name" name="name" style="width: 350px;">
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>
									<div class="d-flex">
										<div class="d-flex">
											<input type="text" class="form-control ms-3 me-1" id="update_email_id" name="emailId" style="width: 130px;"> 
											@ 
											<input type="text" class="form-control ms-1" id="update_email_domain" name="emailDomain" list="emailList" style="width: 200px;" placeholder="직접입력">
											<input type="hidden" name="email">
										</div>
										<div class="ms-5">
											<input type="checkbox" id="email_status" name="emailStatus" class="form-check-input" onchange="checkStatus();" value="0">
											정보/이벤트 메일에 수신
										</div>
									</div> 
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
											<input type="text" id="update_phone" name="phone" class="form-control ms-3" style="width: 350px;">
										</div>
										<div class="ms-5">
											<input type="checkbox" id="update_sns_status" name="snsStatus" class="form-check-input" onchange="checkStatus();" value="0">
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
											<input type="text" id="update_post" name="post" class="form-control" placeholder="우편번호" style="width: 100px;" readonly="readonly">
											<input type="button" onclick="postcode()" class="btn btn-secondary btn-sm ms-2" value="우편번호 찾기" style="width: 120px;">
										</div>
									</div>
									<div class="my-2 ms-3">
										<input type="text" id="update_address" name="address" class="form-control" placeholder="주소" style="width: 400px;" readonly>
									</div>
									<div class="mt-2 ms-3">
										<input type="text" id="update_detail" name="detail" class="form-control" placeholder="상세주소" style="width: 400px;">
									</div>
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="date" id="update_birth" class="form-control date ms-3" name="birth" style="width: 350px;"></td>
							</tr>
						</table>
						
						<div class="d-flex justify-content-end">
							<!-- 사용자 관리자 구분 -->
							<select name="status" id="update_status" class="form-select me-2" style="width: 130px;">
								<option value="Y" selected>사용자</option>
								<option value="A">관리자</option>
							</select>
						</div>
						<br>
						<table class="table">
							<tr>
								<th>반려동물</th>
								<td>
									<div class="d-flex justify-content-between col-8 ms-3">
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
								<td><input type="text" id="update_pet_name" name="petName" class="form-control ms-3" style="width: 350px;"></td>
							</tr>
							<tr>
								<th>품종</th>
								<td><input type="text" id="update_pet_kind" name="petKind" class="form-control ms-3" style="width: 350px;"></td>
							</tr>
							<tr>
								<th>나이</th>
								<td><input type="number" id="update_pet_age" name="petAge" class="form-control ms-3" style="width: 350px;"></td>
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
						</table>
						<br>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary m-auto col" onclick="updateEmailSet();">
						등록
						</button>
						<button type="button" class="btn btn-secondary m-auto col" data-dismiss="modal">
						취소
						</button>
					</div>
					</form>
				</div>
			</div>
		</div>

		<!-- 회원삭제 모달 -->
		<div class="modal" id="member_delete">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title m-auto">회원 탈퇴</h4>
					</div>

					<!-- Modal body -->
					<form action="<%=contextPath%>/delete.mm">
					<div class="modal-body">
						<input type="hidden" name="memberNo">
						<p id="delete_id"></p>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary m-auto col" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-danger m-auto col">삭제</button>
					</div>
					</form>

				</div>
			</div>
		</div>
	</main><!-- End #main -->
	<%@ include file="/views/manager/common/footer.jsp" %>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
	<script>
	    $(document).ready(function(){
	        // 아이디 입력란의 값이 변경될 때마다 이벤트를 실행합니다.
	        $(".signup_content input[name=userId]").on('input', function(){
	            // 회원가입 버튼을 다시 비활성화합니다.
	            $(".signup_content :submit").attr("disabled", "disabled");
	        });
	    });
	    
	    // 아이디 중복확인 버튼 클릭시 호출
	    function idCheck(){
	        const $idInput = $('.new input[name="userId"]');
	
	        if ($idInput.val().length === 0) {
	            alert("아이디를 입력하세요.");
	            return;
	        }
	        
	        $.ajax({
	        		
	            url : "<%=contextPath%>/idCheck.me",
	            data : {checkId : $idInput.val()},
	            success: function(result){
	                if(result == "NNNNN"){
	                    alert("사용할 수 없는 아이디입니다.");
	                    $idInput.focus();
	                }else{
	                    if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")){
	                        $(".signup_content :submit").removeAttr("disabled");
	                        $idInput.attr("readonly", true);
	                    }else{
	                        $idInput.select();
	                    }
	                }
	            },
	
	            error : function(){
	                console.log("아이디 중복체크용 ajax 통신 실패");
	            }
	        });
	    }
	    
	    // 아이디 유효성 검사 후, false 일때 메세지 출력
	    function validateId() {
		    var id = document.getElementsByName("userId")[0].value;
		    var idRegex = /^[a-zA-Z0-9]{4,14}$/;
		    var idMessage = document.getElementById("idMessage");

		    if (id === "") {
	            idMessage.innerHTML = ""; // 입력값이 비어 있다면 메시지를 출력하지 않음
	            return false;
	        }
		    
		    if (!idRegex.test(id)) {
		        idMessage.innerHTML = "아이디는 영문이나 숫자로 4~14자여야 합니다.";
		        idMessage.style.color = "red";
		        return false;
		    } else {
		        idMessage.innerHTML = "";
		        return true;
		    }
		}
	    
	    document.getElementsByName("userId")[0].addEventListener("blur", validateId);

	    
		// 비밀번호 유효성 검사
        function validatePassword() {
            var password = document.getElementById("userPwd").value;
            var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d~!@#$%^&*()-=_+]{8,16}$/;
		    var pwdMessage = document.getElementById("pwdMessage");
            
		    if (password === "") {
	            pwdMessage.innerHTML = "";
	            return false;
	        }

	        if (!passwordRegex.test(password)) {
	            pwdMessage.innerHTML = "비밀번호는 영문과 숫자를 포함하여 8~16자여야 합니다. 특수문자 ~!@#$%^&*()-=_+) 허용";
	            pwdMessage.style.color = "red";
	            return false;
	        } else {
	            pwdMessage.innerHTML = "";
	            return true;
	        }
            
        }
		
        document.getElementById("userPwd").addEventListener("blur", checkPassword);

        // 비밀번호 일치 여부
        function checkPassword() {
            var userPwd = document.getElementById("userPwd").value;
            var userPwdCheck = document.getElementById("userPwdCheck").value;
            var checkPwdMessage = document.getElementById("passwordMessage");
    
            if (userPwd === "" || userPwdCheck === "") {
                checkPwdMessage.innerHTML = "";
                return false;
            }
            
            if (userPwd == userPwdCheck) {
            	checkPwdMessage.innerHTML = "비밀번호가 일치합니다.";
            	checkPwdMessage.style.color = "green";
                return true;
            } else {
            	checkPwdMessage.innerHTML = "입력하신 비밀번호가 동일하지 않습니다.";
            	checkPwdMessage.style.color = "red";
                return false;
            }
        }
        document.getElementById("userPwdCheck").addEventListener("blur", checkPassword);

        
		
		
     	// 회원 이름 유효성 검사
        function validateName() {
            var name = document.getElementById("userName").value;
            var nameRegex = /^[가-힣]{2,10}$/;
		    var nameMessage = document.getElementById("nameMessage");
        
		    if (name === "") {
	            nameMessage.innerHTML = ""; // 입력값이 비어 있다면 메시지를 출력하지 않음
	            return false;
	        }
		    
            if(!nameRegex.test(name)){
           		nameMessage.innerHTML = "유효하지 않은 이름입니다.";
                nameMessage.style.color = "red";
                return false;
            }else{
            	nameMessage.innerHTML = "";
            	return true;
            }
            
        }
     	
        document.getElementById("userName").addEventListener("blur", validateName);
	    
		
	    // 휴대폰번호 유효성 검사
	    function validatePhone(){
	    	var phone = document.getElementById("phone").value;
	    	var phoneRegex = /^(01[016789])-(\d{3,4})-(\d{4})$/;
	    	var phoneMessage = document.getElementById("phoneMessage");
	    	
	    	if (phone === "") {
	            phoneMessage.innerHTML = ""; // 입력값이 비어 있다면 메시지를 출력하지 않음
	            return false;
	        }
	    	
	    	if(!phoneRegex.test(phone)){
	    		phoneMessage.innerHTML = "잘못된 휴대폰 형식입니다.";
                phoneMessage.style.color = "red";
                return false;
	    	}else{
	    		phoneMessage.innerHTML = "";
	    		return true;
	    	}
	    }
	    
        document.getElementById("phone").addEventListener("blur", validatePhone);

	    
	    function validateForm() {  
	        if (!validateId()) {
                return false;
	        }

	        if (!validatePassword()) {
                return false;
	        }
	        
	        if (!checkPassword()){
	        	return false;
	        }

	        if (!validateName()){
	        	return false;
	        }
	        
	        if (!validateBirthday()) {
	            return false;
	        }
	        
	        if (!validatePhone()){
                return false;
	        }
	        
	        return true;
	    }
			    
					
        function togglePetInputs() {
          var petType_none = document.getElementById("petType_None");
          var petType_Dog = document.getElementById("petType_Dog");
          var petType_Cat = document.getElementById("petType_Cat");
          var petNameInput = document.getElementById("petName");
          var petKindInput = document.getElementById("petKind");
          var petAge = document.getElementById("petAge");
          var petGen_M = document.getElementById("petGen_M");
          var petGen_F = document.getElementById("petGen_F");

          if($("#update_petType_None").is(":checked")){
        	  $("input[name=petName]").prop('readonly', true);
        	  $("input[name=petKind]").prop('readonly', true);
        	  $("input[name=petAge]").prop('readonly', true);
        	  $("#update_petGen_M").prop('disabled', true);
        	  $("#update_petGen_F").prop('disabled', true);
        	  //값 초기화
              $("input[name=petName]").val("");
              $("input[name=petKind]").val("");
              $("input[name=petAge]").val("");
              $("#update_petGen_M").prop('checked', false);
              $("#update_petGen_F").prop('checked', false);
          } else{
        	  $("input[name=petName]").prop('readonly', false);
        	  $("input[name=petKind]").prop('readonly', false);
        	  $("input[name=petAge]").prop('readonly', false);
        	  $("#update_petGen_M").prop('disabled', false);
        	  $("#update_petGen_F").prop('disabled', false);
          }
          if (petType_none.checked) {  
              // 펫 '없음' 체크 시 아래항목 모두 readonly로 변경
              $("#petName").prop('readonly', true);
              $("#petKind").prop('readonly', true);
              $("#petAge").prop('readonly', true);
              $("#petGen_M").prop('disabled', true);
              $("#petGen_F").prop('disabled', true);
              //값 초기화
              $("#petName").val("");
              $("#petKind").val("");
              $("#petAge").val("");
              $("#petGen_M").prop('checked', false);
              $("#petGen_F").prop('checked', false);
          } else if (petType_Dog.checked || petType_Cat.checked) {
              // 강아지나 고양이가 선택된 경우 아래 항목의 readonly 속성 해제
        	  $("#petName").prop('readonly', false);
              $("#petKind").prop('readonly', false);
              $("#petAge").prop('readonly', false);
              $("#petGen_M").prop('disabled', false);
              $("#petGen_F").prop('disabled', false);
          }
          
        }
        
        function postcode() {
			new daum.Postcode({
				oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                var addr = ''; // 주소 변수
			
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("input[name=addressPost]").val(data.zonecode);
                $("input[name=address]").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $("input[name=detail]").focus();
				}
		    }).open();
		}
	    
	    function deleteMember(no, name){
	    	$("input[name='memberNo']").val(no);
	    	let content = name + "회원을 탈퇴시키겠습니까?"
	    	$("#delete_id").html(content);
	    }
	    
	    function checkStatus(){
	    	if($("#eStatus").is(':checked')){
	    		$("#eStatus").val(1);
	    	}else{
	    		$("#eStatus").val(0);
	    	}
	    	
	    	if($("#sStatus").is(':checked')){
	    		$("#sStatus").val(1);
	    	}else{
	    		$("#sStatus").val(0);
	    	}
	    }
	    
	    function emailSet(){
	    	$("input[name='email']").val($("#email_id").val() + "@" + $("#email").val());
	    }
	    
	    function updateEmailSet(){
	    	$(".updateForm input[name='email']").val($("#update_email_id").val() + "@" + $("#update_email_domain").val());
	    }
	    
		function updateForm(id, pw, name, email, eStatus, phone, sStatus, post, address, detail, birth, status, type, petname, kind, age, gender, no){
			$("#update_id").val(id);
			$("#update_pass").val(pw);
			$("#update_check_pass").val(pw);
			$("#update_name").val(name);
			$("#update_email_id").val(email.substring(0, email.indexOf('@')));
			$("#update_email_domain").val(email.substring(email.lastIndexOf('@') + 1));
			if(eStatus == 1){
				$("#email_status").prop("checked", true);
				$("#email_status").val(1);
			} else{
				$("#email_status").val(0);
			}
			$("#update_phone").val(phone)
			if(sStatus == 1){
				$("#update_sns_status").prop("checked", true);
				$("#update_sns_status").val(1);
			} else{
				$("#update_sns_status").val(0);
			}
			$("#update_post").val(post);
			$("#update_address").val(address);
			$("#update_detail").val(detail);
			birthday = new Date(birth);
			birthday = birthday.toISOString().slice(0,10);
			$("#update_birth").val(birthday);
			$("#update_status").val(status).prop("checked", true);
			if(type == 'N'){
				$("input[name='petradio'][value='N']").prop("checked", true);
			} else if(type == 'D'){
				$("input[name='petradio'][value='D']").prop("checked", true);
			} else{
				$("input[name='petradio'][value='C']").prop("checked", true);
			}
			
			$("#update_pet_name").val(petname == 'null' ? "" : petname);
			$("#update_pet_kind").val(kind == 'null' ? "" : kind);
			$("#update_pet_age").val(age);
			if(gender == 'M'){
				$("input[name='genderraio'][value='M']").prop("checked", true);
			} else{
				$("input[name='genderraio'][value='F']").prop("checked", true);				
			}
			
			$("#update_no").val(no);
		}
		
		$(document).ready(function(){
			<%if(check){%>
				$("select[name=main]").val('<%=main%>').prop("selected", true);
				$("input[name='search']").val('<%=search%>');
			<%}%>
		})
		
		function searchPage(page){
        	$("#paging").val(page);
            $("#search_form").submit();
    	}
	</script>
</body>
</html>