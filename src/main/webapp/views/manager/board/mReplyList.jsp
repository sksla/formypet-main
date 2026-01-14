<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 댓글(Reply 여러행) :
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리-댓글관리</title>

<!-- 댓글 관리 스타일 -->
<style>
table>tbody>tr>.reply_content {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	max-width: 140px;
}

.reply_content:hover {
	cursor: pointer;
}

.selected{
	color:#e67e22;
}
</style>
</head>
<body>

	<%@ include file="/views/manager/common/header.jsp"%>

	<%@ include file="/views/manager/common/sidebar.jsp"%>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>댓글 관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">Home</a></li>
					<li class="breadcrumb-item">게시판 관리</li>
					<li class="breadcrumb-item active">댓글 관리</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->


		<section class="section">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">댓글 관리</h5>
					<hr>
					<br>

					<!-- 검색 기능 -->
					<div>
							<select name="boardType" id="boardType">
								<option value="0">전체</option>
								<option value="1">자유</option>
								<option value="2">포토</option>
							</select>
							
							<select name="searchType" id="searchType">
								<option value="userId">아이디</option>
								<option value="reply">댓글내용</option>
							</select> 
							<input class="input_keyword" type="text" name="keyword" placeholder="검색 키워드 입력"> 
							<input class="submitBtn" type="button" onclick="searchKeyword(1);" value="검색">
						
					</div>
					<br>
					
					<form action="<%=contextPath %>/delete.mre" method="get">
						<div class="reply_list">
							<table class="table table-hover">
								<thead>
									<tr>
										<th width="80px"><input class="all" type="checkbox" name="all">
										</th>
										<th width="100px">댓글번호</th>
										<th width="100px">게시판유형</th>
										<th width="100px">게시글번호</th>
										<th width="120px">작성자</th>
										<th width="380px">댓글내용</th>
										<th width="120px">작성일</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
	
							<div style="text-align: left;">
								<button type="submit" class="btn btn-outline-danger btn-sm" onclick="return validate();">선택삭제</button>
							</div>

						
						</form>


						<!-- 페이징 기능 -->
						<ul class="pagination justify-content-center">
							
						</ul>
						
						<script>
							$(function(){
								searchKeyword(1);
								
									
								$(".all").change(function(){
									$(".check").prop("checked", $(this).prop("checked"));
								})
								
							})
						
							// 현재 페이지에 필요한 데이터 + 페이징바정보 ajax조회용   => 첫페이지로딩시, 검색요청시, 페이징바클릭시  
							function searchKeyword(requestPage){
								// ajax 요청시 넘겨야될 값 : 카테고리값 2개, 키워드값, 페이지번호
								// 빈문자열 => 전체 
								console.log($("#boardType").val());
								$.ajax({
									url:"<%=contextPath%>/search.mre",
									method:"get",
									data:{
										boardType:$("#boardType").val(),
										searchType:$("#searchType").val(),
										keyword:$(".input_keyword").val(),
										page: requestPage
										
									},
									success:function(result){
										console.log(result); // {"pi":{}, "list":[{}, {}]}
										
										// 전체선택 체크박스 checked속성 초기화
										$(".all").prop('checked', false);
										
										selectReplyList(result.list);
										
										if(result.list.length > 0){
											searchPaging(result.pi);
										}
									},
									error:function(){
		                				console.log("댓글목록 조회용 ajax통신 실패");
		                			}
									
								})
							
							}
							// 조회된 댓글 데이터 화면에 출력
							function selectReplyList(list){
								//$(".reply_list tbody").html().empty();
								
								let value = "";
								if(list.length > 0 ){
									for(let i=0; i<list.length; i++){
										value += "<tr>"
											  +		"<td><input type='checkbox' class='check' name='no' value='"+ list[i].replyNo + "'></td>"
											  +     "<td>" + list[i].replyNo +"</td>"
											  +		"<td style='color:" + (list[i].refBoardType == 1 ? "green" : "blue") +";'>" + (list[i].refBoardType == 1 ? "자유" : "포토") + "</td>"
											  +		"<td>" + list[i].refBno + "</td>"
											  +		"<td>" + list[i].replyWriter + "</td>"
											  +		"<td class='reply_content' data-toggle='collapse' data-target='#reply" + i +"'>" + list[i].replyContent + "</td>"
											  +		"<td>"+ list[i].enrollDate +"</td>"
										      +  "</tr>"
										      +  "<tr id='reply" + i + "' class='collapse'>"
										      +  "<td colspan='7'><p style='min-height: 150px; white-space: pre-wrap;' class='border rounded w-75 mx-auto p-3'>" + list[i].replyContent + "</p></td>"	
										      +  "</tr>"
										    
									}
								}else{
									value += "<tr><td colspan='6' align='center'>검색 결과 : 조회된 댓글이 없습니다.</td></tr>";
								}
								
								$(".reply_list tbody").html(value);
							}
							
							// 페이징 처리(화면에 출력)
							function searchPaging(pi){
								
								let value = "";
								if(pi.currentPage == 1){
									<%-- 현재 노출되는 p 페이지 수가 1일 경우 --%>
									value += "<li class='page-item disabled'><a class='page-link' href='#'>Prev</a></li>";
								}else{
									value += "<li class='page-item'><a class='page-link' href='#' onclick='searchKeyword(" + (pi.currentPage - 1) + ");'>Prev</a></li>";
								}
								
								for(let p=pi.startPage; p<=pi.endPage; p++){
									if(p == pi.currentPage){
										<%-- 현재 노출되는 p 페이지 수가 내가 보고 있는 현재 페이지일 경우 --%>
										value += "<li class='page-item active'><a class='page-link' href='#' onclick='searchKeyword(" + p + ");'>" + p + "</a></li>";
									}else{
										value += "<li class='page-item'><a class='page-link' href='#' onclick='searchKeyword(" + p + ");'>" + p + "</a></li>";
										
									}
								}
								
								if(pi.currentPage == pi.maxPage){
									<%--내가 현재 보고 있는 페이지가 마지막페이지일 경우 --%>
									value += "<li class='page-item disabled'><a class='page-link' href='#'>Next</a></li>";
								}else{
									value += "<li class='page-item'><a class='page-link' href='#' onclick='searchKeyword(" + (pi.currentPage + 1) + ");'>Next</a></li>";
								}
								
								$(".pagination").html(value);
								
							}
							
							// 체크박스 선택 유무 유효성 검사
							function validate(){
	                    		
	                    		let count = 0;
	                    		$('input[type="checkbox"]').each(function(){
	                    			
	                    			if($(this).prop("checked")){
	                    				count++;
	                    			}
	                    		})
	                    		
	                    		if(count == 0){
	                    			
	                    			alert("하나 이상의 글을 선택해주세요!!");
	                    			return false;
	                    			
	                    		}else{
	                    			if(!confirm("삭제된 글들은 복구가 어렵습니다.\n정말 삭제하시겠습니까?")){
	                    				return false;
	                    			};
	                    		}
	                    	}
						</script>

					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<%@ include file="/views/manager/common/footer.jsp"%>

</body>
</html>