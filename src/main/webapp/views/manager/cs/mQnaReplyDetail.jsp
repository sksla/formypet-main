<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.formypet.cs.model.vo.Qna" %>
<%@ page import="com.formypet.common.model.vo.Attachment" %>s
<%
	Qna q = (Qna)request.getAttribute("q");
	//글번호,작성자아이디,카테고리명,제목,내용, 작성일, 글상태,답변자아이디,답변내용,답변일ㄴ 
	
	Attachment at = (Attachment)request.getAttribute("at"); 
	// 파일번호,원본명,수정명,파일경로 조회
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 1:1문의 답변 조회 스타일 -->
    <style>

        #qna_detail_form{
            box-sizing: border-box;
            width:80%;
            margin:auto;
        }

        #insert_form th{
            background: lightgray;
        }

        .enroll_btn:hover{
            opacity: 0.9;
        }

        .enroll_btn{
            background-color: rgb(255, 224, 96);
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
                    <li class="breadcrumb-item"><a href="<%=contextPath%>/list.mqa">1:1문의 관리</a></li>
                    <li class="breadcrumb-item active">1:1문의 답변 조회</li>

                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">1:1문의 답변 조회</h5>
                            <hr>
                            <br>

                            <form action="" method="post" id="insert_form">
                                <table class="table" id="qna_detail_form">
                                    <tr>
                                        <th width="200px">문의 유형</th>
                                        <td><%=q.getCategory() %></td>
                                    </tr>
                                    <tr>
                                        <th>제목</th>
                                        <td><%=q.getQnaTitle() %></td>
                                    </tr>
                                    <tr>
                                        <th>작성자</th>
                                        <td><%=q.getQnaWriter() %></td>
                                    </tr>
                                    <tr>
                                        <th>작성일</th>
                                        <td><%=q.getEnrollDate() %></td>
                                    </tr>
                                    <tr>
                                        <th>첨부파일</th>
                                        <td>
                                        	<% if(at == null) {%>
                                            <!-- case1 해당 게시글의 첨부파일이 없을 경우 -->
                                            현재 첨부파일이 없습니다.
											<% } else { %>
                                            <!-- case2 해당 게시글에 첨부파일이 있을 경우 -->
                                            <a download="<%= at.getOriginName() %>" href='<%= contextPath + "/" + at.getFilePath() + at.getChangeName() %>' style="color:black"><%= at.getOriginName() %></a>
                                            <%} %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>내용</th>
                                        <td>
                                            <p style="min-height:200px; white-space: pre;"><%=q.getQnaContent() %></p>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<th>답변일</th>
                                    	<td><%=q.getAnswerDate() %></td>
                                    </tr>
                                    <tr>
                                        <th>답변</th>
                                        <td><p style="min-height:200px; white-space: pre;"><%=q.getAnswerContent() %></td>
                                    </tr>
                                    <tr>

                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="history.back();">목록으로</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                    

                            
                        </div>
                    </div>

                </div>
            </div>
        </section>

    </main><!-- End #main -->




	<%@ include file="/views/manager/common/footer.jsp" %>

</body>
</html>