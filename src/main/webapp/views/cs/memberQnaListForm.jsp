<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.formypet.common.model.vo.PageInfo" %>
<%@ page import = "com.formypet.cs.model.vo.Qna" %>
<%@ page import = "java.util.List" %>
<%
	List<Qna> list = (List<Qna>)request.getAttribute("list");
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

section a {
    text-decoration: none;
    color: black;
}

/*-------------------------- FAQ 상세 스타일 ------------------------- */
.title2{
    height: 40px;
    
/* 나의 1:1 문의내역 스타일  */
            
.table>tbody>tr>:hover{
    cursor: pointer;
    background-color: rgba(233, 229, 229, 0.856);
}

.qna_title{
    text-overflow: ellipsis; 
    overflow:hidden; 
    white-space:nowrap;
    max-width: 140px;
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
    
    <!-- section start -->
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
            <img src="<%= request.getContextPath() %>/resources/images/call_cs.png" alt="" style="width: 30px; height: 30px"> 
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
                    
        <h3>1:1 문의 리스트</h3>           
        <br>
        <hr>
        <table class="table">
        	<thead>
            	<tr>
              		<th style="text-align: center;" width="60px" >번호</th>
                    <th style="text-align: center;" width="200px">문의유형</th>
                    <th style="text-align: center;" width="400px">글제목</th>
                    <th style="text-align: center;" width="140px">작성자</th>
                    <th style="text-align: center;" width="130px">작성일</th>
                    <th style="text-align: center;" width="110px">처리상태</th>
                </tr>
            </thead>
            <tbody>
            
            <% if(list.isEmpty()){ %>
            <!-- case1. 조회된 게시글이 없을 경우 -->
            
            <tr>
            	<td colspan="5" style="text-align: center;">등록하신 1:1 문의글이 없습니다.</td>
            </tr>
            <% }else { %>
    
    		
            <!-- case2. 조회된 게시글이 있을 경우 -->
            	<% for(Qna q : list){ %>
	            <tr>
	            	<td style="text-align: center;"><%= q.getQnaNo() %></td>
	            	<td style="text-align: center;"><%= q.getCategory() %></td>
	            	<td class="qna_title" id="qna_title" style="text-align: center;"><%= q.getQnaTitle() %></td>
	                <td style="text-align: center;"><%= q.getQnaWriter() %></td>
	                <td style="text-align: center;"><%= q.getEnrollDate() %></td>
	                <td style="text-align: center; color: <%= "Y".equals(q.getStatus()) ? "green" : "red" %>;"><%= "Y".equals(q.getStatus()) ? "답변완료" : "답변대기" %></td>
	            </tr>
            	<% } %>
            <% } %>
              
            </tbody>
                        
         </table>
         
         
		<script>
		    $(function(){
		        $(".table>tbody>tr>.qna_title").click(function(){
		            var qnaNo = $(this).siblings().eq(0).text();
		            location.href = "<%= contextPath %>/detail.qo?no=" + qnaNo;    
		        })
		    })
		</script>
         
         
         <div align="right">
         <br><br>
         <button class="btn btn-secondary" onclick="window.location.href='<%= contextPath %>/insertForm.qo'">1:1 문의하기</button>
         </div>
         <hr class="hr3">
         <!-- 1:1 문의 내역 end-->



         </div>
	  </div>
	</section>
    <!-- section end -->

    
    <!-- footer start -->
   	<%@ include file="/views/common/footer.jsp" %>
   	<!-- footer end -->
   	
   	</div>

</body>
</html>