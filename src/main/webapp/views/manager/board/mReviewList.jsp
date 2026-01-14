<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리-리뷰관리</title>

<!-- 리뷰 관리 스타일 -->
<style>
.review_content:hover {
	cursor: pointer;
}

fieldset {
	border: 1px solid lightgray;
	padding: 20px;
}

/* 이미지 넘어가는 거 설정 */
#img_content {
	width: 500px;
	height: 300px;
	margin: auto;
}

.carousel-item img {
	width: 500px;
	height: 300px;
}

.review_content, .macro_title {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	max-width: 140px;
}

.macro_title{
	cursor:pointer;
}

.review_pro_name {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	max-width: 120px;
}

.opt_sch_wrap {
	display: flex;
	justify-content: space-between;
}
</style>

</head>
<body>

	<%@ include file="/views/manager/common/header.jsp"%>

	<%@ include file="/views/manager/common/sidebar.jsp"%>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>리뷰 관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">Home</a></li>
					<li class="breadcrumb-item">게시판 관리</li>
					<li class="breadcrumb-item active">리뷰 관리</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->


		<section class="section">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">리뷰 관리</h5>
					<hr>
					<br>

					<!-- 검색 기능 -->
					<div>
						<fieldset>
							
								<h5>평점</h5>
								<br>
								<div class="opt_sch_wrap">
									<div class="opt">
										<div class="form-check-inline">
											<label class="form-check-label"> 
											<input type="radio" class="form-check-input rate" name="rate" checked value="0">
											전체
											</label>
										</div>
										<div class="form-check-inline">
											<label class="form-check-label"> 
												<input type="radio" class="form-check-input rate" name="rate" value="1">
												1점
											</label>
										</div>
										<div class="form-check-inline">
											<label class="form-check-label"> 
												<input type="radio" class="form-check-input rate" name="rate" value="2">
												2점
											</label>
										</div>
										<div class="form-check-inline">
											<label class="form-check-label"> 
												<input type="radio" class="form-check-input rate" name="rate" value="3">
												3점
											</label>
										</div>
										<div class="form-check-inline">
											<label class="form-check-label"> 
												<input type="radio" class="form-check-input rate" name="rate" value="4">
												4점
											</label>
										</div>
										<div class="form-check-inline">
											<label class="form-check-label"> 
												<input type="radio" class="form-check-input rate" name="rate" value="5">
												5점
											</label>
										</div>
									</div>

									<div class="search">
										<select name="searchType" id="searchType">
											<option value="proName">상품명</option>
											<option value="userId">아이디</option>
										</select> 
										<input class="input_keyword" type="text" name="keyword" placeholder="검색어 입력">
										<button type="button" class="btn btn-secondary btn-sm" onclick="searchKeyword(1);">검색</button>
									</div>

								</div>

							
						</fieldset>
					</div>
					<br>

					<div class="reply_list">
						<form action="<%=contextPath %>/delete.mrv" method="get">
							<table class="table">
								<thead>
									<tr>
										<th width="80px">
											<input type="checkbox" class='all' name="all">
										</th>
										<th width="100px">상품번호</th>
										<th width="120px">상품명</th>
										<th width="300px">리뷰내용</th>
										<th width="120px">작성자</th>
										<th width="100px">평점</th>
										<th width="100px">답변상태</th>
										<th width="120px">작성일</th>
									</tr>
								</thead>
								<tbody id="searchList">
									
									<!-- ajax로 검색된 데이터들 보여지는 영역 -->
									
									
								</tbody>
							</table>
	
							<div style="text-align: left;">
								<button type='button' class='btn btn-warning btn-sm' data-toggle='modal' data-target='#macro_enroll'>매크로 등록</button>
								<button type="submit" class="btn btn-outline-danger btn-sm" onclick="return validate();">선택삭제</button>
							</div>
						</form>
						

						<!--  매크로 등록 모달 창 -->
						<div class="modal" id="macro_enroll">
							<div class="modal-dialog">
								<div class="modal-content">
									
									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">매크로 등록</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<form action="<%=contextPath %>/insert.mac" method="post">
										<!-- Modal body -->
										<div class="modal-body">
											<h5>등록할 매크로 입력</h5>
											<textarea rows="5" class="form-control" style="border: 1px solid lightgray; resize: none; " required name="content" placeholder="매크로에 등록할 답변 내용을 입력해주세요."></textarea>
										</div>
	
										<!-- Modal footer -->
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary" >등록</button>
											<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
										</div>
									</form>
								</div>
							</div>
						</div>


						<!--  매크로 목록 조회 모달 창 -->
						<div class="modal" id="macro_list">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">매크로 조회 및 선택</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<div class="modal-body">

										<div>
											<h5>등록된 매크로</h5>
											<table class="table">
												<thead>
													<tr>
														<th>매크로 번호</th>
														<th>매크로 내용</th>
													</tr>
												</thead>
												<tbody>
												
													<!-- 등록된 매크로 없음 -->
													<!--  
						                            <tr>
						                                <td colspan="2" style="text-align: center;">등록된 매크로가 없습니다.</td>
						                            </tr>
						                            -->
	
													<!-- 등록된 매크로 있음 -->
													<tr data-toggle="collapse" data-target="#macro1">
														<td>1</td>
														<td class="macro_title">좋은 리뷰 ㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳㄳ</td>
													</tr>
													<tr id="macro1" class="collapse">
														<td colspan="2">
															<p style="min-height: 150px; white-space: pre-wrap;">좋은
																리뷰 ㄳㄳ</p>
															<div style="text-align: center;">
																<button class="btn btn-danger btn-sm">삭제</button>
																<button class="btn btn-secondary btn-sm" onclick="setMacroReview();">선택</button>
															</div>
														</td>
													</tr>
													<tr data-toggle="collapse" data-target="#macro2">
														<td>2</td>
														<td>앗 죄송죄송ㅠ 분발하겠음</td>
													</tr>
													<tr id="macro2" class="collapse">
														<td colspan="2">
															<p style="min-height: 150px; white-space: pre-wrap;">앗
																죄송죄송ㅠ 분발하겠음</p>
															<div style="text-align: center;">
																<button class="btn btn-danger btn-sm">삭제</button>
																<button class="btn btn-secondary btn-sm">선택</button>
															</div>
														</td>
													</tr>
												</tbody>
											</table>

										</div>
									</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
									</div>

								</div>
							</div>
						</div>



						<!-- 페이징 기능 -->
						<ul class="pagination justify-content-center">
							
						</ul>

					</div>
					
				</div>
			</div>
			<script>
					
				$(function(){
	            	searchKeyword(1);
	            	
	            	$(".all").change(function(){
						$(".check").prop("checked", $(this).prop("checked"));
					})
					
					selectMacro();
					
					
	            })
	            
	            // 현재 페이지에 필요한 데이터 + 페이징바정보 ajax조회용   => 첫페이지로딩시, 검색요청시, 페이징바클릭시 
	            function searchKeyword(requestPage){
	            	// ajax 요청시 넘겨야될 값 : 카테고리값 2개(별점, 키워드유형), 키워드값, 페이지번호
	            	// 빈문자열 => 전체 별점
	            	
	            	$.ajax({
	            		url:"<%=contextPath%>/search.mrv",
	            		method:"GET",
	            		data:{
	            			rate:$('input[name="rate"]:checked').val(),
							searchType:$("#searchType").val(),
							keyword:$(".input_keyword").val(),
							page: requestPage
	            		},
	            		success:function(result){
	            			console.log(result);
	            			
	            			// 전체선택 체크박스 checked속성 초기화
							$(".all").prop('checked', false);
	            			
	            			selectReviewList(result.list);
	            			
	            			
	            			if(result.list.length > 0){
	            				searchPaging(result.pi);
	            			}
	            			
	            		
	            		},
	            		error:function(){
	            			console.log("게시글목록 조회용 ajax통신 실패");
	            		}
	            	})
	            }// searchKeyword(requestPage) 끝
	            
	            function selectReviewList(list){
	            	let value = "";
	            	
	            	if(list.length > 0){
	            		
		            	for(let i=0; i<list.length; i++){
	            			value += "<tr>"
	            				   + 	"<td><input type='checkbox' class='check' name='reNo' value='" + list[i].reNo +"'></td>"	
	            				   + 	"<td>"+ list[i].proNo +"</td>"
	            				   +	"<td class='review_pro_name'>"+ list[i].proName +"</td>"
	            				   + 	"<td class='review_content' data-toggle='collapse' data-target='#review" + i +"'>" + list[i].reContent +"</td>"
								   +	"<td>" + list[i].reWriter + "</td>"
								   +    "<td>" + list[i].reStar + " 점</td>"
								   +	"<td style='color:" + (list[i].status == "N" ? "red" : "blue") +";'>" + (list[i].status == "N" ? "대기중" : "답변완료") + "</td>"
								   +    "<td>" + list[i].enrollDate + "</td>"
	            				   +    "</tr>"
	            				   +	"<tr id='review" + i + "' class='collapse'>"
	            				   +	"<td colspan='8'>"
	            				   +		"<div style='min-height: 150px;' class='border rounded w-75 mx-auto p-3'>";
			            			if(list[i].atList != null){
						   				// 첨부파일이 있을 경우
						   				value += "<div id='img_content' class='carousel slide' data-ride='carousel'>"
						   				       + 	"<ul class='carousel-indicators'>";
						   				       // 첨부파일 개수 만큼
						   				       for(let j=0; j<list[i].atList.length; j++ ){
						   				    		value += "<li data-target='#img_content' data-slide-to='" + j + "' class='" + (j == 0 ? "active" : "") + "'></li>";
						   				       }
						   				       
						   				value += 	"</ul>" 
						   				       +	"<div class='carousel-inner'>";
						   				       
						   				       // 첨부파일 개수 만큼
						   				       for(let j=0; j<list[i].atList.length; j++){
						   				    	   value += "<div class='carousel-item " + (j == 0 ? "active" : "") + "'>"
						   				    	          +		"<img src='" + <%=contextPath + "/"%> + list[i].atList[j].filePath + list[i].atList[j].changeName + "'>"
						   				    	          +	"</div>";
				   				       		   }
				   				
				   				value += 	"</div>"
				   					   +	"<a class='carousel-control-prev' href='#img_content' data-slide='prev'>"
				   				       +		"<span class='carousel-control-prev-icon'></span>"
				   				       +	"</a>"
				   				       +	"<a class='carousel-control-next' href='#img_content' data-slide='next'>"
				   				       +		"<span class='carousel-control-next-icon'></span>"
				   				       +	"</a>"
				   				       + "</div>"
									   + "<br>";
			            			}    
	   				value +=	   		"<table class='table'>"		
           			       +				"<tr>"
           			       +					"<th>상품명</th>"
           			       +					"<td>" + list[i].proName + "</td>"
           			       +				"</tr>"
           			       +				"<tr>"
           			       +					"<th>작성자</th>"
           			       +					"<td>" + list[i].reWriter + "</td>"
           			       +				"</tr>"
           			       +				"<tr>"
           			       +					"<th>별점</th>"
           			       +					"<td>";
           			       							for(let j=0; j<list[i].reStar; j++){
           			       								value += "★";
           			       							}
           			value +=					"</td>"
           				   +				"</tr>"
           				   +				"<tr>"
           				   +					"<th>내용</th>"
           				   +					"<td><p style='min-height: 150px; white-space: pre-wrap;'>" + list[i].reContent +"</p></td>"
           				   +				"</tr>"
          				   +			"</table>"
           				   +			"<table class='table'>";
       				   	   if(list[i].status == "N"){
       				   		   value += 	"<thead>"
       				   		   		  +			"<tr>"
       				   		   		  +				"<th width='200px'>답변등록</th>"
       				   		   		  +				"<td width='500px'><textarea rows='5' class='form-control insert_form' id='reply_form" + list[i].reNo + "' style='resize: none;'></textarea></td>"
       				   		   		  +			"</tr>"
       				   		   		  +		"</thead>"
       				   		   		  +		"<tbody>"
       				   		   		  +			"<tr>"
       				   		   		  +				"<td colspan='2' style='text-align: center;'>"
       				   		   		  +					"<div style='text-align: center;'>"
       				   		   		  +						"<button type='button' class='btn btn-secondary btn-sm' data-toggle='modal' data-target='#macro_list'>답변 매크로</button> "
       				   		   		  +						"<button type='button' class='btn btn-primary btn-sm' onclick='insertReview(" + list[i].reNo + ");'>답변등록</button> "
       				   		   		  +					"</div>"
       				   		   		  +				"</td>"
       				   		   		  +			"</tr>"
       				   		   		  +		"</tbody>";
       				   		   		  
       				   	   }else{
       				   		   value += 	"<tr>"
       				   		   		  +			"<th width='200px'>답변 내용</th>"
       				   		   		  +			"<td width='500px'><p style='min-height:150px; white-space:pre-wrap;'>" + list[i].review + "</p></td>"
       				   		   		  +		"</tr>";
       				   		   		  
       				   	   }
	            				   
           			value +=			"</table>"  
           			       +		"</div>"
           			       +	"</td>"
           			       +"</tr>";
           			       
		            	

		            	}

		            }else{
		            	
		            	value += "<tr><td colspan='6' align='center'>조회된 리뷰가 없습니다.</td></tr>";
	
		            }
		            	
		            	$("#searchList").html(value);
		            	
		            	
	            	
	            }// selectReviewList() 끝
	            
	            
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
					
				}// 페이징 메소드 끝
				
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
            	}// validate() 끝
				
				
				
				// 매크로 답변 목록 조회
				function selectMacro(){
					$.ajax({
						url:"<%=contextPath%>/list.mac",
						data:{},
						success:function(list){
							
							let value = "";
							if(list.length > 0){
								for(let i=0; i<list.length; i++){
									value += "<tr data-toggle='collapse' data-target='#macro" + list[i].macroNo + "'>"
										   + 	"<td>" + list[i].macroNo + "</td>"
										   +    "<td class='macro_title'>"+ list[i].macroContent +"</td>"
										   + "</tr>"
										   + "<tr id='macro" + list[i].macroNo + "' class='collapse'>"
										   + 	"<td colspan='2'>"
										   +		"<p style='min-height: 150px; white-space: pre-wrap;' id='macro_content" + list[i].macroNo +"'>" + list[i].macroContent + "</p>"
										   +		"<div style='text-align: center;'>"
										   +			"<button type='button' class='btn btn-danger btn-sm' onclick='deleteMacro(" + list[i].macroNo +  ");'>삭제</button> "
										   +    		"<button type='button' data-dismiss='modal' class='btn btn-secondary btn-sm' onclick='setMacroReview(" + list[i].macroNo + ");'>선택</button>"
										   +		"</div>"
										   + 	"</td>"	
										   +"</tr>";
											
									
								
								}
							}else{
								value += "<tr><td colspan='2' style='text-align: center;'>등록된 매크로가 없습니다.</td></tr>"
							}
							
							$("#macro_list tbody").html(value);
						},
						error:function(){
							console.log("매크로 목록 조회용 ajax통신 실패");
						}
					})
				}// selectMacro() 끝
				
				
				// 선택된 매크로 답변 내용=> 답변입력창에 띄우기
				function setMacroReview(macroNo){
					let insertValue = $("#macro_content" + macroNo).text();
					
					console.log(insertValue);
					
					$("#macro_list").modal("hide");
					$(".insert_form").val(insertValue);
					
				}// setMacroReview(macroNo) 끝
				
				
				// 매크로 답변 삭제
				function deleteMacro(macroNo){
					$.ajax({
						url:"<%=contextPath%>/deleteMac.mac",
						data:{
							no:macroNo
						},
						success:function(result){
							
							console.log(result);
							if(result > 0){
								alert("선택한 매크로답변이 성공적으로 삭제되었습니다.");
								selectMacro();
								
							}
						},
						error:function(){
							console.log("매크로 삭제용 ajax통신 실패");
						}
							
						
					})
					
				}
				
				// 리뷰 답변 등록
				function insertReview(reNo)	{
					
					let reviewValue = $("#reply_form" + reNo).val();
					
					if(reviewValue == ""){
						alert("답변 내용을 입력해주세요!");
					}else{
						
						$.ajax({
							url:"<%=contextPath%>/insert.mrv",
							method:"POST",
							data:{
								no:reNo,
								content:reviewValue
							},
							success:function(result){
								
								if(result>0){
									
									alert("리뷰 답변이 성공적으로 등록되었습니다.");
									searchKeyword(1);
									
								}
							},
							error:function(){
								console.log("리뷰답변 등록용 ajax통신 실패");
							}
						})
					
					}
					
				}// insertReview(reNo) 끝
				
			</script>
		</section>

	</main>
	<!-- End #main -->

	<%@ include file="/views/manager/common/footer.jsp"%>

</body>
</html>