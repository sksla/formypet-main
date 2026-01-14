<%@page import="java.util.ArrayList"%>
<%@page import="com.formypet.common.model.vo.PageInfo"%>
<%@page import="com.formypet.product.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	boolean check = (boolean)request.getAttribute("check");
	String category = null;
	String middle = null;
	String search = null;
	if(check){
		category = (String)request.getAttribute("category");
		middle = (String)request.getAttribute("middle");
		search = (String)request.getAttribute("search");
	}
	List<Product> list = (List<Product>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 조회</title>
</head>
<body>
	<%@ include file="/views/manager/common/header.jsp" %>
	
	<%@ include file="/views/manager/common/sidebar.jsp" %>

	<main id="main" class="main">

	    <div class="pagetitle">
	      <h1>상품 조회</h1>
	      <nav>
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">홈</a></li>
	          <li class="breadcrumb-item">상품관리</li>
	          <li class="breadcrumb-item active">상품조회</li>
	        </ol>
	      </nav>
	    </div><!-- End Page Title -->
	
	    <section class="section">
	      <div class="row">
	        <div class="col">
	
	          <div class="card product">
	            <form id="search_form" class="search-form" method="GET" action="<%=contextPath%>/search.mpro">
	            <input type="hidden" name="page" value="1" id="paging">
	            <div class="list-bar mt-5"> <h3 class="m-auto">대분류</h3>
	              <div class="form-check m-auto">
	                <input class="form-check-input" type="checkbox" id="all" name="category" value="A">
	                <label class="form-check-label" for="all">
	                  공통
	                </label>
	              </div>
	              <div class="form-check m-auto">
	                <input class="form-check-input" type="checkbox" id="dog" name="category" value="D">
	                <label class="form-check-label" for="dog">
	                  강아지
	                </label>
	              </div>
	              <div class="form-check m-auto">
	                <input class="form-check-input" type="checkbox" id="cat" name="category" value="C">
	                <label class="form-check-label" for="cat">
	                  고양이
	                </label>
	              </div>
	            </div>
	            
	            <div class="list-bar my-3"> <h3 class="m-auto">중분류</h3>
	              <div class="form-check m-auto">
	                <input class="form-check-input" type="checkbox" id="food" name="middle" value="1">
	                <label class="form-check-label" for="food">
	                  사료 
	                </label>
	              </div>
	              <div class="form-check m-auto">
	                <input class="form-check-input" type="checkbox" id="snack" name="middle" value="2">
	                <label class="form-check-label" for="snack">
	                  간식 &nbsp; &nbsp;
	                </label>
	              </div>
	              <div class="form-check m-auto">
	                <input class="form-check-input" type="checkbox" id="playing" name="middle" value="3">
	                <label class="form-check-label" for="playing">
	                  용품 &nbsp; &nbsp;
	                </label>
	              </div>
	            </div>
	            <div class="d-flex justify-content-center search-bar mb-5">
	              <div class="me-3 mt-1">상품 검색</div>
	              <input type="text" name="search" placeholder="검색" title="Enter search keyword" id="searchbar" style="width:500px;">
	              <button type="submit" title="Search" onclick="return validate();"><i class="bi bi-search"></i></button>
	            </div>
	            <!-- End Search Bar -->
	            <script>
	            function validate(){
            		let count1 = 0;
            		let count2 = 0;
            		$("#paging").val(1);
            		$('input[name="category"]').each(function(){
            			if($(this).prop("checked")){
            				count1++;
            			}
            		})
            		
            		$('input[name="middle"]').each(function(){
            			if($(this).prop("checked")){
            				count2++;
            			}
            		})
            		
            		if(count1 <= 0 || count2 <= 0){
            			alert("하나 이상의 목록을 선택해주세요!!");
            			return false;
            		}
            	}
	            $(function(){
	            	<%if(check){%>
	            		let category = '<%=category%>';
	            		let middle = '<%=middle%>';
	            		let search = '<%=search%>';
	            		console.log(category);
	            		console.log(middle);
		            	$(':checkbox').each(function(index, element){
	            			if(category.indexOf($(element).val()) != -1){
	            				$(this).attr("checked", true);
	            			}
	            		})
	            		$(':checkbox').each(function(index, element){
	            			if(middle.indexOf($(element).val()) != -1){
	            				$(this).attr("checked", true);
	            			}
	            		})
	            		$('#searchbar').val(search);
	            	<%}%>
	            })
	            </script>
	            </form>
	          </div>
	        </div>
	      </div>
	
	    <hr>
	
	    <div class="row">
	      <div class="col">
	
	        <div class="card">
	          <div class="d-flex justify-content-end">
	            <a href="<%=contextPath %>/enrollForm.mpro" class="btn btn-outline-secondary mt-5 me-3">상품 등록하기</a>
	          </div>
	          <br>
	          <div class="card-body">
	            <table class="table" id="product-list">
	              <thead>
	                <tr>
	                  <td></td>
	                  <th>
	                    상품코드
	                  </th>
	                  <th>상품명</th>
	                  <th>가격</th>
	                  <th>할인율</th>
	                  <th>재고</th>
	                  <th colspan="2">상태</th>
	                </tr>
	              </thead>
	              <tbody>
	              <%for(Product p : list){ %>
	              <%
	              	String middCode = "";
	              	if(p.getProMiddNo() == 1){
	              		middCode = "Food";
	              	} else if(p.getProMiddNo() == 2){
	              		middCode = "Snack";
	              	} else{
	              		middCode = "Goods";
	              	}
	              	
	              	String status = "";
	              	if(p.getStatus().equals("Y")){
	              		status="게시";
	              	} else{
	              		status="삭제";
	              	}
	              %>
	                <tr>
	                  <td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#product-delete" 
	                  onclick="deletePro(<%=p.getProNo() %>,'<%=p.getProName()%>')"
	                  <%if(!p.getStatus().equals("Y")){ %>
	                  disabled
	                  <%} %>
	                  >ㅡ</button></td>
	                  <td><%=p.getProCateCode() + "_" + middCode + "_" + p.getProNo() %></td>
	                  <td><%=p.getProName() %></td>
	                  <td><%=p.getPrice() %></td>
	                  <td><%=p.getDiscount() %>%</td>
	                  <td><%=p.getStock() %></td>
	                  <td><%=status %></td>
	                  <td><a href="<%=contextPath %>/updateForm.mpro?no=<%=p.getProNo() %>" class="btn btn-warning">수정</a></td>
	                </tr>
	              <%} %>
	              </tbody>
	            </table>
	            <!-- End Table with stripped rows -->
	            
	            <!-- Centered Pagination -->
	            <nav aria-label="Page navigation example">
	              <ul class="pagination justify-content-center">
	                <%if(pi.getCurrentPage() == 1){ %>
	                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a></li>
                    <%} else{ %>
	                <li class="page-item">
	                	<a class="page-link" 
	                	<%if(!check){ %>
	                	href="<%=contextPath%>/list.mpro?page=<%=pi.getCurrentPage() - 1%>" 
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
		                	href="<%=contextPath%>/list.mpro?page=<%=p%>"
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
                    		href="<%=contextPath%>/list.mpro?page=<%=pi.getCurrentPage() + 1%>"
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
	            
	          </div>
	        </div>
	      </div>
	    </div>
	
	    <!-- The Modal -->
	    <div class="modal" id="product-delete">
	      <div class="modal-dialog">
	        <div class="modal-content">
	
	          <!-- Modal Header -->
	          <div class="modal-header">
	            <h4 class="modal-title">상품 삭제</h4>
	            <button type="button" class="close" data-dismiss="modal">&times;</button>
	          </div>
	          
	          <form action="<%=contextPath %>/delete.mpro" method="post">
	          <!-- Modal Body -->
	          <div class="modal-body">
	            <input type="hidden" id="delete_pro" name="no">
	            <p id="delete_guide"></p>
	          
	          </div>
	
	          <!-- Modal footer -->
	          <div class="modal-footer">
	            <button type="button" class="btn btn-secondary col" data-dismiss="modal">취소</button>
	            <button type="submit" class="btn btn-danger col">삭제</button>
	          </div>
	          </form>
	
	        </div>
	      </div>
	    </div>
	
	    </section>
	    <script>
	    	function searchPage(page){
	        	$("#paging").val(page);
	            $("#search_form").submit();
	    	}
	    	
	        function deletePro(no, name){
	        	$("#delete_pro").val(no);
	           	let coment = name + " 상품을 삭제하시겠습니까?"
	           	$("#delete_guide").html(coment);
	        }
	    </script>
	  </main>
	  <!-- End #main -->
	  
	  <%@ include file="/views/manager/common/footer.jsp" %>
</body>
</html>