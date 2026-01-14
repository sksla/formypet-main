<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 
<%@ page import="com.formypet.common.model.vo.*" %>
<%@ page import="com.formypet.board.model.vo.*" %>
<%@page import="com.formypet.common.model.vo.PageInfo"%>
<%
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    List<Review> re = (List<Review>)request.getAttribute("re");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>
<style>
/* 리뷰 게시판 CSS */

.main_content{
    /* border: 2px solid #1ABC9C; */
    margin: bottom 50px; 
    min-height: 900px;
    padding: 0px;
    border-radius: 10px;
    
}

hr {
    clear: both; /* 이전 요소들과의 부동 요소 취급을 없애기 위해 clear를 적용합니다. */
    border: none; /* 기본적인 border를 없앱니다. */
    border-top: 1px solid #ddd; /* 원하는 스타일의 border를 추가합니다. */
    margin: 20px 0; /* hr 요소의 위아래 여백을 조절합니다. */
    width: 11%; /* 가로 폭을 100%로 설정하여 부모 요소에 꽉 차게 합니다. */
}

/* 전체 컨테이너 */
.review_content_wrapper {
    width: 80%; /* 테이블의 가로 폭을 조절할 수 있습니다. */
    margin-bottom: 0px;
    margin: 0px auto; /* 가운데 정렬을 위해 좌우 마진을 auto로 설정합니다. */
    overflow-x: auto; /* 가로 스크롤이 필요한 경우를 위해 가로 오버플로우를 설정합니다. */
}

/* 리뷰 섹션 스타일 */
.review_section {
    margin-bottom: 30px;
	

}

/* 리뷰 목록 테이블 스타일 */
.review_table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
    background-color: #FFF2E6;
    
}

.review_table th, .review_table td {
    padding: 8px;
    border: 1px solid #FFEAEA;
    min-width: 100px; /* 각 셀의 최소 너비 설정 */
}

.review_table th {
    background-color: #FAE0D4;
    font-weight: bold;
}

/* 리뷰 제목 클릭 가능하도록 설정 */
.board_title {
    cursor: pointer;
    
}
.board_title:hover {
    color: #D6BCB0; /* 원하는 색상으로 변경하세요 */
}

/* 리뷰 목록과 페이지네이션을 감싸는 div */
.review_content_wrapper {
    width: 80%;
    margin-top: 20px;
}

/* 페이지네이션 스타일 */
.pagination {
    margin-top: 0px;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color pink;
}

.pagination a:hover:not(.active) {
    background-color: #FAE0D4;
    color: black;
}

.pagination .page-item .page-link-c {
	background-color: #FAE0D4;
}
</style>

<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/breadcrumb.css">

</head>
<body>

	<!-- header start -->
	<%@ include file="/views/common/header.jsp" %>
	<!-- header end -->
	
	<!-- 브레드크럼 start -->
	<div class="breadc">
	  <ol>
	    <li><a href="#">Home</a></li>
	    <li class="separator">&gt</li>
	    <li><a href="#">게시판</a></li>
	    <li class="separator">&gt</li>
	    <li>리뷰</li>
	  </ol>
	</div>
	<!-- 브레드크럼 end -->
	
	<!-- 리뷰 게시판 섹션 -->
	<section class="main_content">
	        <div class="review_section">
	            <div class="review_content_wrapper">
			            <hr>
			            <h4>리뷰 게시판</h4>
						<hr>
	                <table class="review_table">
	                    <% if(re == null || re.isEmpty()){ %>
	                        <thead>
	                            <tr>
	                                <td colspan="5" style="text-align: center;">아직 등록된 리뷰가 없습니다.</td>
	                            </tr>
	                        </thead>
	                    <% } else { %>
	                        <thead>
	                            <tr>
	                                <th width="30px">번호</th>
	                                <th width="120px">평점</th>
	                                <th width="700px">제목</th>
	                                <th width="120px">작성자</th>
	                                <th width="120px">작성일</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <% for(Review r : re){ %>
	                                <tr class="board_title" data-toggle="collapse" data-target="#review<%=r.getReNo()%>">
	                                    <td><%=r.getReNo() %></td>
	                                    <%-- 별점에 따라 다르게 표시 --%>
	                                    <td>
	                                        <% if(r.getReStar() == 5){ %>
	                                            ★★★★★
	                                        <% } else if(r.getReStar() == 4){ %>
	                                            ★★★★☆
	                                        <% } else if(r.getReStar() == 3){ %>
	                                            ★★★☆☆
	                                        <% } else if(r.getReStar() == 2){ %>
	                                            ★★☆☆☆
	                                        <% } else if(r.getReStar() == 1){ %>
	                                            ★☆☆☆☆
	                                        <% } %>
	                                    </td>
	                                    <td style="text-align: left;">[<%=r.getProName().substring(0, Math.min(15, r.getProName().length()))%>]&nbsp;<%=r.getReTitle()%></td>
	                                    <td><%=r.getReWriter() %></td>
	                                    <td><%=r.getEnrollDate() %></td>
	                                </tr>
	                                <tr id="review<%=r.getReNo()%>" class="collapse">
	                                <%if(r.getAtList()!=null){ %>
	                                    <td colspan="5" class="border rounded p-3" style="paddig-top:10px; max-width:75%;">
										<%for(int i= 0; i<r.getAtList().size(); i++){ %>
										<img src="<%=contextPath + "/" + r.getAtList().get(i).getFilePath() + r.getAtList().get(i).getChangeName()%>" style="width:200px; height:200px;">
										
										<%} %>
										<p style="min-height: 150px; background-color: #FFFAFA;" class="border rounded w-75 mx-auto p-3"><b>[<%=r.getProName()%>]</b><br><%=r.getReContent() %></p>
	                                    
	                                    <% if(r.getReview() == null) { %>
				                            <p style="min-height: 100px; background-color: #FFFAFA;" class="border rounded w-75 mx-auto p-3">아직 등록된 답변이 없습니다.</p>
				                        <% } else { %>
				                            <p style="min-height: 150px; background-color: #FFFAFA;" class="border rounded w-75 mx-auto p-3"><%=r.getReview() %></p>
				                        <% } %>
	                                    
	                                    </td>
	                                <%} else {%>
	                                	<td colspan="5" class="border rounded p-3" style="paddig-top:10px; max-width:75%;">
											<p style="min-height: 150px; background-color: #FFFAFA;" class="border rounded w-75 mx-auto p-3"><b>[<%=r.getProName()%>]</b><br><%=r.getReContent() %></p>
										
										<% if(r.getReview() == null) { %>
				                            <p style="min-height: 100px; background-color: #FFFAFA;" class="border rounded w-75 mx-auto p-3">아직 등록된 답변이 없습니다.</p>
				                        <% } else { %>
				                            <p style="min-height: 150px; background-color: #FFFAFA;" class="border rounded w-75 mx-auto p-3"><%=r.getReview() %></p>
				                        <% } %>
										
										</td>
									<%} %>
	                                </tr>
	                            <% } %>
	                        </tbody>
	                    <% } %>
	                </table>
	            </div>
	        </div>
	        <!-- 페이지네이션 -->
	        <ul class="pagination pagination justify-content-center">
	                <% if(pi.getCurrentPage() == 1){ %>
	                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a></li>
					<%} else{ %>
	                <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.rv?page=<%=pi.getCurrentPage() - 1%>" tabindex="-1" aria-disabled="true">&lt;</a></li>
	                <% } %>
	                <% for(int pg = pi.getStartPage(); pg <= pi.getEndPage(); pg++){ %>
	                    <% if(pg == pi.getCurrentPage()){ %>
	                       <li class="page-item"><a class="page-link-c" href="#"><%=pg %></a></li>
	                    <% } else { %>
	                       <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.rv?page=<%=pg%>"><%=pg %></a></li>
	                    <% } %>
	                <% } %>
	                <% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
	                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
	                <%} else{ %>
	                 <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.rv?page=<%=pi.getCurrentPage() + 1%>">&gt;</a></li>
	                <% } %>
	           </ul>
	            
					
				
	</section>
	<!-- 리뷰 게시판 섹션 종료 -->
	
	<!-- footer start -->
	<%@ include file="/views/common/footer.jsp" %>
	<!-- footer end -->
	
	</body>
	</html>