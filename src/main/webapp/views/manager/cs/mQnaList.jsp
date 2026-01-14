<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>    
<%@ page import="com.formypet.cs.model.vo.Qna" %>
<% List<Qna> list = (List<Qna>)request.getAttribute("list"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 1:1 문의 관리 스타일 -->
    <style>
        .btn-warning{
            background: rgb(255, 224, 96);
        }

        .question_title{
            text-overflow: ellipsis; 
            overflow:hidden; 
            white-space:nowrap;
            max-width: 140px;
        }

        
    </style>
</head>
<body>
	<%@ include file="/views/manager/common/header.jsp" %>
	
	<%@ include file="/views/manager/common/sidebar.jsp" %>
	
	<main id="main" class="main">

        <div class="pagetitle">
            <h1>1:1 문의</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">Home</a></li>
                    <li class="breadcrumb-item">고객센터 관리</li>
                    <li class="breadcrumb-item active">1:1 문의</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">1:1 문의</h5>
                            <hr>
                            <br>

							<form action="<%=contextPath %>/delete.mqa" method="get">
	                            <!-- 1:1 문의 내역 Table with stripped rows -->
	                            <table class="table datatable table-bordered table-hover" id="question_list">
	                                <thead>
	                                    <tr>
	                                        <th width="60px">선택</th>
	                                        <th width="80px">글번호</th>
	                                        <th width="100px">문의유형</th>
	                                        <th width="100px">답변상태</th>
	                                        <th width="500px">제목</th>
	                                        <th width="150px">작성자</th>
	                                        <th width="150px">작성일</th>
	                                        <th width="100px">답변</th>
	                                    </tr>
	
	
	                                </thead>
	                                <tbody>
	
	                                    <% if(list.isEmpty()) { %>
	                                    <tr>
	                                        <td colspan="6" style="text-align: center;"> 조회된 글이 없습니다.</td>
	                                    </tr> 
										<% } else { %>
		                                    <!-- 조회된 글 있음 -->
		
											<% for(Qna q : list) { %>
		                                    <!-- 답변 등록 전 -->
		                                    <tr>
		                                        <td>
		                                            <input name="no" value="<%=q.getQnaNo() %>" type="checkbox">
		                                        </td>
		                                        <td><%=q.getQnaNo() %></td>
		                                        <td><%=q.getCategory() %></td>
		                                        <td style='color:<%=q.getStatus().equals("Y") ? "blue" : "red" %>;'><%=q.getStatus().equals("Y") ? "답변완료" : "대기중" %></td>
		                                        <td class="question_title"><%=q.getQnaTitle() %></td>
		                                        <td><%=q.getQnaWriter() %></td>
		                                        <td><%=q.getEnrollDate() %></td>
		                                        
		                                        <td>
		                                        	<% if(q.getStatus().equals("N")) {%>
		                                        	<a href="<%=contextPath %>/enrollForm.mqa?no=<%=q.getQnaNo() %>" class=" btn btn-warning btn-sm">답변등록</a>
		                                        	<% } else { %>
		                                        	<a href="<%=contextPath %>/detail.mqa?no=<%=q.getQnaNo() %>" class=" btn btn-secondary btn-sm">답변조회</a>
		                                        	<% } %>
		                                        </td>
		                                       
		                                        
		                                        <% } %>
		                                    </tr>
											<% } %>
		                                    
	                                </tbody>
	
	                            </table>
	
	                            
	                            <!-- End Table with stripped rows -->
	                            <div style="text-align: center;">
	                                <button type="submit" class="btn btn-outline-danger btn-sm" onclick="return validate();">선택삭제</button> 
	                            </div>
							</form>
							
							
							
                            <script>
                            
	                            /*
	                    		작성자 : 김영주
	                    		하나 이상의 체크박스가 선택되었는지 유효성 검사하는 함수
	                    		하나도 선택하지 않았을 경우 false 반환
	                    		*/
		                    	function validate(){
		                    		
		                    		let count = 0;
		                    		$('input[type="checkbox"]').each(function(){
		                    			
		                    			if($(this).prop("checked")){
		                    				count++;
		                    			}
		                    		})
		                    		
		                    		if(count == 0){
		                    			
		                    			alert("하나 이상의 글을 선택해주세요!!");
		                    			return false;
		                    			
		                    		}else{
		                    			if(!confirm("삭제된 글들은 복구가 어렵습니다.\n정말 삭제하시겠습니까?")){
		                    				return false;
		                    			};
		                    		}
		                    	}
                            </script>

                        </div>
                    </div>

                </div>
            </div>
        </section>

    </main><!-- End #main -->
	
	<%@ include file="/views/manager/common/footer.jsp" %>
</body>
</html>