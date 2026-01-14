<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getAttribute("b");
%>
<%@ page import="com.formypet.board.model.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/board/boardDetail.css">
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
        <li class="separator">&gt;</li>
        <li><a href="#">게시판</a></li>
        <li class="separator">&gt;</li>
        <li>자유게시판</li>
      </ol>
    </div>
    <!-- 브레드크럼 end -->

      <!--section start-->    
      <section class="main_content">

		<div>
        <div class="board_content">
          <h3 class="board_title">자유게시글</h3>
        </div>

        <div class="content_area">
          <div class="board_list">
            <h5>게시판</h5>
                <a href="<%= contextPath %>/list.b?page=1" class="listTitle" style="color:#ffa51f;">자유게시판</a>
                <ul class="list">
                <% if(loginUser != null){ %>
                  <li class=""><a href="<%= contextPath%>/enrollForm.b">게시글 작성</a></li>
                <% }else{ %>
                  <li class=""><a href="<%= contextPath%>/loginForm.me">게시글 작성</a></li>
                <% } %>
                </ul>

                <a href="<%= contextPath %>/list.th?page=1" class="listTitle">사진게시판</a>
                <ul class="list">
                <% if(loginUser != null){ %>
                  <li><a href="<%= contextPath%>/enrollForm.th">게시글 작성</a></li>
                <% }else{ %>
                  <li><a href="<%= contextPath%>/loginForm.me">게시글 작성</a></li>
                <% } %>
               </ul>

            </ul>
          </div>
        
       

          <!-- content start-->
     
          <div class="content">
            <div class="content_notice contentBox">
              
              º 포마이펫 자유게시판은 집사님들의 자유로운 소통과 정보공유를 위한 공간입니다. <br> <br>

              상업성광고,특정단체나 개인의 명예훼손 게시물, 음란물 등 미풍양속에 어긋나는 게실물은 <br>
              관리자의 권한으로 삭제 될 수 있으니 게시판 성격에 맞는 내용만 게시하시기 바랍니다. <br>
              <br><br>
          
              º 자유게시판에 등록된 홍보·광고성 글은 개인이 등록한 글입니다
          
              홍보된 내용이나 개인 상호간 거래에 대해서는 책임지지 않습니다. <br><br>
              상호 거래 시 유의하시기 바랍니다.
            </div>

            <div class="content_title contentBox ">
              <h5><strong><%= b.getBoardTitle() %></strong></h5>
            </div>

            <div class="content_info">
             <p class="item1">작성자: <%= b.getBoardWriter() %></p>
             <p class="item2">등록일: <%= b.getEnrollDate() %></p>
             <p class="item3">조회수: <%= b.getReadCount() %></p>
            </div>

            <div class="content_detail contentBox" style="white-space:pre">
             
              <p style="white-space:pre"><%= b.getBoardContent() %></p>
             
            </div>
          </div>

          <div class="content_side_area"></div>

        </div>
        
          <!-- content end-->
          <div class="content_area">
              
            <div class="board_list"></div>
            <div class="comment_area">
            
            
            <div class="btn_area">
                <a href="<%= contextPath %>/list.b?page=1" class="btn btn-secondary btn-sm">목록</a>
                <% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())) {%>
                <a href="<%= contextPath %>/delete.b?no=<%=b.getBoardNo() %>"class="float-right btn btn-secondary btn-sm" onclick="return confirm('삭제 하시겠습니까?');">삭제</a>
                <a href="<%= contextPath %>/updateForm.b?no=<%= b.getBoardNo() %>" class="float-right btn btn-warning btn-sm">변경</a>
                <% } %>
            </div>
           
            


                  
                
                  <!-- 댓글관련 영역 -->
                
                <table class="table" id="reply_area">
                  <thead>
                      <tr>
                          <th>댓글</th>
                          <% if(loginUser == null){ %>
                          <th><input type="text" class="form-control" placeholder="로그인 후 이용 가능한 서비스입니다" readonly></th>
                          <th><button class="btn btn-secondary btn-sm" disabled>댓글등록</button></th>
                          <% }else{ %>
                          <th><input type="text" class="form-control" placeholder="내용을 입력해주세요" id="reply_content"></th>
                          <th><button class="btn btn-secondary btn-sm" onclick="insertReply()">댓글등록</button></th>
                          <% } %>
                      </tr>
                  </thead>
                    <tbody>
                      
                    </tbody>

                 </table>
              
              <script>
             
              
              // ajax 댓글 등록
              
              
              function insertReply(){
            	  $.ajax({
            			url:"<%= contextPath%>/rinsert.b",
            			data:{
            				no:<%= b.getBoardNo()%>,
            			 	content:$("#reply_content").val()
            			},
            	  		
            	  		type:"post",
            	  		success:function(result){
            	  			if(result > 0){
            	  				$("#reply_content").val("");
            	  				selectReplyList();
            	  			}
            	  			
            	  		},
            	  		error:function(){
            	  			console.log("통신 실패")
            	  		}
            	  		
              })
              }
              
              $(function(){
            	  selectReplyList();
              })
	              
              
              	function selectReplyList(){
              		$.ajax({
              			url:"<%= contextPath%>/rlist.b",
              			data:{no:<%= b.getBoardNo()%>},
              			type:"post",
              			success:function(list){
              				
              				console.log(list);
              				
              				let value="";
              				if(list.length > 0){
              					for(let i=0; i<list.length; i++){
                  					value += "<tr>"
    	              						  + "<th>" + list[i].replyWriter + "</th>"
    	              						  + "<td>" + list[i].replyContent + "</td>"
    	              						  + "<td>" + list[i].enrollDate + "</td>"
    	              					   + "</tr>"
                  				}
              				}else{
              					value += "<tr><td colspan='3'>존재하는 댓글이 없습니다</td></tr>"
              				}
              				
              				$("#reply_area tbody").html(value);
              			},
              			error:function(){
              				console.log("통신 실패")
              			}
              		})
              	}
              
              </script>
            


            </div>
          </div>
       </div>
          
      </section>
      <!--section end-->
      
      <!-- footer start -->
      <%@ include file="/views/common/footer.jsp" %>
      <!-- footer end -->



</body>
</html>