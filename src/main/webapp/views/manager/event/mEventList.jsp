<%@page import="com.formypet.common.model.vo.PageInfo"%>
<%@page import="com.formypet.event.model.vo.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	List<Event> list = (List<Event>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
</head>
<body>
	<%@ include file="/views/manager/common/header.jsp" %>
	
	<%@ include file="/views/manager/common/sidebar.jsp" %>
	
	<main id="main" class="main">

	    <div class="pagetitle">
	      <h1>이벤트 페이지</h1>
	      <nav>
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">홈</a></li>
	          <li class="breadcrumb-item active">이벤트</li>
	        </ol>
	      </nav>
	    </div><!-- End Page Title -->
	
	    <section class="section">
	      <div class="row">
	        <div class="col-lg d-flex justify-content-between flex-wrap event-card">
	        <%for(Event e : list){ %>
	          <!-- Card with an image overlay -->
	          <div class="card col-3 rounded card mx-3">
	            <img src="<%=contextPath %>/<%=e.getEventMainImgPath() %>" class="card-img-top card m-auto" alt="...">
	            <div class="card-img-overlay">
	              <h5 class="card-title"><%=e.getEventTitle() %></h5>
	            </div>
	          </div>
	          <!-- End Card with an image overlay -->
	        <%} %>
	        </div>
	      </div>
	      
	      <div class="d-flex justify-content-center">
	        <ul class="pagination">
	          <%if(pi.getCurrentPage() == 1){ %>
	                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a></li>
                    <%} else{ %>
	                <li class="page-item">
	                	<a class="page-link" 
	                	href="<%=contextPath%>/list.mev?page=<%=pi.getCurrentPage() - 1%>" 
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
		                	href="<%=contextPath%>/list.mev?page=<%=p%>"
		                	>
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
                    		href="<%=contextPath%>/list.mev?page=<%=pi.getCurrentPage() + 1%>"
                    		>
                    		&gt;
                    		</a>
                    	</li>
                 	<%} %>
            </ul>
	      </div>
	      <div class="d-flex justify-content-end">
	        <div>
	          
	          <a href="<%=contextPath %>/enrollForm.mev?page=1" class="btn btn-secondary">등록하기</a>
	
	        </div>
	      </div>
	    </section>
	
	  </main><!-- End #main -->
	
	<%@ include file="/views/manager/common/footer.jsp" %>
</body>
</html>