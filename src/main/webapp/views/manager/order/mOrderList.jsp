<%@page import="com.formypet.common.model.vo.PageInfo"%>
<%@page import="com.formypet.order.model.vo.OrderDetail"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean order = (boolean)request.getAttribute("order");
	boolean cancel = (boolean)request.getAttribute("cancel");
	boolean change = (boolean)request.getAttribute("change");
	boolean reform = (boolean)request.getAttribute("reform");
	List<OrderDetail> list = (List<OrderDetail>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
</head>
<body>
	<%@ include file="/views/manager/common/header.jsp" %>
	
	<%@ include file="/views/manager/common/sidebar.jsp" %>
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>주문관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">홈</a></li>
					<li class="breadcrumb-item active">주문관리</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col">
					<div class="card">
						<div class="card-title">주문관리</div>
						<div class="ms-5" style="display: flex;">
							<button class="btn btn-outline-warning" style="width: 80px;">일별</button>
							<button class="btn btn-outline-warning" style="width: 80px;">주별</button>
							<button class="btn btn-outline-warning" style="width: 80px;">월별</button>
							<button class="btn btn-outline-warning" style="width: 80px;">전체</button>
							<i class="bi bi-calendar ms-5 justify-content-center"></i> 
							<input type="date" class="form-control date mx-2" style="width: 200px;">
							~ 
							<input type="date" class="form-control date me-5 ms-2" style="width: 200px;">
							<button class="btn btn-outline-secondary justify-content-end">조회하기</button>
						</div>
						<!--날짜 선택-->
						<br>
						<br>
						<div class="product">
							<form action="" class="search-form ms-5" style="display: flex">
								<select id="inputState" class="form-select me-2"
									style="width: 130px;">
									<option selected>아이디</option>
									<option>주문번호</option>
									<option>구매자명</option>
								</select> 
								<input type="text" name="query" placeholder="Search" title="Enter search keyword" id="searchbar" style="width: 300px;">
								<button type="submit" title="Search">
									<i class="bi bi-search"></i>
								</button>
							</form>
						</div>
						<!--검색도구-->
						<hr>
						<div class="d-flex justify-content-center">
							<div class="col-4 justify-content-between" id="order"
								style="display: flex;">
								<h1>
									<a href="<%=contextPath%>/list.mor?page=1&order=1&cancel=0&change=0&reform=0">주문 </a>
								</h1>
								<h1>|</h1>
								<h1>
									<a href="<%=contextPath%>/list.mor?page=1&order=0&cancel=1&change=0&reform=0"> 취소 </a>
								</h1>
								<h1>|</h1>
								<h1>
									<a href="<%=contextPath%>/list.mor?page=1&order=0&cancel=0&change=1&reform=0"> 교환 </a>
								</h1>
								<h1>|</h1>
								<h1>
									<a href="<%=contextPath%>/list.mor?page=1&order=0&cancel=0&change=0&reform=1"> 반품</a>
								</h1>
							</div>
						</div>
						<!-- 주문|취소|교환|반품 -->
						<br>
						<div class="mx-3">
							<!-- 교환시 -->
							<!-- 교환처리상태
				              <button class="btn btn-outline-secondary ms-2" style="font-size:smaller;">교환처리중</button>
				              <button class="btn btn-outline-secondary" style="font-size:smaller;">회수처리중</button>
				              <button class="btn btn-outline-secondary" style="font-size:smaller;">재배송중</button>
				              <button class="btn btn-outline-secondary" style="font-size:smaller;">교환완료</button> -->
							<!-- 반품시 -->
							<!-- 반품처리상태
				              <button class="btn btn-outline-secondary ms-2" style="font-size:smaller;">회수중</button>
				              <button class="btn btn-outline-secondary" style="font-size:smaller;">반품완료</button> -->
						</div>
						<!--교환, 반품 버튼-->
						<br>
						<div class="mx-3">
							<!-- Default Table -->
							<table class="table">
								<thead>
									<tr>
										<th>주문일자</th>
										<th>주문번호</th>
										<th>구매자명</th>
										<th>아이디</th>
										<th>전화번호</th>
										<th>주소</th>
										<th>상품코드</th>
										<th>상품명</th>
										<th>수량</th>
										<%if(order || cancel){ %>
										<th>주문처리상태</th>
										<%} %>
										<!-- 교환일때 -->
										<%if(change){ %>
										<th>교환처리상태</th>
										<%} %>
										<!-- 반품일때 -->
										<%if(reform){ %>
										<th>반품처리상태</th>
										<%} %>
										<!-- 교환,반품일때 -->
										<%if(change||reform){ %>
										<th>배송비입금상태</th>
										<%} %>
									</tr>
								</thead>
								<tbody>
								<%for(OrderDetail od : list){ %>
									<tr>
										<td><%=od.getOrderDate() %></td>
										<td><%=od.getOrderNo() %></td>
										<td><%=od.getUserName() %></td>
										<td><%=od.getUserId() %></td>
										<td><%=od.getPhone() %></td>
										<td><%=od.getAddress() %></td>
										<td><%=od.getCode() %></td>
										<td><%=od.getProName() %></td>
										<td><%=od.getCount() %></td>
										<!-- 주문일때 -->
										<%if(order){ %>
										<td>
										  <input type="hidden" name="deliStatus" value="<%=od.getDeliStatus()%>">
					                      <select id="deliStatus" class="form-select me-2" style="width:130px;">
					                        <option value="1" selected>배송준비중</option>
					                        <option value="2">배송중</option>
					                        <option value="3">배송완료</option>
					                      </select>
					                      
						                </td>
						                <%} %>
										<!-- 취소일때 -->
										<%if(cancel){ %>
										<td>취소</td>
										<%} %>
										<!-- 교환일때 -->
										<%if(change){ %>
										<td>
						                      <select id="inputState" class="form-select me-2" style="width:130px;">
						                        <option selected>교환처리중</option>
						                        <option>회수처리중</option>
						                        <option>재배송중</option>
						                        <option>교환완료</option>
						                      </select>
						                </td>
						                <%} %>    
										<!-- 반품일때 -->
										<%if(reform){ %>
										<td>
						                    <select id="inputState" class="form-select me-2" style="width:130px;">
						                        <option selected>반품완료</option>
						                        <option>회수중</option>
						                    </select>
						                </td>
						                <%} %>
										<!-- 배송비 입금 유무 -->
										<%if(change||reform){ %>
										<td>
						                    <select id="inputState" class="form-select me-2" style="width:130px;">
						                        <option selected>입금대기</option>
						                        <option>입금완료</option>
						                    </select>
						                </td>
									</tr>
									<script>
					                      	$(document).ready(function(){
					                      		$("#deliStatus").val(<%=od.getDeliStatus()%>).prop("selected", true);
					                      	});
					                </script>
									<%} %>
								</tbody>
							</table>
							<!-- End Default Table Example -->
						</div>
						<!--주문관리테이블-->
						<div class="d-flex justify-content-center">
							<nav aria-label="Page navigation example">
							  <ul class="pagination">
								<%if(pi.getCurrentPage() == 1){ %>
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1" aria-disabled="true">&lt;</a></li>
								<%} else{ %>
								<li class="page-item"><a class="page-link"
									href="<%=contextPath%>/list.mor?page=<%=pi.getCurrentPage() - 1%>"
									tabindex="-1" aria-disabled="true"> &lt; </a></li>
								<%} %>
								<%for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
								<%if(p == pi.getCurrentPage()){ %>
								<li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
								<%} else{ %>
								<li class="page-item"><a class="page-link"
									href="<%=contextPath%>/list.mor?page=<%=p%>">
										<%=p %>
								</a></li>
								<%} %>
								<%} %>
								<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1" aria-disabled="true">&gt;</a></li>
								<%} else{ %>
								<li class="page-item"><a class="page-link"
									href="<%=contextPath%>/list.mor?page=<%=pi.getCurrentPage() + 1%>">
										&gt; </a></li>
								<%} %>
							  </ul>
							</nav>
							<!-- End Centered Pagination -->
						</div>
						<!--페이징-->
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
	<%@ include file="/views/manager/common/footer.jsp" %>
</body>
</html>