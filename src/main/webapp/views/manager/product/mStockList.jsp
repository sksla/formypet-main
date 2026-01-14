<%@page import="com.formypet.common.model.vo.PageInfo"%>
<%@page import="com.formypet.product.model.vo.Stock"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean check = (boolean)request.getAttribute("check");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Stock> list = (List<Stock>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리</title>
</head>
<body>

	<%@ include file="/views/manager/common/header.jsp" %>
	
	<%@ include file="/views/manager/common/sidebar.jsp" %>

	<main id="main" class="main">

	    <div class="pagetitle">
	      <h1>상품재고관리</h1>
	      <nav>
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">홈</a></li>
	          <li class="breadcrumb-item">상품관리</li>
	          <li class="breadcrumb-item active">상품재고관리</li>
	        </ol>
	      </nav>
	    </div><!-- End Page Title -->
	
	    <section class="section">
	      <div class="row">
	        <div class="col">
	          <div class="card">
	            <div class="card-title">상품 재고 관리</div>
	            <div class="product">
	              <form action="<%=contextPath %>/search.msto" id="search_form" class="search-form ms-5">
	                <input type="hidden" id="paging" name="page" value="1">
		            <div class="d-flex">
		            <!-- 현재는 기본 날짜만 기능함 나중에 일별 월별 주별에 따른 결과값 적용해봄
		              <a id="day" class="btn btn-outline-warning" onclick="changeDay();">일별</a>
		              <a id="week" class="btn btn-outline-warning" onclick="changeWeek();">주별</a>
		              <a id="month" class="btn btn-outline-warning" onclick="changeMonth();">월별</a>
		             -->  <i class="bi bi-calendar ms-5 justify-content-center"></i>
		              <input id="date_start" name="dateStart" type="date" class="form-control date mx-2" style="width:200px;"> ~
		              <input id="date_end" name="dateEnd" type="date" class="form-control date me-5 ms-2" style="width:200px;">
		            </div> 
		            <!--날짜 선택-->
	            	<br><br>
		            <div class="d-flex">
		                <select name="main" id="stock_main" class="form-select me-2" style="width:150px;">
		                  <option value="A" selected>공통</option>
		                  <option value="D">강아지</option>
		                  <option value="C">고양이</option>
		                </select>
		                <select name="sub" id="stock_sub" class="form-select me-2" style="width:100px;">
		                  <option value="1" selected>사료</option>
		                  <option value="2">간식</option>
		                  <option value="3">용품</option>
		                </select>
		                <select name="status" id="stock_status" class="form-select me-2" style="width:100px;">
		                  <option value="I" selected>입고</option>
		                  <option value="O">출고</option>
		                </select>
		                <input type="text" name="search" placeholder="검색" title="Enter search keyword" id="searchbar" style="width:300px;">
		                <button type="submit" title="Search"><i class="bi bi-search"></i></button>
		            </div>
	              </form>
	            </div> 
	            <!--검색도구-->
	            <hr>
	            <div class="d-flex justify-content-end">
	            	<button class="btn btn-outline-secondary me-2" data-toggle="modal" data-target="#stock_insert">입/출고 관리</button>
	            </div>
	            <br>
	            <div class="mx-3">
	              <!-- Default Table -->
	              <table class="table">
	                <thead>
	                  <tr>
	                    <th>날짜</th>
	                    <th>대분류</th>
	                    <th>중분류</th>
	                    <th>상품번호</th>
	                    <th>상품명</th>
	                    <th>입/출고</th>
	                    <th>수량</th>
	                    <th>재고</th>
	                  </tr>
	                </thead>
	                <tbody>
	                <%for(Stock s : list){ %>
	                  <tr>
	                    <td><%=s.getEnrollDate() %></td>
	                    <td><%=s.getProMain() %></td>
	                    <td><%=s.getProSub() %></td>
	                    <td><%=s.getProNo() %></td>
	                    <td><%=s.getProName() %></td>
	                    <td><%=s.getStatus() %></td>
	                    <td><%=s.getCount() %></td>
	                    <td><%=s.getStock() < 0 ? 0 : s.getStock() %></td>
	                  </tr>
	                <%} %>
	                </tbody>
	              </table>
	              <!-- End Default Table Example -->
	            </div> <!--입출고테이블-->
	            <div>
	              <!-- Centered Pagination -->
		            <nav aria-label="Page navigation example">
		              <ul class="pagination justify-content-center">
		                <%if(pi.getCurrentPage() == 1){ %>
		                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a></li>
	                    <%} else{ %>
		                <li class="page-item">
		                	<a class="page-link" 
		                	<%if(!check){ %>
		                	href="<%=contextPath%>/list.msto?page=<%=pi.getCurrentPage() - 1%>" 
		                	<%} else { %>
		                	href="#" 
		                	onclick="return searchPage(<%=pi.getCurrentPage() - 1%>);"
		                	<%} %>
		                	tabindex="-1" aria-disabled="true">
		                	&lt;
		                	</a>
		                </li>
		                <%} %>
		                <%for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
			                <%if(p == pi.getCurrentPage()){ %>
			                	<li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
			                <%} else{ %>
			                	<li class="page-item">
			                	<a class="page-link" 
			                	<%if(!check){ %>
			                	href="<%=contextPath%>/list.msto?page=<%=p%>"
			                	<%} else { %>
			                	href="#" 
			                	onclick="return searchPage(<%=p%>); <%}%>">
			                	<%=p %>
			                	</a>
			            		</li>
		                    	<%} %>
	                    <%} %>
	                    <%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
	                    	<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&gt;</a></li>
	                    <%} else{ %>
	                    	<li class="page-item">
	                    		<a class="page-link" 
	                    		<%if(!check){ %>
	                    		href="<%=contextPath%>/list.msto?page=<%=pi.getCurrentPage() + 1%>"
	                    		<%} else { %>
	                    		href="#" 
	                    		onclick="return searchPage(<%=pi.getCurrentPage() + 1%>);" <%} %>>
	                    		&gt;
	                    		</a>
	                    	</li>
	                 	<%} %>
		              </ul>
		            </nav>
		            <!-- End Centered Pagination -->
		            <script>
		           		function searchPage(page){
		            		$("#paging").val(page);
		            		$("#search_form").submit();
		            	}
		            	$(function(){
		            		$("#date_start").val(new Date().toISOString().substring(0, 10));
		            		$("#date_end").val(new Date().toISOString().substring(0, 10));
		            	})
		            	function changeDay(){
		            		$("#date_start").prop("type", "date");
		            		$("#date_end").prop("type", "date");
		            		$("#date_start").val(new Date().toISOString().substring(0, 10));
		            		$("#date_end").val(new Date().toISOString().substring(0, 10));
		            	}
		            	function changeWeek(){
		            		$("#date_start").prop("type", "week");
		            		$("#date_end").prop("type", "week");
		            	}
		            	function changeMonth(){
		            		$("#date_start").prop("type", "month");
		            		$("#date_end").prop("type", "month");
		            		$("#date_start").val(new Date().toISOString().substring(0, 7));
		            		$("#date_end").val(new Date().toISOString().substring(0, 7));
		            	}
		            </script>
	            </div> <!--페이징-->
	            </div>
	        </div>
	      </div>
	    </section>
	    
	  </main>
	  <!-- End #main -->
	  
	  <!-- 입고 모달 -->
	    <div class="modal" id="stock_insert">
	      <div class="modal-dialog">
	        <div class="modal-content">
	
	          <!-- Modal Header -->
	          <div class="modal-header">
	            <h4 class="modal-title m-auto">상품 입/출고</h4>
	          </div>
	
	          <form action="<%=contextPath%>/insert.msto" method="get">
	          <!-- Modal body -->
	          <div class="modal-body">
	          	<table class="table-borderless m-auto">
	          		<tr>
	          			<td colspan="2">
	          				<select name="status" class="form-select" style="width:150px;">
				                <option value="I" selected>입고</option>
				                <option value="O">출고</option>
		                </select>
	          			</td>
	          		</tr>
	          		<tr>
	          			<th>입/출고일</th>
	          			<td class="d-flex">
		              		<input name="date" type="date" class="form-control date ms-2" required>
	          			</td>
	          		</tr>
	          		<tr>
	          			<th>상품번호</th>
	          			<td>
	          				<input name="no" type="number" class="form-control mx-2" required>
	          			</td>
	          		</tr>
	          		<tr>
	          			<th>상품명</th>
	          			<td>
	          				<input name="name" type="text" class="form-control mx-2" required>
	          			</td>
	          		</tr>
	          		<tr>
	          			<th>입/출고 수량</th>
	          			<td>
	          				<input name="count" type="number" class="form-control mx-2" required>
	          			</td>
	          		</tr>
	          			          		
	          	</table>
	          </div>
	          <!-- Modal footer -->
	          <div class="modal-footer">
	            <button type="button" class="btn btn-secondary m-auto col" data-dismiss="modal">취소</button>
	            <button type="submit" class="btn btn-primary m-auto col">등록</button>
	          </div>
	          </form>
	
	        </div>
	      </div>
	    </div>
	    <!-- 입고 모달 끝 -->
	  
	  <%@ include file="/views/manager/common/footer.jsp" %>
</body>
</html>