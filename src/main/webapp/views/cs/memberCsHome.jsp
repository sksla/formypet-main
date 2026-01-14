<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.formypet.cs.model.vo.*" %>
<%
	List<Faq> faqList = (List<Faq>)request.getAttribute("faqList");
	List<Notice> noticeList = (List<Notice>)request.getAttribute("noticeList");
	List<Qna> qnaList = (List<Qna>)request.getAttribute("qnaList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포마이펫 고객센터</title>
<style>

.table .table_title:hover{
    cursor:pointer;
    background:rgb(240, 239, 239);
}

section a {
    text-decoration: none;
    color: black;
}

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

/*-------------------------- FAQ 상세 스타일 ------------------------- */
.title2{
    height: 40px;
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
        <!-- 고객센터 목록 -->
        <div class="notice_list">
        <!-- ---------------------------- FAQ ------------------------------- -->
            <div class="notice_list_menu">
                <h4><a href="<%= contextPath %>/faq.fo">FAQ ></a></h4><br>
                <h5>자주 묻는 질문 TOP 5</h5>
                <br>
                <table class="table">
                <% if(faqList.isEmpty()){ %>
               	  <tr>
               	  	  <td> 등록된 FAQ가 없습니다.</td> 
               	  </tr>
                <% } else {%>
                <%		for(Faq f : faqList){ %>
                  <tr data-toggle="collapse" data-target="#faq<%=f.getFaqNo()%>">
                    <td><img src="<%= request.getContextPath() %>/resources/images/search_title.PNG" style="width:28px; height:25px;"></td>
                    <td class="table_title"><%=f.getFaqTitle()%></td>
                    <td class="table_title">▽</td>
                  </tr>
                  
                  <tr id="faq<%=f.getFaqNo()%>" class="collapse">
                    <td colspan="3">
                      <p style="min-height:150px; white-space: pre-wrap;" class="border rounded mx-auto faq_content"><%=f.getFaqContent()%></p>
                  	</td>
                  </tr>
                <%      } %>
                <% } %>
                </table>
            </div>
            <br>
            <div>
        <!-- --------------------------- QNA ------------------------------- -->
            
                <div class="notice_list_menu">
                    <div class="notice_list_q">
                    	<% if(loginUser != null) { %>
                        <h4><a href="<%= contextPath %>/insertForm.qo">1:1 문의 ></a></h4>
                        <button class="btn btn-secondary" onclick="window.location.href='<%= contextPath %>/insertForm.qo'">1:1 문의하기</button>
                    	<% } else { %>
                    	<h4>1:1 문의 > 로그인 후 이용해주세요.</h4>
                    	<% } %>
                    </div>
                    <br>
                    <div class="notice_list_a">
                        <br>
                        <h3>1:1 문의로 빠른 답변받기</h3>
                        <h6>포마이펫에 관해 더 궁금한 점이 있으시면 부담 없이 문의해보세요 </h6>
                        <br>
                    </div>

                </div>
            </div>
            <br>
            <div>
        <!-- --------------------------- 공지사항 ------------------------------- -->

                <div class="notice_list_menu">
                    <h4><a href="<%= contextPath %>/notice.no">공지사항 ></a></h4><br>
                    <br>
                <table class="table">
                <% if(noticeList.isEmpty()){ %>
                <!-- case1. 조회된 공지글이 없을 경우 -->
                         
                	<tr>
                        <td>등록된 공지사항이 없습니다.</td>
                    </tr>   
                        
                <% } else { %>
                <!-- case2. 조회된 공지글이 있을 경우 -->
                        
                <%		for(Notice n : noticeList){ %>
                  <tr data-toggle="collapse" data-target="#notice<%=n.getNoticeNo()%>">
                    <td>◈</td>
                    <td class="table_title"><%=n.getNoticeTitle()%></td>
                    <td>▽</td>
                  </tr>
                  <tr id="notice<%=n.getNoticeNo()%>" class="collapse">
                    <td  colspan="3">
                      <p  style="min-height:150px; white-space: pre-wrap;" class="border rounded mx-auto faq_content"><%=n.getNoticeContent()%></p>
                  	</td>
                  </tr>
                <%		} %>
                <% } %>

                </table>
                </div>
            </div>
        </div>
            
    </div>
    </section> 
     
    <!--section end-->
    
    
    <!-- footer start -->
   	<%@ include file="/views/common/footer.jsp" %>
   	<!-- footer end -->




</div>
    
    
    

</body>
</html>