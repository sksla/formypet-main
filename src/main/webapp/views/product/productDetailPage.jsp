<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>  
<%@ page import="com.formypet.product.model.vo.*" %>
<%@ page import="com.formypet.common.model.vo.*" %>
<%@ page import="com.formypet.board.model.vo.*" %>
<%@page import="com.formypet.common.model.vo.PageInfo"%> 

<%
	Product p = (Product)request.getAttribute("p");	
	List<Attachment> at = (List<Attachment>)request.getAttribute("at");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Review> re = (List<Review>)request.getAttribute("re");
	int wish = 0;
	if(request.getAttribute("wish")!= null){
		wish = (int)request.getAttribute("wish");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>

<!-- 장바구니 아이콘 부트스트랩 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<!-- 상품 상세 페이지 스타일 -->
	<style>
	.pro_top, .product_bar, .pro_detail, .product_review {
		display: flex;
		justify-content: center;
		align-items: center;
		padding-top: 25px;
		padding-bottom: 15px;
	}
	
	.top_table {
		width: 60%;
		margin-top: 40px;
	}
	
	.product_img {
		width: 45%;
		padding: 10px;
		position: relative;
	}
	
	.product_img img {
		width: 600px;
	}
	
	.product_order {
		padding-left: 50px;
		border-bottom: 2px solid darkgray;
	}
	
	.product_order b {
		font-size: 33px;
	}
	
	.product_order p {
		font-size: small;
		color: rgb(117, 114, 114);
	}
	
	.price_info b {
		font-size: x-large;
		padding-left: 15px;
	}
	
	.total_price {
		display: flex;
		margin-left: 140px;
		padding-top: 10px;
	}
	
	.total_price b {
		margin-left: 20px;
		font-size: 33px;
	}
	
	.total_price span {
		padding-top: 18px;
		padding-left: 5px;
	}
	
	.order_btn {
		text-align: center;
		padding-top: 10px;
	}
	
	.order_btn a {
		background-color: #fff458;
		border: none;
		padding: 10px;
		color: rgb(48, 44, 44);
		border-radius: 5px;
		width: 120px;
		font-size: small;
	}
	
	
	.bar_table {
		width: 70%;
		border: 1px solid darkgray;
		text-align: center;
		border-radius: 30px;
	}
	
	.bar_table th {
		width: 33%;
	}
	
	.board_title {
		cursor: pointer;
	}
	
	.review_table{
		text-align: center;
	}
	
	.re_attach{
		display:flex;
		margin:auto;
	} 
	
	.pro_star{
		width:40px;
	}
	/* 찜하기 관련 스타일 */
	.bi-heart {
		font-size: 60px;
	}
	
	.bi-heart-fill{
		font-size: 60px;
		color:red;
	}
	
	.wish_icon {
		position: absolute;
		top: 520px;
		left: 530px;
	}
	
	 .insert_wish, .remove_wish {
        display: none;
    }
    
	/* 상품 품절일 때 스타일 */
	#thumbnail_status{
	    width: 600px;
	    height: 70px;
	    background-color: rgba(95, 95, 95, 0.600);
	    color: white;
	    text-align: center;
	    position: absolute;
	    top: 450px;
	    z-index: 10;
	    font-size: 40px;
	    font-weight: bolder;
	}
		.order_btn button {
		background-color: lightgray;
		border: none;
		padding: 10px;
		color: white;
		border-radius: 5px;
		width: 120px;
		font-size: small;
	}
	</style>
</head>
<body>
	<div class="wrap">

		<!--head start-->
		<%@ include file="/views/common/header.jsp"%>
		<!--head end-->


		<!-- section category start-->
		<section>
			<div class="pro_top">
				<table class="top_table">
					<tr>
						<th class="product_img" rowspan="2">
						<img src="<%= p.getProMainImage()%>">
						<%if(p.getStock()==0){ %>
						<div id="thumbnail_status">품절</div>
				    	<%} %>
				    	<%-- <%if(loginUser == null){ %>
				    	<div class="wish_icon">
							<i class="bi bi-heart"></i>
						</div>
				    	<%}else{ %> --%>
							<div class="wish_icon">
							<%if(wish == 0){ %>
								<i class="bi bi-heart non-heart"></i>
							<%}else { %>
								<i class="bi bi-heart-fill heart"></i>
							<%} %>
							</div>
							<%-- <%} %> --%>
						</th>
						<td class="product_order">
						<b><%= p.getProName() %></b><br> <br>
							<%if(p.getStar()==5){ %>
								<span><img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								<img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								<img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								<img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								<img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								</span><br><br><br>
							<%}else if(p.getStar()==4){ %>
								<span><img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								<img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								<img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								<img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								</span><br><br><br>
							<%}else if(p.getStar()==3){ %>
								<span><img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								<img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								<img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								</span><br><br><br>
							<%}else if(p.getStar()==2){ %>
								<span><img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								<img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								</span><br><br><br>
							<%}else if(p.getStar()==1){ %>
								<span><img src="<%=contextPath%>/resources/images/star.png" class="pro_star">
								</span><br><br><br>
							<%}else { %>
								<span> </span><br><br><br>
							<%} %>
							
							<p>
								평일 오후 3시 이전 주문시 자사 당일 배송 <br> 적립금 1%
							</p><br>
							<% if(p.getStatus().equals("E")){ %>
							<div class="price_info">
								<span style="color: red; font-weight: bolder; font-size: large;"><%= p.getDiscount() %>%</span>
								<s style="color: lightgray; padding-left: 10px;"><%= p.getPrice() %></s>
								<b id="s_price"><%=p.getPrice() - (int)((p.getPrice() * p.getDiscount()) * 0.01) %></b><span> 원</span>
							</div>
							<%}else{ %>
							<div class="price_info">
								<span style="color: red; font-weight: bolder; font-size: large;"></span>
								<s style="color: lightgray; padding-left: 10px;"></s>
								<b id="s_price"><%=p.getPrice() %></b><span> 원</span>
							</div>
							<%} %>
							<br> <br>
							<label for="quantity">* 수량</label> &nbsp;&nbsp;
							<input type="number" name="quantity" min="1" value="1" id="quantity" onchange="sum();">
						</td>

					</tr>
					<tr>
						<td>
							<div class="total_price">
								<span>총 상품 금액</span> <b id="t_price"></b> <span> 원</span>
							</div> 
						</td>
					</tr>
					<tr>
						<th></th>
						<th class="order_btn">
							<%if(p.getStock()==0||loginUser == null){ %>
							<button type="button" disabled>장바구니</button> &nbsp;
							<button type="button" disabled>구매하기</button>
							<%}else{ %>
							<a type="button" class="insert_cart">장바구니</a> &nbsp;
							<a type="button" class="buy_now">구매하기</a>
							<%} %>
						</th>
					</tr>
				</table>
			</div>
			<div class="product_bar">
				<table class="bar_table">
					<tr>
						<th>상품 상세 설명</th>
					</tr>
				</table>
			</div>
		
			<div class="pro_detail">
			<%for(Attachment a : at){%>
			<%if(a.getFileLevel()==2){ %>
				<img src="<%= a.getFilePath()+a.getChangeName()%>">
				<%} %>
			<%} %>
			</div>
			<hr>

			<div class="product_review">
				<div class="review_section">
					<h4>REVIEW</h4>
					<%if(re.isEmpty()){%>
					<table class="review_table" style="width:100%;">
						<thead>
                        <tr>
                            <td colspan="5">아직 등록된 리뷰가 없습니다.</td>
                        </tr>   
                        </thead>
                        </table>
                    <%}else{ %>
                    <table class="review_table">
                        <thead>
							<tr>
								<th width="50px">번호</th>
								<th width="70px">평점</th>
								<th width="600px">글제목</th>
								<th width="120px">작성자</th>
								<th width="120px">작성일</th>
							</tr>
						</thead>
						<%for(Review r : re){ %>
						<tbody>
							<tr class="board_title" data-toggle="collapse" data-target="#re_<%=r.getReNo() %>">
								
								<td><%=r.getReNo() %></td>
								<%if(r.getReStar() == 5){ %>
									<td>★★★★★</td>
								<%}else if(r.getReStar() == 4){ %>
									<td>★★★★☆</td>
								<%}else if(r.getReStar() == 3){ %>
									<td>★★★☆☆</td>
								<%}else if(r.getReStar() == 2){ %>
									<td>★★☆☆☆</td>
								<%}else if(r.getReStar() == 1){ %>
									<td>★☆☆☆☆</td>
								<%} %>
								
								<td><%=r.getReTitle() %></td>
								<td><%=r.getReWriter() %></td>
								<td><%=r.getEnrollDate() %></td>
							</tr>
							<tr id="re_<%=r.getReNo() %>" class="collapse">
								<%if(r.getAtList()!=null){ %>
									<%for(int i= 0; i<r.getAtList().size(); i++){ %>
									<td colspan="5-<%=i %>" class="border rounded p-3" style="paddig-top:10px; max-width:75%;">
									<img src="<%=contextPath + '/'+r.getAtList().get(i).getFilePath()+r.getAtList().get(i).getChangeName()%>">
									<%} %>
										<p style="min-height: 150px;" ><br><br><%=r.getReContent() %></p>
									</td>
								<%}else{ %>
									<td colspan="5">
										<p style="min-height: 150px;" class="border rounded w-75 mx-auto p-3"><%=r.getReContent() %></p>
									</td>
								<%} %>
							</tr>
						</tbody>
						<%} %>
					</table>
					<br>
					<ul class="pagination pagination-sm justify-content-center">
						<%if(pi.getCurrentPage() == 1){ %>
						<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a></li>
						<%} else{ %>
						<li class="page-item"><a class="page-link" href="<%=contextPath%>/detail.pro?no=<%=p.getProNo() %>&page=<%=pi.getCurrentPage() - 1%>" tabindex="-1" aria-disabled="true">&lt;</a></li>
						<%} %>
						<%for(int pg = pi.getStartPage(); pg <= pi.getEndPage(); pg++){ %>
			                <%if(pg == pi.getCurrentPage()){ %>
							<li class="page-item"><a class="page-link" href="#"><%=pg %></a></li>
							<%}else{ %>
							<li class="page-item"><a class="page-link" href="<%=contextPath%>/detail.pro?no=<%=p.getProNo() %>&page=<%=pg%>"><%=pg %></a></li>
							<%} %>
                   		 <%} %>
                   	 	<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
						<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
					 	<%} else{ %>
						 <li class="page-item"><a class="page-link" href="<%=contextPath%>/detail.pro?no=<%=p.getProNo() %>&page=<%=pi.getCurrentPage() + 1%>">&gt;</a></li>
					 	<%} %>
					</ul>
					<%}%>
					<div class="pagination"></div>
				</div>
				<br><br>

			</div>
			<br><br>

		</section>
			<script>
			let proNo = "<%= p.getProNo() %>";
			let price = "<%=p.getPrice()%>";
			
			$(function(){
				
			    function sum() {
			        let s = parseInt($("#s_price").text().replace('원', '').replace(',', ''));
			        let q = $("#quantity").val();
			        let totalPrice = s * q;
			        $("#t_price").text(totalPrice.toLocaleString());
			    }
			    
			    sum();

			    // 수량 변경 시 합계 업데이트
			    $("#quantity").on('change', function() { 
			        sum();
			    });
			    
			    // 장바구니 버튼 클릭 시
			    $(".insert_cart").click(function(){    
			        $.ajax({
			            type: "POST", 
			            url: "<%=contextPath%>/insert.cart", // 장바구니에 추가하는 서블릿 또는 처리할 URL
			            data: {
			            	proNo: proNo, 
			                quantity: $("#quantity").val(),
			                price: price
			            },
			            success: function(result){
			            	if(result >0){
			                	alert("장바구니에 추가되었습니다.");
			            	}
			            },
			            error: function(result){
			                console.log("통신실패");
			            }
			        });
			      
			    });
			    
			    // 구매하기 버튼 클릭 시
			    $(".buy_now").click(function(){
			        var quantity = $("#quantity").val();
			       
			        if(<%=p.getStatus().equals("E")%>){
			        	location.href = "<%=contextPath%>/order.buy?pNo=" + proNo + "&quantity=" + quantity+"&price="+"<%=p.getPrice() - (int)((p.getPrice() * p.getDiscount()) * 0.01)%>"; 
			        }else{
			        	location.href = "<%=contextPath%>/order.buy?pNo=" + proNo + "&quantity=" + quantity+"&price="+"<%=p.getPrice()%>"; 
			        					// 임의로 주문 servlet 씀  */
			        }
			    });
			
			    <%if(loginUser !=null){ %>
			    $(".bi-heart, .bi-heart-fill").click(function(){
			        if($(this).hasClass("bi-heart")){
			            $(this).removeClass("bi-heart");
			            $(this).addClass("bi-heart-fill");

			        }else{
			            $(this).removeClass("bi-heart-fill");
			            $(this).addClass("bi-heart");
			        }
			    });
			    <%}%>
			});
			
			</script>

		<!--section content end-->


		<!--footer start-->
		<%@ include file="/views/common/footer.jsp"%>
		<!--footer end-->

	</div>

	</div>

</body>
</html>