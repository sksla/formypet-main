<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  	
<meta charset="UTF-8">
<title>포마이펫 회원가입</title>
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
  

  /* 회원가입페이지 최상단 h2요소 중앙배치 */
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
      
        <div class="signup_content">
          <div class="center">
            <h2>포마이펫 회원가입</h2>
          </div>  
          
          <br><br><br>
          <p>기본정보</p>
          <form action="<%= contextPath %>/insert.me" method="post" onsubmit="return validateForm()">

            <div class="signUp">
              <table class="table .table" id="table_signup">
                <tr>
              		<th style="width: 150px;">* 아이디</th>
              		<td>
                		<div style="display: flex; align-items: center;">
                  			<div style="display: flex; flex-grow: 1;">
                      			<input type="text" class="form-control" name="userId" placeholder="영문 / 숫자 (4~14자)" required onblur="validateId()">
                      			<button type="button" id="id_check" class="btn btn-secondary btn-sm" onclick="idCheck();" style="margin-left: 5px;">중복확인</button>
                  			</div>
              			</div>
              			<div style="margin-top: 5px;">
                  			<span id="idMessage" style="font-size: 14px;"></span>
              			</div>
              		</td>
            	</tr>

                <tr>
                  <th>* 비밀번호</th>
                  <td>
                  	<input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="영문, 숫자 포함 (8~16자)" required onblur="validatePassword()">
                	<span id="pwdMessage" style="font-size: 14px;"></span>
                  	
                  </td>
                </tr>

                <tr>
	              <th>* 비밀번호 확인</th>
	              <td>
	                <input type="password" class="form-control" id="userPwdCheck" placeholder="확인을 위해 비밀번호를 다시 입력해주세요." required onblur="checkPassword()">
	                <span id="passwordMessage" style="font-size: 14px;"></span>
	              </td>
	            </tr>



                <tr>
                  <th>* 이름</th>
                  <td>
                  	<input type="text" class="form-control" name="userName" id="userName" placeholder="이름을 입력해주세요." required onblur="validateName()">
                  	<span id="nameMessage" style="font-size: 14px;"></span>
                  
                  </td>
                </tr>

                <tr>
                  <th>* 생년월일</th>
                  <td>
                  	<div style="display: flex; align-items: center;">
                  		<div class="birthStyle" style="display: flex; flex-grow: 1;">
                    		<input type="number" class="form-control" id="yearInput" name="yearInput" placeholder="년(4자)" style="width: 100px;" oninput="validateBirthday()">
                    		<select class="form-control selectpicker noborder" id="monthInput" name="monthInput" style="width: 100px;">
                      			<option value="" selected>월</option>
							    <option value="1">1월</option>
							    <option value="2">2월</option>
							    <option value="3">3월</option>
							    <option value="4">4월</option>
							    <option value="5">5월</option>
							    <option value="6">6월</option>
							    <option value="7">7월</option>
							    <option value="8">8월</option>
							    <option value="9">9월</option>
							    <option value="10">10월</option>
							    <option value="11">11월</option>
							    <option value="12">12월</option>
							</select>
                    		<select class="form-control selectpicker noborder" id="dayInput" name= "dayInput" style="width: 100px;">
							    <option value="" selected>일</option>
							</select>
							<input type="hidden" id="userBirth" name="userBirth">
							<script>
							    // 월 옵션을 선택할 때마다 일 옵션 업데이트
							    document.getElementById("monthInput").addEventListener("change", function() {
							        var selectedMonth = parseInt(this.value);
							        var daysInMonth = new Date(2022, selectedMonth, 0).getDate();
							
							        var daySelect = document.getElementById("dayInput");
							        daySelect.innerHTML = ""; // 일 옵션 초기화
							
							        // 선택된 월에 맞게 일 옵션 생성
							        for (var i = 1; i <= daysInMonth; i++) {
							            var optionElement = document.createElement("option");
							            optionElement.value = i;
							            optionElement.textContent = i + "일";
							            daySelect.appendChild(optionElement);
							        }
							    });
							</script>
						</div>
                  	</div>
                  	<div>
                  		<span id="birthMessage"></span>
                  	</div>
                  </td>
                </tr>

                <tr>
                  <th>&nbsp;&nbsp;성별</th>
                  <td style="display:flex;">
                    <input type="radio" class="form-control" id="gender_M" name="gender" value="M" style="width:25px; height:25px" selected>
                    <label for="gender_M">&nbsp;&nbsp;남자&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                       
                    <input type="radio" class="form-control" id="gender_F" name="gender" value="F" style="width:25px; height:25px">
                    <label for="gender_F">&nbsp;&nbsp;여자&nbsp;&nbsp;</label>
					<!-- hidden input 요소 추가 
					<input type="hidden" id="gender" name="userGender"> -->
                  </td>
                </tr>

				<!-- 
				<script>
				function genderValue() {
				    var gender = document.getElementById("gender");
				    var gender_M = document.getElementById("gender_M");
				    
				    if (gender_M.checked) {
				        gender.value = 'M';
				    } else {
				        gender.value = 'F';
				    }
				    
				    console.log("gender: " + gender.value);
				}
				</script>
				-->
				
                <tr>
                  <th>&nbsp;&nbsp;이메일</th>
                  <td style="display:flex;">
                    <input type="text" class="form-control" id="email_id" placeholder="" style="width: 150px;"><h6 style="margin-top: 8px">&nbsp;@&nbsp;</h6>
                    <input type="text" id="domain-text" class="form-control" value="" title="이메일 도메인" placeholder="" style="width: 180px;">&nbsp;&nbsp;
                    <select class="form-control selectpicker noborder" id="domain-list" title="이메일 도메인 주소 선택" style="width: 150px;" onclick="setEmailDomain(this.value);return false;">
                      <option value="직접입력" selected>직접입력</option>
                      <option value="naver.com">naver.com</option>
                      <option value="gmail.com">gmail.com</option>
                      <option value="hanmail.net">hanmail.net</option>
                      <option value="hotmail.com">hotmail.com</option>
                      <option value="korea.com">korea.com</option>
                      <option value="nate.com">nate.com</option>
                      <option value="yahoo.com">yahoo.com</option>
                      <input type="hidden" id="email" name="email">
                    </select>
                  </td>
                </tr>

				<script>
				function setEmailDomain(domain){
				    var domainInput = document.getElementById("domain-text");
				    domainInput.value = domain;
				    if(domain === "직접입력") {
				        domainInput.disabled = false;
				    } else {
				        domainInput.disabled = true;
				    }
				}
				</script>

                <tr>
                  <th>* 휴대폰 번호</th>
                  <td>
                    <div style="display: flex; align-items: center;">
                  		<div style="display: flex; flex-grow: 1;">
							<input type="text" class="form-control" style="width: 300px;" id="phone" name="phone" placeholder="- 포함 휴대폰 번호를 입력해주세요." onblur="validatePhone()">
                    	</div>
                    </div>
              		<div style="margin-top: 5px;">
                  		<span id="phoneMessage" style="font-size: 14px;"></span>
              		</div>
                  </td>
                </tr>
                    
                <tr>
                  <th>&nbsp;&nbsp;주소</th>
                  <td>
                  <div style="display: flex; align-items: center;">
                  	<div style="display: flex; flex-grow: 1;">
                    	<input type="text" id="addressPost" name="addressPost" class="form-control" placeholder="우편번호" style="width: 100px;" readonly="readonly"> &nbsp;&nbsp;
						<input type="button" onclick="postcode()" class="btn btn-secondary btn-sm" value="우편번호 찾기" style="width: 120px;">&nbsp;&nbsp;
					</div>
				  </div>	
				  <div style="margin-top: 25px;">
					<input type="text" id="address" name="address" class="form-control" placeholder="주소" style="width: 400px;" readonly="readonly">&nbsp;&nbsp;
				  </div>				
				  <div>
					<input type="text" id="addressDetail" name="addressDetail" class="form-control" placeholder="상세주소" style="width: 400px;">&nbsp;&nbsp;
                  </div>
                  
                  </td>    
                </tr>
                	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
                	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                
					<script>
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
			                document.getElementById('addressPost').value = data.zonecode;
			                document.getElementById("address").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("addressDetail").focus();
            				}
        			    }).open();
        			}
        				 
			        </script>    
                	<tr>
                		<th>
                		<td>
                			<div style="display: flex; align-items: center;">
                  				<div style="display: flex; flex-grow: 1;">
                					<label style="font-size: 13.5px; font-weight: bold;  vertical-align: middle;">
                      					<input type="checkbox" id="status_sns" style="width: 19px; height: 19px; white-space: nowrap;  vertical-align: middle;" onchange="updatePhoneValue()">
                      					정보/이벤트 SMS 수신에 동의합니다.
                    				</label>
                            		<input type="hidden" id="statusSns" name="statusSns" value="0"> <!-- hidden 추가 -->
                            	</div>
                            </div>
                            <div>
                            	<label for="emailCheck" style="font-size: 13.5px; font-weight: bold; white-space: nowrap;">
                      				<input type="checkbox" id="emailCheck" style="width: 19px; height: 19px; vertical-align: middle;" onchange="updateEmailValue()">
                      				정보/이벤트 메일 수신에 동의합니다.
                    			</label>                  
                    			<input type="hidden" id="statusEmail" name="statusEmail" value="0"> <!-- hidden 추가 -->
                			</div>
                		</td>
                	</tr>
                
                <script>
					function updatePhoneValue() {
				    	var status_sns = document.getElementById("status_sns");
				    	var statusSns = document.getElementById("statusSns");
				
				    	if (status_sns.checked) {
				    		statusSns.value = 1;
				    	} else {
				    		statusSns.value = 0;
				    	}
				    	
				    	console.log("status_sns : " + status_sns.value);
				    	console.log("statusSns : " + statusSns.value);
					}
				</script>
                
              	<script>
					function updateEmailValue() {
				    	var emailCheck = document.getElementById("emailCheck");
				    	var statusEmail = document.getElementById("statusEmail");
				
				    	if (emailCheck.checked) {
				    		statusEmail.value = 1;
				    	} else {
				    		statusEmail.value = 0;
				    	}
				    	console.log("emailCheck : " + emailCheck.value);
				    	console.log("statusEmail : " + statusEmail.value);

					}
				</script>
              
              </table>
              
              <br>
              
              <p>부가정보</p>
              <table class="table .table" id="table_signup_sub">
                  <tr>
                    <th style="width: 150px;">&nbsp;&nbsp;반려동물</th>
                      <td style="display:flex;">
                        <input type="radio" class="form-control" value='D' id="petType_Dog" name="petType" style="width:25px; height:25px" onclick="togglePetInputs()">
                        <label for="petType_Dog">&nbsp;&nbsp;강아지&nbsp;&nbsp;&nbsp;</label>
                          
                        <input type="radio" class="form-control" value='C' id="petType_Cat" name="petType" style="width:25px; height:25px" onclick="togglePetInputs()">
                        <label for="petType_Cat">&nbsp;&nbsp;고양이&nbsp;&nbsp;&nbsp;</label>
                          
                        <input type="radio" class="form-control" value='N' id="petType_none" name="petType" style="width:25px; height:25px" checked onclick="togglePetInputs()">
                        <label for="petType_none">&nbsp;&nbsp;없음&nbsp;&nbsp;</label>
                        
                      </td>
                    </tr>
                      
                  <tr>
                    <th>&nbsp;&nbsp;반려동물 이름</th>
                    <td><input type="text" id="petName" name="petName" class="form-control" readonly></td>
                  </tr>
                    
                  <tr>
                    <th>&nbsp;&nbsp;품종</th>
                    <td><input type="text" id="petKind" name="petKind" class="form-control" readonly></td>
                  </tr>
                  
                  <tr>
                    <th>&nbsp;&nbsp;나이</th>
                    <td style="display:flex;">                
                      <select id="petAge" name="petAge" class="form-control selectpicker noborder" style="width: 100px;" onchange="petAgeHidden()">
                        <option value='0' selected>0</option>
                      </select>
                      
                      <script>
					    var petAge= document.getElementById("petAge");
					
					    for(let i = 1; i <= 25; i++) {
					        var option = document.createElement("option");
					        
					        option.value = i;
							option.textContent = i;
					    	petAge.appendChild(option);
					    }
					  </script>
					  
                    </td>
                  </tr>
                  
                  
                      
                  <tr>
                    <th>&nbsp;&nbsp;성별</th>
                    <td style="display:flex;">
                      <input type="radio" class="form-control" value='M' id="petGen_M" name="petGender" checked style="width:25px; height:25px">
                      <label for="petGen_M">&nbsp;&nbsp;남아&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                         
                      <input type="radio" class="form-control" value='F' id="petGen_F" name="petGender" style="width:25px; height:25px">
                      <label for="petGen_F">&nbsp;&nbsp;여아&nbsp;&nbsp;</label>
             
                    </td>
                  </tr>
                  
 
	
                  <tr>
                    <th colspan="3" style="text-align:center;">
                    
                      <button type="reset" class="btn btn-outline-warning">초기화</button>
                      <button type="submit" class="btn btn-outline-primary">회원가입</button>

'                    </th>
                  </tr>

                  </table>
 
			    <script>
			    // 아이디 유효성 검사 후, false 일때 메세지 출력
			    function validateId() {
				    var id = document.getElementsByName("userId")[0].value;
				    var idRegex = /^[a-zA-Z0-9]{4,14}$/;
				    var idMessage = document.getElementById("idMessage");
				    var idCheckButton = document.getElementById("idCheckButton");


				    if (id === "") {
			            idMessage.innerHTML = ""; // 입력값이 비어 있다면 메시지를 출력하지 않음
			            return false;
				        idCheckButton.disabled = true;
			        }
				    
				    if (!idRegex.test(id)) {
				        idMessage.innerHTML = "아이디는 영문이나 숫자로 4~14자여야 합니다.";
				        idMessage.style.color = "red";
				        idCheckButton.disabled = true;
				        return false;
				    } else {
				        idMessage.innerHTML = "";
				        idCheckButton.disalbed = false;
				        return true;
				    }
				}
			    
			    document.getElementsByName("userId")[0].addEventListener("blur", validateId);

			    </script>
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
			        const $idInput = $('.signup_content input[name="userId"]');
			
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
			        
		
			    </script>
			    
			    
			    
			    
				<script>
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

		        
				</script>
				
				
				<script>
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

				</script>
				
				<script>
				// 생년월일
			    function validateBirthday() {
			        var year = document.getElementById("yearInput").value;			
			
			        // 년도 4자리
			        if (year.length !== 4 || isNaN(year)) {
						birthMessage.innerHTML = "년도는 숫자 4자리로 입력해주세요.";
		                birthMessage.style.color = "red";
			            return false;
			        }
			
			        birthMessage.innerHTML = "";
			        return true;
				}
			    
				</script>
				
				<script>
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

			    
			    // 회원가입 폼의 유효성검사 알람
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
			        
			        var year = document.getElementById("yearInput").value;
			        var month = document.getElementById("monthInput").value;
			        var day = document.getElementById("dayInput").value;

			        var birthDate = year + "/" + month + "/" + day;
			        document.getElementById("userBirth").value = birthDate;

			        var emailId = document.getElementById("email_id").value;
			        var emailDomain = document.getElementById("domain-text").value;
			        var email = document. getElementById(email);
			        
			        email.value = emailId + "@" + emailDomain;
			        
			        
			        return true;
			    }
			    
			    </script>
			    
				   <!--  
				    <script>
				    function petAgeHidden(){
	                  var petAge = document.getElementById("petAge");
				      var petAgeValue = petAge.value;
					
				      if (petAgeValue !== "") { //펫나이의 값이 빈문자열 아닐때, 본연의 값 넘어가게
				    		petAge.value = petAgeValue;
				       }else{ //빈문자열일때 0이 되도록
				            petAge.value = 0;
				       }
				      
				      console.log("petAge : " + petAge.value);
				    }
						
					</script>
				    -->
				    			    
				    <script>
					
	                function togglePetInputs() {
	                  var petType_none = document.getElementById("petType_none");
	                  var petType_Dog = document.getElementById("petType_Dog");
	                  var petType_Cat = document.getElementById("petType_Cat");
	                  var petNameInput = document.getElementById("petName");
	                  var petKindInput = document.getElementById("petKind");
	                  var petAge = document.getElementById("petAge");
	                  var petGen_M = document.getElementById("petGen_M");
	                  var petGen_F = document.getElementById("petGen_F");
						
	                  var petAgeValue = document.getElementById("petAge").value;
	                  
	                  if (petType_none.checked) {  
	                      // 펫 '없음' 체크 시 아래항목 모두 readonly로 변경
	                      petNameInput.readOnly = true;
	                      petKindInput.readOnly = true;
	                      petAge.readOnly = true;
	                      petGen_M.readOnly = true;
	                      petGen_F.readOnly = true;
	                      petNameInput.value = "";
		                  petKindInput.value = "";
		                  petAge.value = 0;
		                  
	                  } else if (petType_Dog.checked || petType_Cat.checked) {
	                      // 강아지나 고양이가 선택된 경우 아래 항목의 readonly 속성 해제
	                      petNameInput.readOnly = false;
	                      petKindInput.readOnly = false;
	                      petAge.readOnly = false;
	                      petGen_M.readOnly = false;
	                      petGen_F.readOnly = false;
	                      petAge.value = petAgeValue;
	                  }
	                  
	                }
	              
	               </script>  


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