<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>    
<%@ page import="com.formypet.cs.model.vo.Notice" %>    
<%
	List<Notice> list = (List<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 공지사항 스타일 -->
<style>
    .enroll{
        background-color: rgb(255, 224, 96);
    }
    .enroll:hover{
        opacity: 0.9;
    }

    .datatable>tbody .notice_title{
        cursor: pointer;
    }
    
    .notice_title{
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
            <h1>공지사항</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">Home</a></li>
                    <li class="breadcrumb-item">고객센터 관리</li>
                    <li class="breadcrumb-item active">공지사항</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">공지사항</h5>
                            <hr>
                            <br>
							
							
                            <div style="text-align: right;">
                                <a href="<%=contextPath %>/enrollForm.mno" class="btn btn-warning enroll">새글 작성</a>
                            </div>

                            <!-- 공지사항 목록  Table with stripped rows -->
                            <form action="<%=contextPath %>/delete.mno" method="get">
	                            <table class="table datatable table-bordered table-hover" id="notice_list">
	                                <thead>
	                                    <tr>
	                                        <th width="100px">선택</th>
	                                        <th width="100px">글번호</th>
	                                        <th width="500px">제목</th>
	                                        <th width="150px">작성자</th>
	                                        <th width="150px">작성일</th>
	                                        <th width="100px">글상태</th>
	                                    </tr>
	
	
	                                </thead>
	                                <tbody>
	                                
										<% if(list.isEmpty()){ %>
	                                    <!-- 조회된 글 없음 -->
	                                    <tr>
	                                        <td colspan="6" style="text-align: center;"> 조회된 글이 없습니다.</td>
	                                    </tr>
										<% } else { %>
		                                    <!-- 조회된 글 있음 -->
											<% for(Notice n : list) {%>
		                                    <tr>
		                                        <td>
		                                            <input name="no" value="<%=n.getNoticeNo()%>" type="checkbox">
		                                        </td>
		                                        <td><%=n.getNoticeNo() %></td>
		                                        <td class="notice_title"><a href="<%=contextPath%>/detail.mno?no=<%=n.getNoticeNo()%>"><%= n.getNoticeTitle() %></a></td>
		                                        <td><%= n.getNoticeWriter() %></td>
		                                        <td><%= n.getEnrollDate() %></td>
		                                        <td class="status" style='color:<%=n.getStatus().equals("Y") ? "blue" : "red" %>;'><%= n.getStatus().equals("Y") ? "보임" : "숨김" %></td>
		                                    </tr>
		                                    <% } %>
										<% } %>
	                                    
	                                    
	                                </tbody>
	
	                            </table>

                            
	                            <!-- End Table with stripped rows -->
	                            <% if(!list.isEmpty()){ %>
	                            <div style="text-align: center;">
	                                <button type="button" class="btn btn-outline-primary btn-sm" onclick="changeStatus('Y')">글 보이기</button>
	                                <button type="button" class="btn btn-outline-warning btn-sm" onclick="changeStatus('N')">글 숨기기</button>
	                                <button type="submit" class="btn btn-outline-danger btn-sm" onclick="return validate();">선택삭제</button> 
	                            </div>
	                            <% } %>
                            </form>
							 
                            <script>
                            	/*
                            		작성자: 김영주
                            		글보이기/글 숨기기 버튼 클릭시 실행되는 함수
                            		체크박스 0개 선택시 => 글상태 변경 요청 x, 하나 이샇의 글 선택하라는 alert
                            		체크박스 1개 이상 선택 => 글상태 변경 요청
                            		
                            	*/
                                function changeStatus(a){
                                	
	                                let count = 0;
                                	let values = "";
                                	$('input[type="checkbox"]').each(function(){
                                        if ($(this).prop('checked')) {
                                           count++;
                                           values += "no=" + $(this).parent().next().text() + "&";
                                            
                                        }
	                                });
	
	                                if(count > 0){
	                                    // 하나 이상의 체크박스가 선택되었을 경우 => 글 상태 변경 요청
	                                    
	                                	if(confirm("글 상태를 변경하시겠습니까?")){
	                                		
	                                    	location.href = "<%=contextPath%>/changeStatus.mno?" + values + "status=" + a;
	                                		
	                                	}
										
	                                }else{
	                                    // 그렇지 않을 경우 => 알람창
	                                    alert("하나 이상의 글을 선택해주세요!!");
	                                }
                                }
                            	
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
                            			if(!confirm("삭제된 글들은 다시 복구할 수 없습니다.\n정말 삭제하시겠습니까?")){
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