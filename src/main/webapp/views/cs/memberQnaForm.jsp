<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>    
<%@ page import="com.formypet.cs.model.vo.QnaCategory" %>
<%
	List<QnaCategory> list = (List<QnaCategory>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포마이펫 고객센터</title>
<style>
/*--------------------- 공지사항 관련 스타일 -----------------------*/
.section_notice{
    padding-top: 50px;
    min-height: 900px;
}
.notice{
    display: flex;
    box-sizing: border-box;
}
.notice_side{
    width: 20%;
    padding: 20px;
    height: 500px;
}
.notice_h1{
    background: #ffdd1f;
    padding: 20px;
    text-align: center;
    border:2px solid #f5d313;
    border-bottom: 0;
    font-weight: bolder;
}
.notice_hidden{
    width: 3%;
}
.notice_list{
    width:60%;
    /* height: 100%; */
}
.notice_side_list{
    background-color: rgb(248, 250, 252);
    border: 2px solid rgb(238, 236, 236);
    border-top: 0;
    padding: 30px;
}
.notice_side li{
    padding-top: 8px;
    /* font-size: 20px; */
}
.list2{ 
    display: flex;
    border: 2px solid rgb(238, 236, 236);
    border-bottom: 0;
    height: 90px;
}
/* .list2 img{padding: 3px;} */
.list2 h4{padding-left: 20px;}
.list3{
    text-align: center;
    margin-top: -40px;
    height: 170px;
}
.list3 h3{color:#fcd916;}
.list3 pre{
    text-align: left;
    padding: 10px;
}
.notice_list_menu{
    padding: 60px;
    border: 3px solid lightgray;
}
.list_faq tr{
    border-bottom: 2px solid darkgray;
    border-top: 2px solid darkgray;
}
.list_faq img{
    width: 30px;
    height: 30px;
}
.table_title{
    padding-left: 10px;
    width: 100%;
}
.notice_list_q{ display: flex; justify-content: space-between;}
.notice_list_a{
    padding: 20px;
    text-align: center;
    background-color: #fcd21681;
}
.side_menu_notice{
    color:#ffa51f;
}

.board_title{
    cursor: pointer;
}

section a {
    text-decoration: none;
    color: black;
}

/* ------------------------ 페이징 바 ----------------------------- */
.page-link{
    color: darkgray;
}
.page-link::marker{
    background-color: #ffa51f;
}
.pagination .page-item.active .page-link {
    background-color: #ffd000; /* 선택된 페이지의 배경색을 나타내는 원하는 색상 코드를 지정하세요 */
    color: #fff; /* 선택된 페이지의 텍스트 색상 설정 */
    border-color: #f7cb07;
}
</style>
</head>
<body>

	<!-- 브레드크럼 css -->
  	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/breadcrumb.css">



	<div class="wrap">
	
	<!-- header start -->
	<%@ include file="/views/common/header.jsp" %>
	<!-- header end -->

    <!-- 브레드크럼 start -->
    <div class="breadc">
      <ol>
        <li><a href="<%= contextPath %>">Home</a></li> <!--홈화면으로 갈수있게-->
        <li class="separator">&gt</li>
        <li><a href="<%=contextPath%>/home.cs">고객센터</a></li>
      </ol>
    </div>
    <!-- 브레드크럼 end -->
    
       <!--section start-->  
    <section class="section_notice"> 
    <div class="notice" >
        <!-- 사이드 -->
        <div class="notice_side" >
            <div class="notice_h1"><h1>고객센터</h1></div>
            <div class="notice_side_list">
                <h3><a href="<%= contextPath %>/faq.fo">FAQ</a></h3>
                <br>
                <h3>1:1 문의</h3>
                <ul>
                <% if(loginUser != null) { %>
                    <li><a href="<%= contextPath %>/insertForm.qo">1:1 문의하기</a></li>
                    <li><a href="<%= contextPath %>/list.qo">1:1 문의내역</a></li>
				<% } else{ %>
					<li>1:1 문의하기는 로그인 후 이용 가능합니다.</li>
				<% } %>   
				
                </ul>
                <br>
                <h3><a href="<%= contextPath %>/notice.no">공지사항</a></h3>
            </div>
            <br>
            
            <div class="notice_side_list list2" >
            <img src="<%= request.getContextPath() %>/resources/images/call_cs.png" style="width: 30px; height: 30px"> 
            <h4>고객센터 ></h4>
            </div>
            <div class="notice_side_list list3">
                <h3>02-1234-5678</h3>
                <pre>평일 10:00 ~ 18:00 <br>점심시간 12:30 ~ 14:00 <br>주말/공휴일 휴무
                </pre>
            </div>
        </div>
        
        
        <div class="notice_hidden"></div>
        <!-- 공지사항 목록 -->
        <div class="notice_list">
            <div class="notice_list_menu">
                
                <h3>1:1 문의하기</h3>
                <br>
                * 고객센터 운영시간(10:00~18:00) 이외 문의는 고객센터 운영시간 내에 순차적으로 답변드립니다.
                <br>
                <br>   


                <form action="<%= contextPath %>/insert.qo" method="post" enctype="multipart/form-data">
                        <table class="table">
                            <tr>
                                <th width="100px">문의유형</th>
                                <td>
                                    <select name="category" id="category" class="form-control">
								    	<% for(QnaCategory c : list) { %>
                                        <option value="<%=c.getCategoryNo()%>"><%=c.getCategoryName()%></option>
								    	<% } %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>제목</th>
                                <td><input type="text" name="qnaTitle" class="form-control" required placeholder="제목을 입력해주세요"></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td><textarea name="qnaContent" cols="30" rows="10" class="form-control" style="resize: none;" required placeholder="내용을 입력해주세요"></textarea></td>
                            </tr>	
                            <tr>
                                <th>첨부파일</th>
                                <td>
                                    <input type="file" name="upfile" class="form-control-file border"><br>
                                    <p style="color:gray;">* 파일은 10mb이하의 jpg,png,gif 파일로 첨부 가능합니다. </p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <button type="button" class="btn btn-outline-secondary btn-sm" onclick="history.back();">뒤로가기</button>
                                    <button type="reset" class="btn btn-outline-danger btn-sm">초기화</button>
                                    <button type="submit" class="btn btn-outline-primary btn-sm">등록하기</button>
                                </td>
                            </tr>
                    </table>

                </form>

            </div>
           
        </div>
         
    </div>
    <br><br><br><br>
    </section> 
     
    <!--section end-->
    
    <!-- footer start -->
   	<%@ include file="/views/common/footer.jsp" %>
   	<!-- footer end -->

	</div>
	
</body>
</html>