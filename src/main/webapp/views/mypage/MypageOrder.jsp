<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.formypet.mypage.model.vo.Order" %>
<%@ page import="java.util.List, java.util.Date, java.util.ArrayList" %>
<%
	List<Integer> proNo = (List<Integer>) request.getAttribute("proNo");
	List<String> proImage = (List<String>) request.getAttribute("proImage");
	List<String> proName = (List<String>) request.getAttribute("proName");
    List<Date> count = (List<Date>) request.getAttribute("count");
    List<Integer> price = (List<Integer>) request.getAttribute("price");
    List<Date> orderDate = (List<Date>) request.getAttribute("orderDate");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문·교환·반품·취소 내역</title>
</head>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 브레드크럼 css -->
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/breadcrumb.css">

<!-- 마이페이지 css -->
<script src="<%= request.getContextPath() %>/resources/js/MypageOrder.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/mypage/Mypage.css">

<!-- 마에페이지 주문전용 css -->
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/mypage/MypageOrder.css"> 

<!-- 날짜 기능 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/MypageDate.css">


<body class="mx-auto">

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
            <li>주문·교환·반품·취소 내역</li>
            
        </ol>
    </div>
    <!-- 브레드크럼 end -->
    
    
   <!-- 주문·교환·반품·취소 내역 페이지 start-->
    <!-- 제목 -->
    <h1 class="contentTitle">주문·교환·반품·취소 내역</h1>
    
    <!-- section start -->
    <section>
        <!-- 좌우로 영역 나누기(사이드바, contents) start -->
        <div class="dividing_area1">
        
        
            <!-- 사이드바 -->
            <div class="sidebar">
            	<%@ include file="/views/mypage/Sidebar.jsp"%>
            </div>
            
            
            <!-- contents start-->
            <div class="content_div">


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

                
                <!-- 주문·교환·반품·취소 버튼 start -->
				<div class="div_total mouse_hover">
				    <div class="product_order" onclick="selectTab('orderContent1')">
				        <p>주문</p>
				        <hr class="hr_selected">
				    </div>
				    <div class="product_chagne" onclick="selectTab('orderContent2')">
				        <p>교환</p>
				        <hr class="hr_NoSelected">
				    </div>
				    <div class="product_return" onclick="selectTab('orderContent3')">
				        <p>반품</p>
				        <hr class="hr_NoSelected">
				    </div>
				    <div class="product_cancle" onclick="selectTab('orderContent4')">
				        <p>취소</p>
				        <hr class="hr_NoSelected">
				    </div>
				</div>
				<!-- 주문·교환·반품·취소 버튼 end -->
				
				
				<!-- 결과 값 출력 -->
				<div id="orderContent1" class="content_result" style="display: none;">
				    <!-- 주문 내역 start-->
				    <p class="mypage_font6">주문내역</p>
				    <% for(int i =0; i < proName.size(); i++) { %>
				        <div class="mypage_order_detail">
				            <p class="mypage_font8"><%= orderDate.get(i) %></p>
				            <a href="" class="mypage_font8"></a>
				        </div>
				        <hr>
				        <table class="table">
				            <tr>
				                <td class="td1" rowspan="2">
				                    <a href="<%= contextPath %>/detail.pro?no=<%= proNo.get(i) %>&page=1">
				                        <img src="<%= proImage.get(i) %>" alt="상품이미지">
				                    </a>
				                </td>
				                <td>
				                    <a href="<%= contextPath %>/detail.pro?no=<%= proNo.get(i) %>&page=1">
				                        <span><%= proName.get(i) %></span>
				                    </a>
				                </td>
				                <td rowspan="4" class="td3">
				                    <p class="mypage_font2">&nbsp;</p>
				                    <span>배송완료</span>
				                </td>
				            </tr>
				            <tr>
				                <td class="td2">
				                    <a href="<%= contextPath %>/detail.pro?no=<%= proNo.get(i) %>&page=1">
				                        <span class="mypage_font4"><%= count.get(i) %>개/ <%= price.get(i) %>원</span>
				                    </a>
				                </td>
				            </tr>
				        </table>
				        <hr class="hr3">
				    <% } %>
				    <!-- 주문 내역 end-->
				</div>
				
				<div id="orderContent2" class="content_result" style="display: none;">
				    <!-- 교환 내역 start-->
				    <p class="mypage_font6">교환내역</p>
				    <!-- 교환 내역 end-->
				</div>
				
				<div id="orderContent3" class="content_result" style="display: none;">
				    <!-- 반품 내역 start-->
				    <p class="mypage_font6">반품내역</p>
				    <!-- 반품 내역 end-->
				</div>
				
				<div id="orderContent4" class="content_result" style="display: none;">
				    <!-- 취소 내역 start-->
				    <p class="mypage_font6">취소내역</p>
				    <!-- 취소 내역 end-->
				</div>


                
                
                

            </div>
            <!-- contents end-->

  
            
        </div>
        <!-- 좌우로 영역 나누기(사이드바, contents) end -->


    </section>
    <!-- section end -->

    <!-- 주문·교환·반품·취소 내역 페이지 End-->





    <!-- 푸터 영역 start -->
    <footer>
    	<%@ include  file="/views/common/footer.jsp"%>
    </footer>
    <!-- 푸터 영역 end -->


</body>
</html>
