<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/board/boardInsert.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/breadcrumb.css">
	
</head>
<body>

	<!-- header start -->
	<%@ include file="/views/common/header.jsp" %>
	<!--section start-->    

	<!-- 브레드크럼 strat -->
    <div class="breadc">
      <ol>
        <li><a href="#">Home</a></li>
        <li class="separator">&gt</li>
        <li><a href="#">게시판</a></li>
        <li class="separator">&gt</li>
        <li><a href="#">자유게시판</a></li>
        <li class="separator">&gt</li>
        <li>게시글 작성</li>
      </ol>
    </div>
    <!-- 브레드크럼 end -->
  
      <!--section start-->    
      <section class="main_content">
      
		<div>
        <div>
          <h3 class="board_title">게시글 작성</h3>
        </div>

        <div class="content_area">
          <div class="board_list">
            <h5>게시판</h5>
                <a href="<%= contextPath %>/list.b?page=1" class="listTitle" style="color:#ffa51f;">자유게시판</a>
                <ul class="list">
                <% if(loginUser != null){ %>
                  <li><a href="<%= contextPath%>/enrollForm.b">게시글 작성</a></li>
                <% }else{ %>
                  <li><a href="<%= contextPath%>/loginForm.me">게시글 작성</a></li>
                <% } %>
                </ul>

                <a href="<%=contextPath %>/list.th?page=1" class="listTitle">사진게시판</a>
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
            
            <form action="<%= contextPath %>/insert.b" method="post">
	            <div class="content_title">
	                <span><b>제목</b>
	              
	                    <input type="text" id="post_title" required name="title" style="width:95%" placeholder="제목을 입력해주세요">
	                </span>
	             
	                <hr>
	            </div>
	            
	            <div>
	              <p><b>내용</b></p>
	              <textarea id="post_detail" name="content" cols="" rows="10" class="content_detail" required placeholder="내용을 입력해주세요"></textarea>
	            </div>
	
	            <div class="btn_area">
	                <button type="button" class="float-right btn btn-warning btn-sm insertBtn" data-toggle="modal" data-target="#insert_modal">글 작성</button>
	            </div>
	            <!-- modal start -->
	            <!-- 글작성 -->
	            
	                  <!-- The Modal -->
	            <div class="modal" id="insert_modal">
	              <div class="modal-dialog">
	                <div class="modal-content">
	
	                  <!-- Modal Header -->
	                  <!-- modal Header 부분 삭제-->
	
	                  <!-- Modal body -->
	                  <div class="modal-body">
	                    <div class="modal-detail">
	                      <h5><strong>작성한 게시글을 저장하시겠습니까?</strong></h5>
	                    </div>
	                    
	                  </div>
	
	                  <!-- Modal footer -->
	                  <div class="modal-footer">
	                    <div class="modal-btn-area">
	                      <button type="submit" class="btn btn-warning item">확인</button>
	                      <button type="button" class="btn btn-secondary item" data-dismiss="modal">취소</button>
	                    </div>
	                  </div>
	
	                </div>
	              </div>
	            </div>
	
	            <!-- modal end -->
	            
	            
	              <hr>
	            
	            
	            <div class="btn_area">
	                <a href="<%= contextPath %>/list.b?page=1" id="listBtn" class="float-right btn btn-secondary btn-sm" >목록</a>
	            </div>
	            
            </form>
          </div>
	
			
          <div class="content_side_area"></div>


        </div>
          <!-- content end-->
         
        
	</div>
      </section>
      <!--section end-->
      
      <!-- footer start -->
      <%@ include file="/views/common/footer.jsp" %>
      <!-- footer end -->
	
	
	

</body>
</html>