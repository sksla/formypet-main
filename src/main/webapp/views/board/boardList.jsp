<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.formypet.common.model.vo.PageInfo" %>
<%@ page import="com.formypet.board.model.vo.Board" %>
<%@ page import="java.util.List" %>
<%@ page import="com.formypet.member.model.vo.Member" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Board> list = (List<Board>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/breadcrumb.css">

<style>

	

	
	 /*--  BoardList -- */
	
	 .main_content > a{
	    text-decoration: none;
	 }
	
	 .board_title{
	    width: 400px;
	    text-align: right;
	    font-weight: bold;
	    margin-bottom: 10px;
	 }
	 .container{
	    width: 100%;
	 }
	 .board_list > h5{
	    margin-bottom: 30px;
	 }
	
	.board_area{
	    display: flex;
	    margin-top: 100px;
	    width: 100%;
	}
	
	
	.content_list{
	    margin-bottom: 40px;
	    font-weight: bold;
	}
	
	.selectList_area{
	    display: flex;
	    margin-bottom: 10px;
	}
	
	.searchBoard{
	    width: 40%;
	}
	
	
	.selectList{
	    width: 110px; 
	}
	
	.board_list{
	    margin-right: 10px;
	    width: 20%;
	 }
	
	.board_list > .listTitle{
	    text-decoration: none;
	    color: black;
	}
	 
	 .list>li{
	    margin-top: 10px;
	    list-style-type: none;
	 }
	
	 .list>li>a{
	    font-size: 12px;
	    text-decoration: none;
	    color: black;
	 }
	 
	 .board_contentList{
	    justify-content: center;
	    width: 100%;
	 }
	
	 ul{
	    list-style-type: none;
	 }
	 .contentList{
	    align-items: center;
	    text-align: center;
	    width: 100%;
	    margin-bottom: 50px;
	 }
	
	.pagination{
	    margin-top: 40px;
	}
	
	
	
	/* modal */
	
	/* modal 크기 */
	.modal-dialog{
	    width: 400px;
	}
	/* modal body */
	.modal-detail{
	    height: 80px;
	    padding: 40px 0;
	    text-align: center;
	}
	/* modal button */
	.item{
	    width: 100px;
	    color: white;
	}
	.modal-btn-area{
	    width: 290px;  
	}


	


	
	
</style>	
	

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
        <li>자유게시판</li>
      </ol>
    </div>
    <!-- 브레드크럼 end -->
    
      <!--section start-->    
      <section class="main_content">

        <div id="board_content">
          <h3 class="board_title">자유게시판</h3>
          
          <div class="board_area">
          <div class="board_list">
            <h5>게시판</h5>
                <a href="<%= contextPath %>/list.b?page=1" class="listTitle" style="color:#ffa51f;">자유게시판</a>
                <ul class="list">
                <% if(loginUser != null){ %>
                  <li><a href="<%= contextPath%>/enrollForm.b">게시글 작성</a></li>
                <% }else{ %>
                  <li><a href="<%= contextPath %>/loginForm.me">게시글 작성</a></li>
                <% } %>
                </ul>

                <a href="<%=contextPath %>/list.th?page=1" class="listTitle">사진게시판</a>
                <ul class="list">
                <% if(loginUser != null){ %>
                  <li><a href="<%= contextPath%>/enrollForm.th">게시글 작성</a></li>
                <% }else{ %>
                  <li><a href="<%= contextPath %>/loginForm.me">게시글 작성</a></li>
                <% } %>
               </ul>

            </ul>
          </div>
          <div class="board_contentList">
            

            <div class="container">
              

              <form action="<%= contextPath %>/search.b" > 
              <input type="hidden" name="page" value="1">
              <div class="selectList_area">     
                <select name="category" id="category" class="selectList form-control selectpicker noborder" style="width:150px">
                  <option value="title">제목</option>
                  <option value="id">작성자명</option>
                </select>
                <input type="text" name="search" class="searchBoard" placeholder="내용을 입력해주세요" style="width:77%">
                <button onclick="search()">검색</button>
              </div>
              </form>
              
              <script>
				  function search() {
				    var selectedValue = document.getElementById("searchType").value;
				    var searchText = document.getElementById("searchText").value;
			  </script>

              <table class="table contentList table-hover" id="board_list">
                <thead class="thead-light">
                  <tr>
                    <th width="10%">글번호</th>
                    <th width="45%">제목</th>
                    <th width="20%">작성자</th>
                    <th width="15%">작성일</th>
                    <th width="10%">조회수</th>
                  </tr>
                </thead>
                <tbody>
                	<% if(list.isEmpty()){ %>
	                <!-- 조회된 게시글이 없을 경우 -->
	                
	                 <tr>
	                	<td colspan="5" style="text-align: center;">존재하는 게시글이 없습니다</td>
	                 </tr>
	                 <% }else{ %>          
	                 <!-- 조회된 게시글이 있을 경우 -->
	                 	<% for(Board b : list){ %>
		                <tr>
		                    <td><%= b.getBoardNo() %></td>
		                    <td><%=b.getBoardTitle() %></td>
		                    <td><%= b.getBoardWriter() %></td>
		                    <td><%= b.getEnrollDate() %></td>
		                    <td><%= b.getReadCount() %></td>
	                 	</tr>
	                 	<% } %>
	                 <% } %>
                </tbody>
              </table>
              
              <script>
              		$(function(){
              			$("#board_list>tbody>tr").click(function(){
              				location.href = "<%= contextPath%>/detail.b?no=" + $(this).children().eq(0).text();
              			})
              		})
              </script>
              
              <% if(loginUser != null){ %>
              	<button type="button" class="btn btn-secondary btn-sm " onclick="boardInsert();">작성하기</button>
              <% }else{ %>
              <button type="button" class="btn btn-secondary btn-sm " data-toggle="modal" data-target="#login_Modal">작성하기</button>
              <!-- 로그인 전 작성하기 버튼을 눌렀을 경우 -->
              <% } %>
                    <!-- The Modal -->
                    
              <div class="modal" id="login_Modal">
                <div class="modal-dialog">
                  <div class="modal-content">

                    <!-- Modal Header -->
                    <!-- modal Header 부분 삭제-->

                    <!-- Modal body -->
                    <div class="modal-body">
                      <div class="modal-detail">
                        <h5><strong>로그인 하시겠습니까?</strong></h5>
                      </div>
                      
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                      <div class="modal-btn-area">
                        <button type="button" class="btn btn-warning item" data-dismiss="modal" onclick="singup();">확인</button>
                        <button type="button" class="btn btn-secondary item" data-dismiss="modal">취소</button>
                      </div>
                    </div>

                  </div>
                </div>
              </div>
      
            </div>

          </div>
          
          <script>
	    // 게시글 작성 페이지 이동
	    function boardInsert(){
	      window.location.href = "<%= contextPath%>/enrollForm.b";
	    }
	    // 로그인 페이지로 이동
	    function singup(){
	      window.location.href = "<%=contextPath %>/loginForm.me";
	    }
	
	  </script>
          

          <div class="board_list"></div>
       </div>

     

       
        
      <ul class="pagination justify-content-center">
       
       		<% if(pi.getCurrentPage() == 1){ %>
	   	    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	        <% }else{ %>
	   	    <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.b?page=<%= pi.getCurrentPage()-1%>">Previous</a></li>
	        <% } %>
	        
	        <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	        	<% if(p == pi.getCurrentPage()){%>
		        <li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
		        <% }else{ %>
		        <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.b?page=<%= p %>"><%= p %></a></li>
		        <% } %>
	        <% } %>
	       
	       <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
	        <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	        <% }else{ %>
	        <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.b?page=<%= pi.getCurrentPage() + 1%>">Next</a></li>
	        <% } %>
	        
      </ul>
       
	
	        

      </section>
      <!--section end-->
        </div>

        
      
      <!-- footer start -->
      <%@ include file="/views/common/footer.jsp" %>
      <!-- footer end -->


</body>
</html>