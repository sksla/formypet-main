<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.formypet.mypage.model.vo.Point" %>
<%@ page import="java.util.List, java.util.Date, java.util.ArrayList" %>
<%
	List<Integer> userNoList = (List<Integer>) request.getAttribute("userNoList");
	List<Integer> orderNo = (List<Integer>) request.getAttribute("orderNo");
    List<Date> pointDate = (List<Date>) request.getAttribute("pointDate");
    List<Integer> pointAdd = (List<Integer>) request.getAttribute("pointAdd");
    List<Integer> pointUse = (List<Integer>) request.getAttribute("pointUse");
    List<Integer> pointReason = (List<Integer>) request.getAttribute("pointReason");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적립금</title>
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

<!-- 적립금 페이지 전용 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/MypagePoint.css">
<script src="<%= request.getContextPath()%>/resources/js/MypagePoint.js"></script>

<!-- 날짜 기능 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/MypageDate.css">

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
            <li>적립금</li>
            
        </ol>
    </div>
    <!-- 브레드크럼 end -->

	<!-- 적립금 페이지 start-->
    <!-- 제목 -->
    <h1 class="contentTitle">적립금</h1>
    
    <!-- section start -->
    <section>
      <!-- 좌우로 영역 나누기(사이드바, contents) start -->
      <div class="dividing_area1">
      
      
        	<!-- 사이드바 -->
            <div class="sidebar">
            	<%@ include file="/views/mypage/Sidebar.jsp"%>
            </div>
            
            

            <!-- 보여지는 화면 start -->
            <div class="mypage_point">


                <!-- 사용가능한 적립금 start -->
                <div class="available_points">
                    <div class="point_right">
                        <p class="mypage_font6">사용 가능한 적립금</p>
                        <%
                        	int availablePoint = (int)request.getAttribute("pointTotal");
        					String formattedPoint = String.format("%,d", availablePoint);
    					%>
                        <p class="mypage_font1"><%= formattedPoint %></p>
                    </div>
                </div>
                <!-- 사용가능한 적립금 end -->

                <!-- 날짜 기능 start -->
<div class="dateTab">
    <div class="date_left mouse_hover">
        <div class="tab div_selected" onclick="openTab(event, 'tab1')">1개월</div>
        <div class="tab div_NoSelected" onclick="openTab(event, 'tab2')">3개월</div>
        <div class="tab div_NoSelected" onclick="openTab(event, 'tab3')">6개월</div>
        <div class="tab div_NoSelected" onclick="openTab(event, 'tab4')">12개월</div>
    </div>
    <div class="date_right">
        <input type="date" id="startDate" onchange="dateChanged()">
        ~
        <input type="date" id="endDate" onchange="dateChanged()">
    </div>
</div>
<!-- 날짜 기능 end -->

<!-- 보여지는 내용 -->
<div class="contents_point">
    <table class="table_point">
        <tr class="tr1">
            <th class="th1">일자</th>
            <th class="th1">내역</th>
            <th class="th1">상세</th>
            <th class="th1">적립</th>
            <th class="th1">사용</th>
        </tr>

        <!-- "내역 없음" 메시지 -->
        <tr id="noDataMessage" class="point_no">
            <th colspan="5" class="tr_2">
                <p>적립금 적립·사용 내역이 없습니다.</p>
            </th>
        </tr>

        <!-- 데이터가 있을 때 -->
        <% if(pointDate.size() > 0) { %>
            <% for(int i=0; i<pointDate.size(); i++)  { %>
                <% if(pointReason.get(i) != 1) { %>
                    <!-- 포인트 사용 -->
                    <tr class="tr2">
                        <td><%= pointDate.get(i) %></td>
                        <td>포인트 사용</td>
                        <td>
                            <div>
                            	
                                <span>상품 구매 포인트 사용</span>
                                <!-- 
                                <span class="point_order"><%= orderNo.get(i) %>주문번호 사용</span>
                                -->
                            </div>
                        </td>
                        <td class="point_green"></td>
                        <td class="point_red">- <%= pointUse.get(i) %></td>
                    </tr>
                <% } else { %>
                    <!-- 포인트 적립 -->
                    <tr class="tr2">
                        <td><%= pointDate.get(i) %></td>
                        <td>포인트 적립</td>
                        <td>
                            <div>
                                <% if(pointAdd.get(i) == 3000) { %>
                                    <span>회원 가입 이벤트</span>
                                <% } else if(pointAdd.get(i) == 500) { %>
                                    <span>리뷰 작성 이벤트</span>
                                <% } else { %>
                                    <span>리뷰 작성 이벤트 참여</span>
                                <% } %>
                                <span></span>
                            </div>
                        </td>
                        <td class="point_green">+ <%= pointAdd.get(i) %></td>
                        <td class="point_red"></td>
                    </tr>
                <% } %>
            <% } %>
        <% } %>
    </table>
</div>

            </div>
            <!-- 보여지는 화면 end -->
            <!-- ---------------------------------------- -->
        

      </div>
      <!-- 좌우로 영역 나누기(사이드바, contents) end -->
    </section>
    <!-- section end -->
    <!-- 적립금 페이지 End-->
    
    
    <!--footer start-->   
    <header>
    	<%@ include file="/views/common/footer.jsp"%>
    </header>
    <!--footer end-->
	

</body>
</html>