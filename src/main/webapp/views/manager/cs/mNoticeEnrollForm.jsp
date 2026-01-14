<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 공지사항 등록 스타일 -->
<style>

    #notice_enroll_form{
        box-sizing: border-box;
        width:80%;
        margin:auto;
        
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
            <h1>공지사항</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">Home</a></li>
                    <li class="breadcrumb-item">고객센터 관리</li>
                    <li class="breadcrumb-item"><a href="<%=contextPath %>/list.mno">공지사항 관리</a></li>
                    <li class="breadcrumb-item active">공지사항 등록</li>

                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">공지사항 등록</h5>
                            <hr>
                            <br>

                            <form action="<%=contextPath %>/insert.mno" method="post">
                            	
                                <table class="table" id="notice_enroll_form">
                                    <tr>
                                        <th>제목</th>
                                        <td><input type="text" class="form-control" name="title" required></td>
                                    </tr>
                                    <tr>
                                        <th>내용</th>
                                        <td><textarea cols="30" rows="10" class="form-control" style="resize: none;" required name="content"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="history.back();">목록으로</button>
                                            <button type="reset" class="btn btn-outline-danger btn-sm">초기화</button>
                                            <button type="submit" class="btn btn-warning btn-sm enroll_btn">등록하기</button>
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