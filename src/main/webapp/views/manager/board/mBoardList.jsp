<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.formypet.common.model.vo.PageInfo" %>
<%@ page import="com.formypet.board.model.vo.Board" %>
<%@ page import="java.util.List" %>
<%
	//PageInfo pi = (PageInfo)request.getAttribute("pi");
	//게시글 정보 : 게시글 번호, 게시글 타입, 제목,내용, 작성자아이디, 작성일
	//List<Board> list = (List<Board>)request.getAttribute("list");
	
	// 첨부파일 정보 (Attachment) :파일번호, 참조타입, 저장폴더경로, 실제업로드된 파일명(수정명)
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리-게시글관리</title>
<!-- 게시글 관리 스타일 -->
<style>
#img_content {
	width: 500px;
	height: 300px;
	margin: auto;
}

.carousel-item img {
	width: 500px;
	height: 300px;
}

.board_title:hover {
	cursor: pointer;
}

.board_title {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	max-width: 140px;
}

/* .border {
            overflow: auto;
        } */
</style>

</head>
<body>

	<%@ include file="/views/manager/common/header.jsp"%>

	<%@ include file="/views/manager/common/sidebar.jsp"%>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>게시글 관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">Home</a></li>
					<li class="breadcrumb-item">게시판 관리</li>
					<li class="breadcrumb-item active">게시글 관리</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">게시글 관리</h5>
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
									<option value="title">제목</option>
								</select> 
								<input class="input_keyword" type="text" name="keyword" placeholder="검색어 입력"> 
								<input class="submitBtn" type="button" onclick="searchKeyword(1);" value="검색">
								
							</div>
							<br>

							<!-- 게시글 목록 -->
							<div>
								<form action="<%=contextPath %>/delete.mbo" method="get">
									<table class="table table-hover">
										<thead>
											<tr>
												<th width="80px">
													<input type="checkbox" class="all" name="all">
												</th>
												<th width="100px">게시판유형</th>
												<th width="100px">게시글번호</th>
												<th width="500px">글제목</th>
												<th width="120px">작성자</th>
												<th width="120px">작성일</th>
											</tr> 
										</thead>
										<tbody id="board_srch_list">
											
	                                        
													
										</tbody>
									</table>
	
									<!-- End Table with stripped rows -->
	
									<div style="text-align: left;">
										<button type="submit" class="btn btn-outline-danger btn-sm" onclick="return validate();">선택삭제</button>
									</div>
								</form>
								

								<!-- 페이징 구역 -->
								<ul class="pagination justify-content-center">
								
									
								</ul>
							</div>





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
                                	
                                	$.ajax({
                                		url:"<%=contextPath%>/search.mbo",
                                		method:"GET",
                                		data:{
                                			boardType:$("#boardType").val(),
    										searchType:$("#searchType").val(),
    										keyword:$(".input_keyword").val(),
    										page: requestPage
                                		},
                                		success:function(result){
                                			console.log(result);
                                			
                                			// 전체선택 체크박스 checked속성 초기화
    										$(".all").prop('checked', false);
                                			
                                			selectBoardList(result.list, result.atList);
                                			
                                			if(result.list.length > 0){
    											searchPaging(result.pi);
    										}
                                		},
                                		error:function(){
                                			console.log("게시글목록 조회용 ajax통신 실패");
                                		}
                                	})
                                }
                                
                                
                                function selectBoardList(list, atList){
                                	
                                	let value = ""
                                	
                                	if(list.length > 0){
                                		
                                		for(let i=0; i<list.length; i++){
                                			if(list[i].boardType == 1){
                                				// 자유게시판 일때
                                				value += "<tr>"
														+	"<td><input type='checkbox' class='check' name='no' value='"+ list[i].boardNo +"'></td>"
														+	"<td style='color:green;'>자유</td>"
														+	"<td>"+ list[i].boardNo + "</td>"
														+	"<td class='board_title' data-toggle='collapse' data-target='#board" + i + "'>" + list[i].boardTitle + "</td>"
														+	"<td>"+ list[i].boardWriter +"</td>"
														+	"<td>"+ list[i].enrollDate+"</td>"
														+"</tr>"
														+"<tr id='board"+ i +"' class='collapse'>"
														+	"<td colspan='6'><p style='min-height: 150px; white-space: pre-wrap;' class='border rounded w-75 mx-auto p-3'>"+ list[i].boardContent +"</p></td>"
														+"</tr>";
                                							
                                					
                                			}else{
                                				// 포토게시판 일때
                                				
												
												let count1 = 0;
												
												
												let count2 = 0;
												
                                				value += "<tr>"
													+	"<td><input type='checkbox' class='check' name='no' value='"+ list[i].boardNo +"'></td>"
													+	"<td style='color:blue;'>포토</td>"
													+	"<td>"+ list[i].boardNo + "</td>"
													+	"<td class='board_title' data-toggle='collapse' data-target='#board" + i + "'>" + list[i].boardTitle + "</td>"
													+	"<td>"+ list[i].boardWriter +"</td>"
													+	"<td>"+ list[i].enrollDate+"</td>"
													+"</tr>"
													+"<tr id='board"+ i +"' class='collapse'>"
													+	"<td colspan='6'>"
													+		"<div style='min-height: 150px;' class='border rounded w-75 mx-auto p-3'>"
													+			"<div id='img_content' class='carousel slide' data-ride='carousel'>"
													+				"<ul class='carousel-indicators'>";
																	for(let j=0; j<atList.length; j++){
																		if(atList[j].refBno == list[i].boardNo){
																			value += "<li data-target='#img_content' data-slide-to='" + count1 + "' class='" + (count1 == 0 ? "active" : "") + "'></li>";
																			count1++;
																	}
																}
												value +=			"</ul>"
													+				"<div class='carousel-inner'>";
																for(let k=0; k<atList.length; k++){
																	if(atList[k].refBno == list[i].boardNo){
																		value += "<div class='carousel-item " + (count2 == 0 ? "active" : "") + "'>"
																				+ 	"<img src='" + <%=contextPath + "/"%> + atList[k].filePath + atList[k].changeName + "'>"
																				+"</div>";
																				count2++;
																	}
																}
												value +=			"</div>"
													+ 				"<a class='carousel-control-prev' href='#img_content' data-slide='prev'>"
													+					"<span class='carousel-control-prev-icon'></span>"
													+				"</a>"
													+				"<a class='carousel-control-next' href='#img_content' data-slide='next'>"
													+				"<span class='carousel-control-next-icon'></span>"
													+				"</a>"
													+			 "</div>"
													+			"<br>"
													+			"<table class='table'>"
													+				"<tr>"
													+					"<th style='background-color: lightgray; text-align: center;'>내용</th>"
													+				"</tr>"
													+				"<tr>"
													+					"<td><p style='white-space: pre-wrap;'>" + list[i].boardContent + "</p></td>"
													+				"</tr>"
													+			"</table>"
													+		"</div>"
													+	"</td>"
													+"</tr>";
													
                                			}
                                		}
                                	}else{
                                		value += "<tr><td colspan='6' align='center'>검색 결과 : 조회된 게시글이 없습니다.</td></tr>";
                                	}
                                	
                                	$("#board_srch_list").html(value);
                                	
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
			</div>
		</section>

	</main>
	<!-- End #main -->

	<%@ include file="/views/manager/common/footer.jsp"%>

</body>
</html>