<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getAttribute("b");
	List<Attachment> list = (List<Attachment>)request.getAttribute("list");
%>
<%@ page import="java.util.List, com.formypet.board.model.vo.Board, com.formypet.common.model.vo.Attachment" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

		/* Section 관련 스타일 */
	
	.content_area{
	    display: flex;
	    margin-top: 7%;
	    margin-bottom: 7%;
	}
	
	.board_title{
	    width: 400px;
	    text-align: right;
	    font-weight: bold;
	    margin-top: 30px;
	    margin-bottom: 10px;
	 }
	
	.board_content{
	    
	    width:100%;
	    margin:auto;
	    min-height:500px;
	    padding:50px;
	    border-radius:10px;
	}
	
	.side_area{
	    margin-right: 10px;
	    width: 20%;
	    height: 100%;
	    padding-top: 50px;
	 }
	
	 .side_area > h5{
	    margin-bottom: 30px;
	 }
	
	.side_area > .listTitle{
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
	
	
	.detail{
	    border: 1px solid lightgray;
	    min-height: 200px;
	}
	
	#img_content{
	    width: 500px;
	    height: 300px;
	    margin: auto;
	}
	
	.carousel-item img{
	    width: 500px;
	    height: 300px;
	
	}
	
	div>h2{
	    margin-bottom: 5%;
	}
	
	.content_notice{
	    margin: auto;
	    margin-bottom: 5%;
	    font-size: 12px;
	    padding-top: 10px;
	    padding-left: 10px;
	    padding-right: 10px;
	    padding-bottom: 20px;
	    border: 1px solid lightgray;
	    width: 80%;
	    align-items: center;
	}
	
	.table{
	    width: 80%;
	}
	.table-item{
	    margin: auto;
	}
	
	#img_content{
        width: 500px;
        height: 300px;
        margin: auto;
    }

    .carousel-item img{
        width: 500px;
        height: 300px;
    }
	
	

</style>

	
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
        <li class="separator">&gt</li>
        <li><a href="#">게시판</a></li>
        <li class="separator">&gt</li>
        <li>사진게시판</li>
      </ol>
    </div>
    <!-- 브레드크럼 end -->

   <!--section start--> 
      
        <!-- sidebar start -->
        <section class="main_content">

		<div>
          <div>
            <h3  class="board_title">사진게시글</h3>
          </div>
          <div class="content_area">
            <div class="side_area">
                <h5>게시판</h5>
                <a href="<%= contextPath %>/list.b?page=1" class="listTitle">자유게시판</a>
                <ul class="list">
                <% if(loginUser != null){ %>
                  <li><a href="<%= contextPath%>/enrollForm.b">게시글 작성</a></li>
				<% }else{ %>
				  <li><a href="<%= contextPath%>/loginForm.me">게시글 작성</a></li>
				  <% } %>
                </ul>

                <a href="<%= contextPath %>/list.th?page=1" class="listTitle" style="color:#ffa51f;">사진게시판</a>
                <ul class="list">
                <% if(loginUser != null){ %>
                  <li><a href="<%= contextPath %>/enrollForm.th">게시글 작성</a></li>
                <% }else{ %>
                  <li><a href="<%= contextPath %>/loginForm.me">게시글 작성</a></li>
                <% } %>
              </ul>

            </div>
            <!-- sidebar end -->
          
          <div class="board_content">
              
              

              <div class="content_notice contentBox">
                
                  º 포마이펫 자유게시판은 집사님들의 자유로운 소통과 정보공유를 위한 공간입니다. <br> <br>
    
                  상업성광고,특정단체나 개인의 명예훼손 게시물, 음란물 등 미풍양속에 어긋나는 게실물은 <br>
                  관리자의 권한으로 삭제 될 수 있으니 게시판 성격에 맞는 내용만 게시하시기 바랍니다. <br>
                  <br><br>
              
                  º 자유게시판에 등록된 홍보·광고성 글은 개인이 등록한 글입니다
              
                  홍보된 내용이나 개인 상호간 거래에 대해서는 책임지지 않습니다. <br><br>
                  상호 거래 시 유의하시기 바랍니다.
              </div>
                
                  <table class="table table-item">
                    <tr>
                        <th width="150px">제목</th>
                        <td colspan="4"><%= b.getBoardTitle() %></td>
                    </tr>
                    <tr>
                        <th width="100px">작성자</th>
                        <td width="200px"><%= b.getBoardWriter() %></td>
                        <th width="80px">작성일</th>
                        <td><%= b.getEnrollDate() %></td>
                        <td width="100px"><%= b.getReadCount() %></td>
                    </tr>
                  </table>
                

              <div id="img_content" class="carousel slide" data-ride="carousel">

                  <!-- Indicators -->
                  <ul class="carousel-indicators">
                    <% for(int i=0; i<list.size(); i++){%>
                    <li data-target="#img_content" data-slide-to="<%= i %>" class="<%= i==0? "active":""%>"></li>
                   <% } %>
                  </ul>
                
                  <!-- The slideshow -->
                  
                  <div class="carousel-inner">
                      <!-- 이미지 갯수만큼 .carousel-item-->
                    <% for(int i=0; i<list.size(); i++){ %>
                    <div class="carousel-item <%= i==0? "active":"" %>">
                      <img style="width:500px; height:300px;" src="<%= contextPath + "/" + list.get(i).getFilePath() + list.get(i).getChangeName() %>" >
                    </div>
                    <% } %>
                  </div>
                
                  <!-- Left and right controls -->
                  <a class="carousel-control-prev" href="#img_content" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                  </a>
                  <a class="carousel-control-next" href="#img_content" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                  </a>
                
                </div>


              

              <table class="table table-item">
                  <tr>
                      <th width="140px">내용</th>
                      <td colspan="4"><div class="detail" style="width: 100%;"><%= b.getBoardContent() %></div></td>
                  </tr>
                  <tr>
                      <th>첨부파일</th>
                      <td colspan="3">
                          <a href="" style="color:black">첨부파일원본명.jpg</a>
                      </td>
                  </tr>
                  
              </table>

              <br><br>
          



            <!-- 댓글관련 영역 -->
          
            <table class="table table-item" id="reply_area">
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
                
		                
                  <table>
		          	<tr>
		          		<td colsapn="2" width="85%" ><a href="<%=contextPath %>/list.th?page=1" class="btn btn-secondary btn-sm" style="color:white">목록</button></td>
		          		<% if(loginUser != null){ %>
		          		<td><a href="<%= contextPath %>/updateForm.th?no=<%= b.getBoardNo() %>" class="btn btn-warning btn-sm " style="color:white">수정</a> <button class="btn btn-secondary btn-sm" style="color:white">삭제</button></td>
		          		<% } %>
		          	</tr>
		          </table>

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
          <div class="side_area"></div>
    </div>
    </div>
    </section>

      <!--section end-->
      
      <!-- footer start -->
      <%@ include file="/views/common/footer.jsp" %>
      <!-- footer end -->

</body>
</html>