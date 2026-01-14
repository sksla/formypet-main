<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	.board_content{
	    
	    width:100%;
	    margin:auto;
	    min-height:500px;
	    padding:50px;
	    border-radius:10px;
	}
	
	.board_title{ 
	    width: 450px;
	    text-align: right;
	    font-weight: bold;
	    margin-top: 30px;
	    margin-bottom: 10px;
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
	
	
	
	/* 사진게시판 등록에서만 필요한 style */
	.title_img {
	    width: 450px;
	    height: 300px;
	}
	.content_img {
	    width: 180px;
	    height: 100px;
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
          <li><a href="#">사진게시판</a></li>
          <li class="separator">&gt</li>
          <li>게시글 작성</li>
        </ol>
      </div>
      <!-- 브레드크럼 end -->

      <!--section start-->    
      <section class="main_content">

		<div>
        <div >
            <h3 class="board_title">사진게시글 작성</h3>
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
                    <li><a href="<%= contextPath%>/enrollForm.th">게시글 작성</a></li>
                    <% }else { %>
                    <li><a href="<%= contextPath%>/loginForm.me">게시글 작성</a></li>
                    <% } %>
                </ul>

            </div>
            <div class="board_content">
                
                
                <!-- 스크립트 -->
		<script>
		$(document).ready(function() {
		    var modal = $('#potoInsert_modal'); // modal 변수를 전역 범위에서 정의

		    <% 
		    String errorMsg = (String)request.getAttribute("errorMsg");
		    if (errorMsg != null) {
		    %>
		    // 모달이 열려 있지 않은 경우에만 열도록 조건을 추가합니다.
		    if (!modal.hasClass('show')) {
		        modal.modal('show');
		    }
		    // errorMsg에 따라서 모달 내용을 설정합니다.
		    var modalBody = modal.find('.modal-detail');
		    
		    // errorMsg에 따라 분기 처리
		    var errorMsgValue = "<%= errorMsg %>";
		    if (errorMsgValue === "success") {
		        modalBody.text("작성하시겠습니까?");
		        // 모달 닫기 버튼 클릭 시 처리
		        modal.find('.modal-footer button[data-dismiss="modal"]').click(function() {
		            // 모달이 닫힐 때 상세조회 페이지로 이동
		            window.location.replace("<%= request.getContextPath() %>/list.th");
		        });
		    } 
		    <% } %>

		    // 닫기 버튼 클릭 이벤트
		    modal.find('.modal-footer button[data-dismiss="modal"]').click(function() {
		        modal.modal('hide');
		    });
		});
		</script>
                

                <form action="<%= contextPath %>/insert.th" method="post" enctype="multipart/form-data">
                    <table class="table">
                        <tr>
                            <th>제목</th>
                            <td colspan="4"><input type="text" class="form-control" required name="title"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="4"><textarea cols="30" rows="10" name="content" class="form-control" style="resize:none;" required ></textarea></td>
                            <tr>
                                <th width="120px">대표이미지</th>
                                <td>
                                    <img class="img_preview title_img" onclick="chooseFile(0)">
                                </td>
                                <th width="120px">상세이미지</th>
                                <td>
                                    <img class="img_preview content_img" onclick="chooseFile(1)">
                                    <img class="img_preview content_img" onclick="chooseFile(2)">
                                    <img class="img_preview content_img" onclick="chooseFile(3)">
                                </td>

                            </tr>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#potoInsert_modal">등록</button>
                                <button type="reset" class="btn btn-outline-danger btn-sm">초기화</button>
                                <a href="<%=contextPath %>/list.th?page=1" class="btn btn-outline-warning btn-sm">목록</a>
                            
                            <!-- modal start -->
                    <!-- The Modal -->
                    <div class="modal" id="potoInsert_modal">
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
                                <button type="submit" class="btn btn-warning item" id="ok">확인</button>
                                <button type="button" class="btn btn-secondary item" data-dismiss="modal">취소</button>
                            </div>
                            </div>
        
                        </div>
                        </div>
                    </div>
        
                    <!-- modal end -->
                            </td>
                        </tr>
                    </table>

                    <!-- 글작성 -->
                    
                    

                    <div style="display: none;">
                        <!-- 대표이미지-->
                        <input type="file" name="upfile1" onchange="loadImg(0)" required>
                        <!-- 상세이미지-->
                        <input type="file" name="upfile2" onchange="loadImg(1)">
                        <input type="file" name="upfile3" onchange="loadImg(2)">
                        <input type="file" name="upfile4" onchange="loadImg(3)">
                    </div>

                    <script>
                        function chooseFile(idx){
                            $(":file").eq(idx).click();
                        }



                        function loadImg(idx){
                            // idx : img요소들 중 몇번 인덱스 img요소에 미리보기 효과를 넣을 건지
                            // window.target.event : 현재 change이벤트가(파일선택, 파일해제)가 발생한 input type="file" 요소
                            const inputFile = window.event.target;

                            //console.log(inputFile.files); // FileList객체 { 0:파일객체, length:파일갯수}
                            //console.log(inputFile.files[0]); // File객체 (우리가 읽어들여야되는 파일)

                            if(inputFile.files.length == 1){ // 선택된 파일이 있을 경우

                                // 파일을 읽어들이는 FileReader 객체
                                const reader = new FileReader();
                                // 파일을 읽어들이는 메소드
                                reader.readAsDataURL(inputFile.files[0]);
                                // 위의 코드가 실행되는 순간 이 파일만들 지칭할 수 있는 고유한 url이 만들어짐

                                // 파일 읽어들이기가 완료됐을 경우 실행할 function 정의해두기
                                reader.onload = function(e){
                                    // e.target.result : 읽어들인 파일의 고유한 url값
                                    $(".img_preview").eq(idx).attr("src", e.target.result);
                                }


                            } else { // 선택됐던 파일이 제거 됐을 경우 => 미리보기 했던걸 안보여지게끔
                                $(".img_preview").eq(idx).attr("src", null);
                            }


                        }                        
                    </script>


                </form>

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