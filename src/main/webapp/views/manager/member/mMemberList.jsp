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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
</head>
<body>
	<%@ include file="/views/manager/common/header.jsp" %>
	
	<%@ include file="/views/manager/common/sidebar.jsp" %>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>회원조회</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">홈</a></li>
					<li class="breadcrumb-item">회원관리</li>
					<li class="breadcrumb-item active">회원조회</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col">
					<div class="card">
						<div class="card-title">회원조회</div>
						<%-- <div class="ms-5" style="display: flex;">
							<button class="btn btn-outline-warning" style="width: 80px;">일별</button>
							<button class="btn btn-outline-warning" style="width: 80px;">주별</button>
							<button class="btn btn-outline-warning" style="width: 80px;">월별</button>
							<button class="btn btn-outline-warning" style="width: 80px;">전체</button>
							<i class="bi bi-calendar ms-5 justify-content-center"></i> 
							<input type="date" name="start" class="form-control date mx-2" style="width: 200px;">
							~ <input type="date" name="end" class="form-control date me-5 ms-2" style="width: 200px;">
							<a onclick="searchDate();" class="btn btn-outline-secondary justify-content-end">조회하기</a>
							<script>
								function searchDate(){
									location.href = "<%=contextPath%>/list.mm?page=1&start=" + $('#start').val() + "&end=" + $('#end').val();
								}
							</script>
						</div> --%>
						<!--날짜 선택-->
						<br>
						<br>
						<div class="product">
							<form action="<%=contextPath %>/search.mm" id="search_form" method="get" class="search-form ms-5" style="display: flex">
								<input type="hidden" name="page" id="paging" value="1">
								<input type="hidden" name="update" value="0">
								<select id="member-menu" name="main" class="form-select me-2" style="width: 130px;">
									<option value="no" selected>회원번호</option>
									<option value="id">아이디</option>
									<option value="name">이름</option>
									<option value="email">이메일</option>
									<option value="phone">휴대폰번호</option>
									<option value="birth">생년월일</option>
								</select> 
								<input type="text" name="search" placeholder="Search" title="Enter search keyword" id="searchbar" style="width: 300px;" <%if(check){%>value="<%=search %>"<%} %>>
								<button type="submit" title="Search"><i class="bi bi-search"></i></button>
							</form>
						</div>
						<!--검색도구-->
						<hr>
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
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
								<% for(Member m : list){ %>
								<% 
									String status = "";
									if(m.getStatus().equals("Y")){
										status="회원";
									} else if(m.getStatus().equals("A")){
										status="관리자";
									} else{
										status="탈퇴한 회원";
									}
								%>
									<tr>
										<td><%=m.getUserNo() %></td>
										<td><%=m.getUserId() %></td>
										<td><%=m.getUserName() %></td>
										<td><%=m.getEmail() %></td>
										<td><%=m.getPhone() %></td>
										<td><%=m.getUserBirth() %></td>
										<td>
											<input type="checkbox"
											<% if(m.getStatusEmail() == 1){ %>
											checked
											<%} %>
											>
										</td>
										<td>
											<input type="checkbox"
											<% if(m.getStatusSns() == 1){ %>
											checked
											<%} %>
											>
										</td>
										<td><%=status %></td>
									</tr>
								<%} %>
								</tbody>
							</table>
							<!-- End Default Table Example -->
						</div>
						<!-- 회원조회 -->
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
							<!-- End Centered Pagination -->
							<script>
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
						</div>
						<!--페이징-->
					</div>
				</div>
			</div>
		</section>
	</main><!-- End #main -->
	<%@ include file="/views/manager/common/footer.jsp" %>
</body>
</html>