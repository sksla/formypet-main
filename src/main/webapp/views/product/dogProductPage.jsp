<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 
<%@page import="com.formypet.common.model.vo.PageInfo"%>  
<%@ page import="com.formypet.product.model.vo.Product" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Product> list = (List<Product>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>header</title>
  <style>
   	#menu_d a{
	    font-weight: bold;
	    color: #ffa51f; 
	    text-shadow: 1px 1px 1px #b47920;
  	}
	.product_best{
	    text-align: center;
	    padding-bottom: 50px;
	    text-shadow: 1px 1px 1px;
	}
	.category_area_dog{
	     height: 360px;
	     background-color: #ffa51f50;
	     padding-top: 40px;
	}
	.category_area_cat{
	    height: 400px;
	    background-color: #ffa51f50;
	    padding-top: 40px;
	}
	.category{
	    width: 100%;
	    padding-bottom: 30px;
	    align-items: center;
	    display: flex;
	    padding-bottom:8px;
	    padding-top: 5px;
	}
	.big_category{
	    width: 15%;
	    height: 50px;
	    text-align: center;
	    font-size: 22px;
	    color: rgb(37, 28, 28);
	    text-shadow: 1px 1px 2px rgb(136, 127, 127) ;
	}
	.category td{
	    padding: 10px;
	    text-align: left;
	    /* border-top: 1px dotted darkgray; */
	}
	
	.category_line{
	    border-top: 2px solid darkgray;
	    border-bottom: 2px solid darkgray;
	}
	.category span{
	    font-size: 13px;
	    padding-left: 3px;
	}
	.best_product{
	    display: flex;
	    justify-content: space-around;
	    border-bottom: 2px solid darkgray;
	    padding-bottom: 50px;
	 }
	
	 .product_content>div{
	    /* border: 2px solid #1ABC9C; */
	    width: 80%;
	    margin: auto;
	    /* margin-top: 50px; */
	    margin: bottom 50px; 
	    min-height: 1000px;
	    padding: 50px;
	    border-radius: 10px;
	}
	.product_main{
	    margin-top: 100px;
	}
	.category td:hover{
		cursor:pointer;
		font-weight:bolder;
	}
	
	td.active{
		font-weight: bolder;
		color: #e67e22;
	}
	
	/* 상품 품절일 때 스타일 */
	#thumbnail_status{
	    width: 240px;
	    height: 50px;
	    background-color: rgba(95, 95, 95, 0.600);
	    color: white;
	    text-align: center;
	    position: absolute;
	    top: 200px;
	    z-index: 10;
	    font-size: 30px;
	    font-weight: bolder;
	}
		
	/* ------------------------ 페이징 바 ----------------------------- */
	.page-link{
	    color: darkgray;
	}
	.page-link::marker{
	    background-color: #ffa51f;
	}
	.pagination .page-item.active .page-link {
	    background-color: #ffd000; 
	    color: #fff; 
	    border-color: #f7cb07;
	}
  </style>
</head>

<body>
	<div class="wrap">

		<!--head start-->
		<%@ include file="/views/common/header.jsp"%>
		<!--head end-->

		<!-- category start -->
		<div class="category_area_dog">
			<div class="category">
				<table style="margin: 0 auto; width: 60%;">
					<tr>
						<th class="big_category" rowspan="2">사료</th>
						<td colspan="2" >퍼피<span>(1세 미만)</span></td>
						<td colspan="2" >어덜트<span>(1~7세 미만)</span></td>
						<td colspan="2" >시니어<span>(7세 이상)</span></td>
						<td colspan="2" style="padding-right: 70px; border-top: 0;">전연령</td>
					</tr>

					<tr>
						<td colspan="2">건식사료</td>
						<td colspan="2">에어/동결사료</td>
						<td colspan="4" style="text-align: left; padding-left: 50px;">습식사료</td>

					</tr>
				</table>
			</div>
			<div class="category">
				<table style="margin: 0 auto; width: 60%;">
					<tr>
						<th class="big_category">간식</th>
						<td>뼈간식</td>
						<td style="padding-right: 20px;">껌</td>
						<td style="padding-right: 10px;">저키</td>
						<td style="padding-left: 20px;">음료</td>
						<td style="padding-left: 20px;">영양/기능</td>
						<td style="padding-right: 20px;">처방식</td>
						<td>수제간식</td>
					</tr>
				</table>
			</div>
			<div class="category">
				<table style="margin: 0 auto; width: 60%;">
					<tr>
						<th class="big_category" rowspan="2">용품</th>
						<td>배변용품</td>
						<td>위생용품</td>
						<td>미용/관리</td>
						<td>산책용품</td>
						<td>훈련용품</td>
						<td>장난감</td>
						<td colspan="2">노즈워크</td>
					</tr>
					<tr>
						<td colspan="2">의류/악세사리</td>
						<td style="padding-left: 0px;">생활용품</td>
						<td colspan="2" style="padding-left: 40px;">급수/급식기</td>
						<td colspan="3" style="text-align: left;">기타</td>
					</tr>
				</table>
			</div>
		</div>
		
		<script>
		
		</script>
		<!-- category start -->

		<!--section start-->

		<section class="main_content">
			<!-- 
			<div class="d_product_best">
				<h1 class="product_best">●●● BEST ●●●</h1>
				<div class="best_product">
					<div class="thumbnail">
						<img class="thumbnail_img" src="../../resources/images/오리젠퍼피.png"
							alt="">

						<table class="thumbnail_etc">
							<tr>
								<th colspan="4" class="product_name">오리젠 독 퍼피</th>
							</tr>
							<tr>
								<td colspan="4" class="o_price"><s>40,000</s></td>
							</tr>
							<tr>
								<td colspan="2" class="discount"><b>20</b>%</td>
								<td colspan="2" class="s_price">29,200 <a> 원 </a></td>
							</tr>
							<tr>
								<td colspan="2" class="star">★</td>
								<td class="average">4.9</td>
								<td class="review_count">(1,000)</td>
							</tr>
						</table>
					</div>
				</div>
				 -->
			<!----------------------------------------------------------------------------------------------------------->
			<%if(list.isEmpty()){ %>
			<!-- 리스트가 존재하지 않았을 때 쓸 구문~ -->
			<h5>존재하는 상품이 없습니다.</h5>
			
			<%}else{ %>
			<div class="product_main">
				<div class="main_list">
					<%for(Product p : list){ %>
					<% if(!p.getStatus().equals("N")){ %>
					<div class="thumbnail">
					<input type="hidden" value="<%=p.getProNo() %>">
						<img class="thumbnail_img" src="<%= p.getProMainImage() %>">
				    	<%if(p.getStock()==0){ %>
				    	<div id="thumbnail_status">품절</div>
				  		<%}%>
						<table class="thumbnail_etc">
							<tr>
								<th colspan="4" class="product_name"><%=p.getProName() %></th>
							</tr>
							<%if(p.getStatus().equals("E")){ %>
							<tr>
								<td colspan="4" class="o_price"><s><%=p.getPrice() %></s></td>
							</tr>
							<tr>
								<td colspan="2" class="discount"><b><%=p.getDiscount() %></b>%</td>
								<td colspan="2" class="fin_price"><%=p.getPrice() - (int)((p.getPrice() * p.getDiscount()) * 0.01) %><a> 원 </a></td>
							</tr>
							<%}else{ %>
							<tr>
								<td colspan="4" class="o_price"></td>
							</tr>
							<tr>
								<td colspan="2" class="discount"></td>
								<td colspan="2" class="fin_price"><%= p.getPrice()%><a> 원 </a></td>
							</tr>
							<%} %>
							<tr>
								<td colspan="2" class="star">★</td> 
								<td class="average"><%=p.getStar() %></td> 	
								<td class="review_count">(&nbsp <%= p.getReCount() %> &nbsp )</td>  
							</tr>
						</table>
					</div>
					<%} %>
					<%} %>
					</div>

					<br>
					<ul class="pagination pagination-sm justify-content-center">
						<%if(pi.getCurrentPage() == 1){ %>
						<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a></li>
						<%} else{ %>
						<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.d?kind=D&page=<%=pi.getCurrentPage() - 1%>" tabindex="-1" aria-disabled="true">&lt;</a></li>
						<%} %>
						<%for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
			                <%if(p == pi.getCurrentPage()){ %>
							<li class="page-item"><a class="page-link" href="#"><%=p %></a></li>
							<%}else{ %>
							<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.d?kind=D&page=<%=p%>"><%=p %></a></li>
							<%} %>
                   		 <%} %>
                   	 	<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
						<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
					 	<%} else{ %>
						 <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.d?kind=D&page=<%=pi.getCurrentPage() + 1%>">&gt;</a></li>
					 	<%} %>
					</ul>
				</div>
				<%} %>
				
				<script>
				 // 페이지 로드 시 현재 페이지에 해당하는 페이지 숫자의 배경색을 변경하는 함수
			    function setPageBackground() {
			        // 현재 페이지 번호 가져오기
			        var currentPage = <%= pi.getCurrentPage() %>;
			        // 페이지 숫자 요소들을 가져옴
			        var pageItems = document.querySelectorAll('.page-item');

			        // 각 페이지 숫자 요소에 대해 현재 페이지에 해당하는 요소에 active 클래스 추가
			        pageItems.forEach(function(item) {
			            if (parseInt(item.innerText) === currentPage) {
			                item.classList.add('active');
			            }
			        });
			    }

			    // 페이지 로드가 완료되면 배경색 변경 함수를 호출
			    window.onload = function() {
			        setPageBackground();
			    };
			    
			    
			    // 상품 상세 페이지로 이동하는 함수
			    $(function(){
			    	$(".thumbnail").click(function(){
			    		location.href = "<%=contextPath%>/detail.pro?no="+$(this).children().eq(0).val()+"&page=1";
			    	});
			    		
				    	
				    	$(".category_area_dog td").click(function(){
				    		
				    	 	$(".category_area_dog td").removeClass("active");
				    		$(this).addClass("active");
				    		let obj = ($(this).html().indexOf("<span>")== -1) ? $(this).html() : $(this).html().substring(0, ($(this).html().indexOf("<span>")));
				    		category(1, obj);
				    		
				    	});
				    	
				    });
				    
				    	// 검색요청 ajax => 검색결과리스트, 페이징바만들기위한 pi 응답해야됨
			    		// ajax 요청시 현재 이벤트가 발생된 td요소의 innerText 값 전달 
			    		// => 서블릿만들어서 전달받은 카테고리값을 가지고 총갯수 조회 + PageInfo 객체 만들기, 카테고리값을 가지고 리스트조회하기 
				    function category(pg,obj) {
					    $.ajax({
					        url: "<%=contextPath%>/cate.p",
							data : {
								kind : "D",
								cate : obj,
								page : pg
							},
							success : function(result) {
								let value = "";
								if (result.list.length > 0) {
								$(".thumbnail").html(value);
									for (let i = 0; i < result.list.length; i++) {
										const list = result.list[i];
										if(list.status!=="N"){ 
											value += "<div class='thumbnail'>"
												  + "<input type='hidden' value='"+list.proNo+"'>"
												  + "<img class='thumbnail_img' src='"+list.proMainImage+"'>";
											if (list.stock == 0) {
												value += "<div id='thumbnail_status'>품절</div>";
											}
											value += "<table class='thumbnail_etc'>"
													+ "<tr><th colspan='4' class='product_name'>"
													+ list.proName
													+ "</th></tr>";
											if (list.status === "E") {
												value += "<tr><td colspan='4' class='o_price'><s>"
														+ list.price
														+ "</s></td></tr>"
														+ "<tr><td colspan='2' class='discount'><b>"
														+ list.discount
														+ "</b>%</td>"
														+ "<td colspan='2' class='fin_price'>"
														+ (list.price - parseInt((list.price * list.discount) * 0.01))
														+ "<a> 원 </a></td></tr>";
											} else {
												value += "<tr><td colspan='4' class='o_price'></td></tr>"
														+ "<tr><td colspan='2' class='discount'></td>"
														+ "<td colspan='2' class='fin_price'>"
														+ list.price
														+ "<a> 원 </a></td></tr>";
											}
											value += "<tr><td colspan='2' class='star'>★</td><td class='average'>"
													+ list.star
													+ "</td><td class='review_count'>("
													+ list.reCount
													+ ")</td></tr>"
													+ "</table></div></div>";
										}
										}
									}
								$(".main_list").html(value);	
								
								$(".thumbnail").click(function(){
						    		location.href = "<%=contextPath%>/detail.pro?no="+$(this).children().eq(0).val()+"&page=1";
						    	});

								let paging = "";
								const pi = result.pi;
								if(pi.currentPage == 1){
									<%-- 현재 노출되는 p 페이지 수가 1일 경우 --%>
									paging += "<li class='page-item disabled'><a class='page-link' href='#'>Prev</a></li>";
								}else{
									paging += "<li class='page-item'><a class='page-link' href='#' onclick='category(" + (pi.currentPage - 1) + ", \"" + obj + "\");'>Prev</a></li>";
								}
								
								for(let p=pi.startPage; p<=pi.endPage; p++){
									if(p == pi.currentPage){
										<%-- 현재 노출되는 p 페이지 수가 내가 보고 있는 현재 페이지일 경우 --%>
										paging += "<li class='page-item active'><a class='page-link' href='#' onclick='category(" + p + ", \"" + obj + "\");'>" + p + "</a></li>";
									}else{
										paging += "<li class='page-item'><a class='page-link' href='#' onclick='category(" + p + ", \"" + obj + "\");'>" + p + "</a></li>";
										
									}
								}
								
								if(pi.currentPage == pi.maxPage){
									<%--내가 현재 보고 있는 페이지가 마지막페이지일 경우 --%>
									paging += "<li class='page-item disabled'><a class='page-link' href='#'>Next</a></li>";
								}else{
									paging += "<li class='page-item'><a class='page-link' href='#' onclick='category(" + (pi.currentPage + 1) + ", \"" + obj + "\");'>Next</a></li>";
								}
								
								$(".pagination").html(paging);
								
							},
							error : function() {
								console.log("ajax 통신 실패");
							}

						});
					    
					    
					}
			    		
			    		
			 
				</script>
		</section>


		<!--section end-->


		<!--footer start-->
		<%@ include file="/views/common/footer.jsp"%>
		<!--footer end-->

	</div>




	</div>

</body>

</html>