<%@page import="java.io.ObjectInputFilter.Status"%>
<%@page import="com.formypet.product.model.vo.Stock"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.formypet.mypage.model.vo.WishlistProduct" %>
<%@ page import="com.formypet.product.model.vo.Product" %>
<%@ page import="java.util.List" %>
<%
	List<Integer> proNo = (List<Integer>) request.getAttribute("proNo");
	List<String> proImages = (List<String>) request.getAttribute("proImages");
	List<String> proNames = (List<String>) request.getAttribute("proNames");
	List<Integer> prices = (List<Integer>) request.getAttribute("prices");
	List<Integer> stock = (List<Integer>) request.getAttribute("stock");
	List<String> status = (List<String>) request.getAttribute("status");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
</head>
<body>

<!-- 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 브레드크럼 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/breadcrumb.css">

<!-- 마이페이지 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/Mypage.css">

<!-- 위시리스트 전용 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/MypageWish.css">

<!-- 사이드바 적용 js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<%= request.getContextPath()%>/resources/js/Mypage.js"></script>

	<!--head start-->   
	<header>
		<%@ include file="/views/common/header.jsp"%>
	</header>
	<!--head end-->

	<!-- 브레드크럼 start -->
    <div class="breadc">
        <ol>
            <li><a href="<%=request.getContextPath()%>">Home</a></li>
            <li class="separator">&gt</li>
            <li><a href="<%=request.getContextPath()%>/MypageMain">마이페이지</a></li>
            <li class="separator">&gt;</li>
            <li>위시리스트</li>
            
        </ol>
    </div>
    <!-- 브레드크럼 end -->

	<!-- 위시리스트 페이지 start-->
    <!-- 제목 -->
    <h1 class="contentTitle">위시리스트</h1>
    
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
            <div class="wishlist_contents">

                <div class="wishlist_title">
                    <div class="wishlist_title_left">
                        <span class="mypage_font3">전체</span>
                        <span class="mypage_font3 font_yellow"><%= request.getAttribute("wishCount") %></span>
                    </div>
                    <div class="wishlist_title_right">
                        <label class="wishlist_font1" for="wishlist_checkbox">
                            <input type="checkbox" id="checkbox_wishlist" class="checkbox_wishlist" value="">
                            <span class="checkbox_text">품절제외</span>
                        </label>
                        <button class="wishlist_delete" onclick="openModal('deleteAllWishlist');">전체삭제</button>
                    </div>
                </div>
                
                
                
                <!-- 전체 삭제 modal -->
				<div id="deleteAllWishlist" class="modal">
				    <div class="modal-content">
				        <p>정말로 전체 삭제하시겠습니까?</p>
				        <div>
					        <button onclick="deleteAllWishlist();" class="btn_delete">삭제</button>
					        <button onclick="closeModal('deleteAllWishlist');" class="btn_cancle">취소</button>
				        </div>
				    </div>
				</div>


				
                <!-- 상품 start -->
                <div class="wishlist_product">

				<% if (proImages != null && !proImages.isEmpty()) { %>
				<% for (int i=0; i < proImages.size(); i++) { %>
				<div class="div_pro">
				 	<div class="div_img">
				 	
				 	
								 	
				 	
				 		<!-- 상품 이미지 -->
						<a href="<%= contextPath %>/detail.pro?no=<%= proNo.get(i) %>&page=1" class="pro_img">
							<% if(stock.get(i) == 0) { %>
								<!-- 품절이면 -->
								<img src="<%= proImages.get(i) %>" class="soldout_img">
								<span class="soldout_text">품절</span>
							<% } else { %>
								<!-- 품절 아니면 -->
								<img src="<%= proImages.get(i) %>">
							<% } %>
							<button class="btn_x" onclick="deleteOneWishlist(<%= proNo.get(i) %>);">×</button>
						</a>
						
				 		<!--
				 		<script>
				          $(function(){
				              $(".div_pro>.div_img>.pro_img").click(function(){
				                  var proNo = $(this).siblings().eq(0).text();
				                  location.href = "<%= contextPath %>/detail.pro?no=" + proNo;    
				              })
				          })
				      </script>
				          -->
					</div>
					
					<!-- 상품 설명 -->
					<a href="<%= contextPath %>/detail.pro?no=<%= proNo.get(i) %>">
						<span class="wishlist_font2"><%= proNames.get(i) %></span>
						<% if(status.get(i).equals("E")) { %>
							<span class="wishlist_font3">40,000</span>
						<% } else { %>
							<span class="wishlist_font3">&nbsp;</span>
						<% } %>
						<div class="div_flex">
							<% if(status.get(i).equals("E")) { %>
								<span class="wishlist_font4">20%</span>
							<% } else { %>
								<span class="wishlist_font4">&nbsp;</span>
							<% } %>
							<div class="div_right">
								<% String priceStr = String.format("%,d", prices.get(i)); %>
								<span class="wishlist_font5"><%= priceStr %> 원</span>
							</div>
							
						</div>
						<div>
							<span class="wishlist_font6">⭐4.9 (7,541)</span>
						</div>
					</a>
				  
				</div>
				<% }  } else { %>
					<div class="wish_no">
			            <p>위시리스트에 상품이 없습니다.</p>
			            <a href="<%=request.getContextPath()%>"><div class="shopping">쇼핑 하러가기</div></a>
		        	</div>
				<% } %>
				
                        
                </div>
                <!-- 상품 end -->



                

            </div>
            <!-- 보여지는 화면 end -->
            <!-- ---------------------------------------- -->
        

      </div>
      <!-- 좌우로 영역 나누기(사이드바, contents) end -->
    </section>
    <!-- section end -->
    <!-- 위시리스트 페이지 End-->


	<!--footer start-->   
	<footer>
		<%@ include file="/views/common/footer.jsp"%>
	</footer>
	<!--footer end-->


</body>
</html>