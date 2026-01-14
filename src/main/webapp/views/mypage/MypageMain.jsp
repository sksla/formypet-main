<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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

<body>

    <!--head start-->   
    <header>
    	<%@ include file="/views/common/header.jsp"%>
    </header>
    <!--head end-->
    
   	<!-- 브레드크럼 start -->
    <div class="breadc">
        <ol>
            <li><a href="<%= request.getContextPath()%>">Home</a></li>
            <li class="separator">&gt;</li>
            <li>마이페이지</li>
        </ol>
    </div>
   	<!-- 브레드크럼 end -->
    	
    
    
    <!-- 메인페이지 start-->
    <!-- 제목 -->
    <h1 class="contentTitle">마이페이지</h1>
    
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
                <hr class="hr2">

                <!-- 좌우로 영역 나누기(프로필,적립금상품리뷰)  start -->
                <div class="dividing_area1">
                    <!-- 프로필 -->
                    <div class="mypage_profile_left">
                        <div class="mypage_profile_circle">
                            <a href="<%=request.getContextPath()%>/MypageModification"><img src="<%=request.getContextPath()%>/resources/images/cat2.png" alt="프로필사진"></a>
                        </div>
                        <div>
                            
                            <a href="<%=request.getContextPath()%>/MypageModification" class="mypage_font1"><%= request.getAttribute("userName") %> 님></a>
                            <p class="mypage_font2">접속 ID : <%= request.getAttribute("userId") %></p>
                            <div>
                                <span>누적 구매금액</span>
                               
                                <span class="mypage_font3"><%= String.format("%,d", (Integer)request.getAttribute("totalAmount")) %></span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 적립금, 상품리뷰 --> 
                    <div class="mypage_profile_right">
                        <div>
                            <p class="mypage_font4">적립금</p>
                            <% 
                            	int pointTotal = (int)request.getAttribute("pointTotal");
							    String formattedPointTotal = String.format("%,d", pointTotal);
						    %>
                            <p class="mypage_font5"><a href="<%=request.getContextPath()%>/MypagePoint"><%= formattedPointTotal %> 원</a></p>
                        </div>

                        <hr class="hr1">
                        
                        <div>
                            <p class="mypage_font4">상품리뷰</p>
                            <p class="mypage_font5"><a href="">10 건</a></p>
                        </div>
                    </div>
                    
                </div>
                <!-- 좌우로 영역 나누기(프로필,적립금상품리뷰)  end -->
                <hr class="hr2">
                

                <!--
                    상품 주문상태 유형
                    1. 주문
                        - 입금대기중, 주문취소(클릭가능)
                        - 배송준비중
                        - 배송중, 배송조회(클릭가능)
                        - 배송완료
                    2. 교환
                        - 교환접수중, 교환취소(클릭가능)
                        - 교환진행중, 배송조회(클릭가능)
                        - 교환완료
                    3. 반품
                        - 반품접수중, 반품취소(클릭가능)
                        - 반품진행중, 배송조회(클릭가능)
                        - 반품완료
                    5. 취소 (1번 주문 이후 주문취소 시 다음 상태로 변경됨)
                        - 취소완료
                 -->


                <!-- ------------------ -->
                <!-- 주문 영역 start -->
                <div class="content_order">
                    
                    <!-- 주문 내역 없을 경우 -->
                    <p>현재 진행중인 주문·교환·반품·취소내역이 없습니다.</p>



                </div>
                <hr>
                <!-- 주문 영역 end -->
				<!-- ------------------ -->


                <!-- 활동 영역 start -->
                <div class="mypage_activity">
                    <div>
                        <div>
                            <div class="mypage_activity2">
                                <p class="mypage_font3">1:1문의</p>
                                <p class="mypage_font3"><a href="<%=request.getContextPath()%>/MypageWish">위시리스트</a></p>
                            </div>
                            
                            <div class="mypage_activity2">
                            </div>
                            
                            
                            <div class="mypage_activity2">
                                <p class="mypage_font3">0</p>
                                <p class="mypage_font3"><a href="<%=request.getContextPath()%>/MypageWish"><%= request.getAttribute("wishCount") %></a></p>
                            </div>
                        </div>
                    </div>
                   </div>


                    
                </div>
                <!-- 활동 영역 end -->




                
            </div>
            <!-- contents end-->
            

        </div>
        <!-- 좌우로 영역 나누기(사이드바, contents) end -->


    </section>
    <!-- section end -->


    
    <!-- 메인페이지 End-->





    <!-- 푸터 영역 start -->
    <footer>
    	<%@ include  file="/views/common/footer.jsp"%>
    </footer>
    <!-- 푸터 영역 end -->


</body>
</html>
