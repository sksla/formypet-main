<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.formypet.mypage.model.vo.Delivery" %>
<%
	List<Integer> deliveryNo = (List<Integer>) request.getAttribute("deliveryNo");
	List<String> deliveryName = (List<String>) request.getAttribute("deliveryName");
	List<String> deliveryReceiver = (List<String>) request.getAttribute("deliveryReceiver");
	List<String> phone = (List<String>) request.getAttribute("phone");
	List<String> post = (List<String>) request.getAttribute("post");
	List<String> address = (List<String>) request.getAttribute("address");
	List<String> addressDetail = (List<String>) request.getAttribute("addressDetail");
	List<Character> status = (List<Character>) request.getAttribute("status");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 관리</title>
</head>

<!-- 부트스트랩 -->
<script src="../03_JavaScript/resources/js/sample.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 브레드크럼 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/breadcrumb.css">

<!-- 마이페이지 css -->
<script src="<%= request.getContextPath()%>/resources/js/Mypage.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/Mypage.css">

<!-- 배송지 관리 전용 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/MypageAddress.css">

<!-- 사이드바 적용 js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<%= request.getContextPath()%>/resources/js/Mypage.js"></script>

<!-- 카카오 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<%= request.getContextPath()%>/resources/js/KakaoPostApi.js"></script>

<body>

	<!--head start-->   
    <header>
    	<%@ include file="/views/common/header.jsp"%>
    </header>
    <!--head end-->
    
    <!-- 브레드크럼 start -->
    <div class="breadc">
        <ol>
            <li><a href="<%=request.getContextPath()%>">Home</a></li>
            <li class="separator">&gt;</li>
            <li><a href="<%=request.getContextPath()%>/MypageMain">마이페이지</a></li>
            <li class="separator">&gt;</li>
            <li>배송지 관리</li>
            
        </ol>
    </div>
    <!-- 브레드크럼 end -->


	<!-- 배송지 관리 페이지 start-->
    <!-- 제목 -->
    <h1 class=contentTitle>배송지 관리</h1>
    
    <!-- section start -->
    <section>
      <!-- 좌우로 영역 나누기(사이드바, contents) start -->
      <div class="dividing_area1">
      
      
        <!-- 사이드바 -->
        <div class="sidebar">
        	<%@ include file="/views/mypage/Sidebar.jsp"%>
        </div>

        <!-- ---------------------------------------- -->
        <!-- 보여지는 화면 start -->
        <div class="mypage_address">
        
           <!-- 주소 보여주기 -->
           <div id="table_address"></div>

			<div>
				<% if(deliveryNo == null || deliveryNo.size() == 0) { %>
					<p>배송지가 없습니다. 배송지를 추가해주세요.</p>
				<%} else { %>
				<hr>
				
					<!-- 기본 배송지 먼저 출력 시키기 -->
					<% if(deliveryNo != null && status != null) { %>
					    <% for(int i=0; i<deliveryNo.size(); i++) { %>
					        <% if(i < status.size() && status.get(i) == 'Y') { %>
					            <table class="address_table">
					                <tr>
					                    <th class="address_th1">
					                        <span><%= deliveryReceiver.get(i) %></span>
					                        <span><%= phone.get(i) %></span>
					                    </th>
					                    <td class="address_td1" rowspan="3">
					                        <div class="btn_sort">
					                            <!-- <div class="btn_address" onclick="editAddress(<%= deliveryNo.get(i) %>)">수정</div> -->
					                            <div class="btn_address" onclick="deleteAddress(<%= deliveryNo.get(i) %>)">삭제</div>
					                        </div>
					                    </td>
					                </tr>
					                <tr class="address_tr2">
					                    <td>
					                        <span><%= post.get(i) %></span>
					                        <span><%= address.get(i) %> <%= addressDetail.get(i) %></span>
					                    </td>
					                </tr>
					                <tr class="address_tr3">
					                    <td>
					                        <div class="default_address">기본</div>
					                    </td>
					                </tr>
					            </table>
					            <hr>
					        <% } %>
					    <% } %>
					<% } %>
					
					<!-- 부가 배송지 출력 -->
					<% if(deliveryNo != null && status != null && deliveryName != null && phone != null && post != null && address != null && addressDetail != null) { %>
					    <% for(int i=0; i<deliveryNo.size(); i++) { %>
					        <% if(i < status.size() && status.get(i) != 'Y') { %>
					            <table class="address_table">
					                <tr>
					                    <th class="address_th1">
					                        <span><%= deliveryReceiver.get(i) %></span>
					                        <span><%= phone.get(i) %></span>
					                    </th>
					                    <td class="address_td1" rowspan="3">
					                        <div class="btn_sort">
					                            <!-- <div class="btn_address" onclick="editAddress(<%= deliveryNo.get(i) %>)">수정</div> -->
					                            <div class="btn_address" onclick="deleteAddress(<%= deliveryNo.get(i) %>)">삭제</div>
					                        </div>
					                    </td>
					                </tr>
					                <tr class="address_tr2">
					                    <td>
					                        <span><%= post.get(i) %></span>
					                        <span><%= address.get(i) %> <%= addressDetail.get(i) %></span>
					                    </td>
					                </tr>
					                <tr class="address_tr3">
					                    <td>
					                        <div class="other_address" onclick="setAsDefault(<%= deliveryNo.get(i) %>)">기본 배송지로 설정</div>
					                    </td>
					                </tr>
					            </table>
					            <hr>
					        <% } %>
					    <% } %>
					<% } %>
				<% } %>
				
				
			</div>

			<!-- 배송지 추가 -->
			<div class="add_address" onclick="open_address_modal();">
				<p class="mypage_font3">배송지 추가</p>
			</div>

          	
          	<!-- 배송지 추가 modal 화면 -->
			<div id="modal_address" class="modal">
				<div class="modal_content">
              		<div class="moatal_title">
	                	<h1 id="addres_title">배송지 추가</h1>
						<span class="close" onclick="close_address_modal()">&times;</span>
              		</div>

                	<table class="modal_table">
	                  	<tr>
	                    	<td class="mypage_font4">
	                      		<span>이름</span>
	                    	</td>
	                    	<td colspan="3">
								<input type="text" placeholder="받는사람" id="receiver">
	                    	</td>
	                  	</tr>
	                  	<tr>
	                    	<td class="mypage_font4">
	                      		<span>휴대폰</span>
	                    	</td>
	                    	<td colspan="3">
	                      		<input type="text" placeholder="전화번호(-제외)" id="phone" onchange="phone(this);">
	                    	</td>
	                  	</tr>
	                  	<tr>
	                    	<td class="mypage_font4 address_font" rowspan="3">
	                      		<span>주소</span>
	                    	</td>
	                    	<td>
								<input type="text" id="sample6_postcode" placeholder="우편번호">
	                    	</td>
	                    	<td>
		                        <div class="td_input">
		                            <input type="button" class="btn_zip" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		                        </div>
	                    	</td>
	                  	</tr>
	                  	<tr>
	                    	<td colspan="3">
		                        <input type="text" id="sample6_address" placeholder="주소">
		                        <input type="text" id="sample6_detailAddress" placeholder="상세주소">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목" class="display_none">
	                    	</td>
	                  	</tr>
	                  	<tr>
	                    	<td colspan="3">
	                    </td>
		               	</tr>
		               	
						<!-- ckeckbox 버튼 -->
		                <tr>
		                	<td colspan="3">
		                    	<div class="modal_checkbox mypage_font4">
		                        	<div>
		                          		<label>
		                           			<input type="checkbox" id="defaultCheck">기본 배송지로 설정
		                          		</label>
		                        	</div>
			                        <div>
			                        	<label>
			                            	<input type="checkbox" id="conditionCheck">배송지 정보 수집 및 이용 동의
			                          	</label>
			                        </div>
		                      	</div>
		                    </td>
						</tr>
		                  
		                <!-- 정보수집 -->
						<tr>
							<td colspan="3">
								<div class="address_scroll">
		                        	<p class="scroll_pont">
										1. 배송 정보 수집 및 이용 동의<br>
										회사는 회원의 배송지 관리를 위해 아래와 같이 개인정보를 수집합니다. 내용을 자세히 읽으신 후 동의 여부를 결정하여 주십시오.<br><br>
										 
										2. 수집하는 개인정보 항목 및 수집방법<br>
										(1) 수집 항목 이름, 휴대폰번호, 주소 <br>
										(2) 수집 방법 온라인 홈페이지<br><br>
										 
										3. 개인정보의 처리 및 보유기간<br>
										회사는 회원 탈퇴 시 또는 마이페이지 > 배송지 관리 메뉴에서 삭제 시 해당 정보를 지체없이 파기합니다. <br>
										 
										개인정보 수집 및 이용 안내에 관한 사항에 대해 동의를 거부할 수 있습니다. 다만, 배송지 추가 서비스를 이용하실 수 없습니다.
		                        	</p>
								</div>
							</td>
						</tr>
                      
						<!--저장 버튼 -->
						<tr>
							<td colspan="3">
								<div class="div_btn_save">
									<input type="button" class="btn_save" value="저장" onclick="insertAddress()">
		                      	</div>
		                    </td>
						</tr>
		
					</table>
	        	</div>
	        </div>
	        <!-- 모달창 end -->
	        
	        
	        <!-- 보여지는 화면 end -->
	        <!-- ---------------------------------------- -->



      </div>
      <!-- 좌우로 영역 나누기(사이드바, contents) end -->
    </section>
    <!-- section end -->
    <!-- 배송지 관리 페이지 End-->



	<!--footer start-->   
    <header>
    	<%@ include file="/views/common/footer.jsp"%>
    </header>
    <!--footer end-->



</body>
</html>