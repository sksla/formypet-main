<%@page import="com.formypet.common.model.vo.PageInfo"%>
<%@page import="com.formypet.product.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<Product> list = (List<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	boolean check = (boolean)request.getAttribute("check");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록 페이지</title>
<style>
.modal.on{
	display:block;
}
</style>
</head>
<body>
	<%@ include file="/views/manager/common/header.jsp" %>
	
	<%@ include file="/views/manager/common/sidebar.jsp" %>
	
	<main id="main" class="main">

	    <div class="pagetitle">
	      <h1>이벤트 등록 페이지</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="<%=contextPath%>/index.m">홈</a>
					</li>
					<li class="breadcrumb-item">
						<a href="<%=contextPath%>/list.mev">이벤트</a>
					</li>
					<li class="breadcrumb-item active">이벤트 등록/수정</li>
				</ol>
			</nav>
		</div><!-- End Page Title -->
	
	    <section class="section">
			<div class="card">
				<div class="card-body">
					<h2 class="card-title">이벤트 등록/수정</h2>
					<!-- Vertical Form -->
					<form class="row g-3" action="<%=contextPath%>/insert.mev" method="post" enctype="multipart/form-data" onsubmit="return validate()">
						<div class="col-12 list-bar">
							<label for="eventName" class="form-label col-2 list-title">
							이벤트	명
							</label> 
							<input type="text" class="form-control" id="eventName" name="title" required>
						</div>
						<hr>

						<br>
						<br>

						<div class="col-12 list-bar">
							<label for="inputEmail4" class="form-label col-2 list-title">날짜</label>
							<div class="event">
								<div class="d-flex justify-content-start">
									<input type="date" class="form-control date" id="date_start" name="startDate" required>-
									<input type="date" class="form-control date" id="date_end" name="endDate" required>
								</div>

								<div class="d-flex justify-content-end">
									<button type="button" class="btn btn-outline-secondary" onclick="today();">오늘</button>
									<button type="button" class="btn btn-outline-secondary" onclick="threedays();">3일간</button>
									<button type="button" class="btn btn-outline-secondary" onclick="week();">일주일</button>
									<button type="button" class="btn btn-outline-secondary" onclick="month();">한달</button>
								</div>
							</div>
						</div>
						<hr>

						<br>
						<br>

						<div class="col-12 list-bar">
							<label for="inputPassword4" class="form-label col-2 list-title">
							첨부파일 등록
							</label> 
							<input class="form-control" accept="image/*" type="file" id="formFile" name="upfile2" onchange="loadImg(0);" required>
						</div>
						<hr>
						<img class="img_preview content_img" style="width: 800px; height: 500px;"> 
						
						<br>
						<br>
						<br>
						<br>

						<div class="col-12 list-bar">
							<label for="inputAddress" class="form-label col-2 list-title">
							이벤트	상품
							</label>
							<div class="event">
								<div>
									<button type="button" class="btn btn-outline-warning" data-toggle="modal" data-target="#product_list">물품등록</button>
								</div>
							</div>
						</div>
						<hr>
						<div class="d-flex justify-content-end">
							<table class="table" id="event_table">
								<thead>
									<tr>
										<td></td>
										<th>상품코드</th>
										<th>상품명</th>
										<th>가격</th>
										<th>할인율</th>
										<th>재고</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>

						<br>
						<br>

						<div class="col-12 list-bar">
							<label for="inputPassword4" class="form-label col-2 list-title">
							이벤트	노출
							</label>
							<div class="col-sm-10 event">
								<div class="d-flex justify-content-start">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="showEvent" id="show" value="Y" onchange="checkShow();" checked> 
										<label class="form-check-label" for="show"> 노출 </label>
									</div>
									<div class="form-check ms-2">
										<input class="form-check-input" type="radio" name="showEvent" id="hidden" value="N" onchange="checkShow();"> 
										<label class="form-check-label" for="hidden"> 미노출 </label>
									</div>
								</div>
							</div>
						</div>
						<hr>

						<br>
						<br>

						<div class="col-12 list-bar">
							<label for="inputPassword4" class="form-label col-2 list-title">이벤트
							썸네일
							</label> 
							<input class="form-control" accept="image/*" type="file" id="thumbnail" name="upfile1" onchange="loadImg(1);">
						</div>
						
						<hr>
						
						<img class="img_preview title_img" style="width: 600px; height: 300px;"> 
						
						<br>
						<br>
						
						<div class="d-flex justify-content-end ">
							<button type="submit" class="me-2 btn btn-primary">등록하기</button>
							<button type="reset" class="btn btn-secondary">초기화</button>
						</div>

						<script>
							function chooseFile(idx) {
								$(":file").eq(idx).click();
							}
							function loadImg(idx) {
								// idx : img요소들 중 몇번 인덱스 img요소에 미리보기 효과를 넣을 건지
								// window.event.target : 현재 change이벤트(파일선택, 파일해제)가 발생한 input type="file" 요소
								const inputFile = window.event.target;

								if (inputFile.files.length == 1) { //선택된 파일이 있을 경우 => 각 영역에 맞춰서 미리보기

									const reader = new FileReader();
									reader.readAsDataURL(inputFile.files[0]);

									reader.onload = function(e) {
										$(".img_preview").eq(idx).attr("src",
												e.target.result);
									}

								} else { //선택됐된 파일이 제거 됐을 경우 => 미리보기 했던거 안보이게
									$(".img_preview").eq(idx).attr("src", null);
								}
							}
							function checkShow(){
								console.log($("input[name='showEvent']").val());
								if($("#show").is(':checked')){
									$("#thumbnail").prop("disabled", false);
								}else{
									$("#thumbnail").prop("disabled", true);
								}
							}
							
						</script>
					</form>
					<!-- Vertical Form -->

				</div>
			</div>
		</section>
	
	  </main>
	  <!-- End #main -->
	  
	  <!-- 상품등록 모달 -->
	    <div class="modal <%if(check){ %> on <% } %> " id="product_list">
	      <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	
	          <!-- Modal Header -->
	          <div class="modal-header">
	            <h4 class="modal-title m-auto">상품 목록</h4>
	          </div>
	
	          <!-- Modal body -->
	          <div class="modal-body">
	          	<div class="card-body">
		            <table class="table" id="product_table">
		              <thead>
		                <tr>
		                  <td></td>
		                  <th>
		                    상품코드
		                  </th>
		                  <th>상품명</th>
		                  <th>가격</th>
		                  <th>할인율</th>
		                  <th>재고</th>
		                </tr>
		              </thead>
		              <tbody>
		              <%for(Product p : list){ %>
		                <tr>
		                  <td>
		                  	<input type="checkbox" class="checkbox" name="productNo" value="<%=p.getProNo() %>">
		                  </td>
		                  <td>
		                  	<%=p.getProCateCode() %>
		                  </td>
		                  <td><%=p.getProName() %></td>
		                  <td><%=p.getPrice() %>원</td>
		                  <td><input type="number" style="width: 50px;" name="discount" value="<%=p.getDiscount()%>" readonly>%</td>
		                  <td><%=p.getStock() %></td>
		                </tr>
		              <%} %>
		              </tbody>
		              <tfoot>
		              </tfoot> 
		            </table>
		            <!-- 테이블 끝 -->
		
		            <!-- 물품 페이징처리 -->
		            <nav aria-label="Page navigation example">
		            	<ul class="pagination justify-content-center">
		                <%if(pi.getCurrentPage() == 1){ %>
	                		<li class="page-item disabled">
	                			<a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a>
	                		</li>
                    	<%} else{ %>
	                		<li class="page-item">
	                			<a class="page-link" 
	                			href="<%=contextPath%>/enrollForm.mev?page=<%=pi.getCurrentPage() - 1%>&check=true" 
	                			tabindex="-1" aria-disabled="true">
	                			&lt;
	                			</a>
	                		</li>
	                	<%} %>
	                <%for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
		                <%if(p == pi.getCurrentPage()){ %>
		                	<li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
		                <%} else{ %>
		                	<li class="page-item">
		                		<a class="page-link" 
		                		href="<%=contextPath%>/enrollForm.mev?page=<%=p%>&check=true"
		                		>
		                		<%=p %>
		                		</a>
		            		</li>
	                    <%} %>
                    <%} %>
                    <%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&gt;</a></li>
                    <%} else{ %>
                    	<li class="page-item">
                    		<a class="page-link" 
                    		href="<%=contextPath%>/enrollForm.mev?page=<%=pi.getCurrentPage() + 1%>&check=true"
                    		>
                    		&gt;
                    		</a>
                    	</li>
                 	<%} %>
		            </ul>
		        </nav>
		        <!-- End Centered Pagination -->
        		</div>
	            
	          </div>
	
	          <!-- Modal footer -->
	          <div class="modal-footer">
	            <button type="button" class="btn btn-primary m-auto col" id="check_product" data-dismiss="modal" onclick="remove(); addList();">등록</button>
	            <button type="button" class="btn btn-secondary m-auto col" data-dismiss="modal" onclick="remove();">취소</button>
	          </div>
		      <script>
		      	function today(){
          			$("#date_start").val(new Date().toISOString().substring(0, 10));
          			$("#date_end").val(new Date().toISOString().substring(0, 10));
          	  	}
		      	function threedays(){
		      		const newDate = new Date();
		      		$("#date_start").val(newDate.toISOString().substring(0, 10));
		      		newDate.setDate(newDate.getDate() + 3);
		      		$("#date_end").val(newDate.toISOString().substring(0, 10));
		      	}
		      	function week(){
		      		const newDate = new Date();
		      		$("#date_start").val(newDate.toISOString().substring(0, 10));
		      		newDate.setDate(newDate.getDate() + 7);
		      		$("#date_end").val(newDate.toISOString().substring(0, 10));
		      	}
		      	function month(){
		      		const newDate = new Date();
		      		$("#date_start").val(newDate.toISOString().substring(0, 10));
		      		newDate.setMonth(newDate.getMonth() + 1);
		      		$("#date_end").val(newDate.toISOString().substring(0, 10));
		      	}
		      let list;
		      	function remove(){
					$("#product_list").removeClass('on');
				}
		      	function addList(){
		      		let product = document.getElementById('product_table');
		      		let event = document.getElementById("event_table");
		      		var newRowData = new Set(); // 새로운 테이블에 추가될 데이터를 저장하는 Set 객체

		      	    // 소스 테이블의 모든 행을 반복하여 체크된 체크박스가 있는지 확인
		      	    for (var i = product.rows.length - 1; i > 0; i--) {
		      	        var row = product.rows[i];
		      	        // 체크된 체크박스인지 확인
		      	        var checkbox = row.querySelector('.checkbox');
		      	        console.log(checkbox.checked);
		      	        if (checkbox.checked) {
		      	            var rowData = []; // 현재 행의 데이터를 저장하는 배열
		      	            // 현재 행의 데이터를 rowData 배열에 추가
		      	            for (var j = 0; j < row.cells.length; j++) {
		      	                rowData.push(row.cells[j].innerHTML.trim());
		      	            }
		      	            var rowString = rowData.join('|'); // '|'를 구분자로 사용하여 배열을 문자열로 변환

		      	            // 새로운 테이블에 추가된 데이터가 아닌 경우에만 새로운 테이블에 추가
		      	            if (!newRowData.has(rowString)) {
		      	                // 중복이 아닌 경우에만 새로운 테이블에 추가
		      	                var newRow = event.insertRow();
		      	                for (var k = 0; k < rowData.length; k++) {
		      	                    var cell = newRow.insertCell();
		      	                    cell.innerHTML = rowData[k];
		      	                }
		      	                // 새로운 테이블에 추가된 데이터를 newRowData Set 객체에 추가
		      	                newRowData.add(rowString);
		      	            }

		      	            // 체크박스 체크 해제
		      	            checkbox.checked = false;
		      	        }
		      	    }
		      	  	$("#event_table input[name='productNo']").prop("checked", true);
		      	  	$("#event_table input[name='productNo']").click(function(){return false;});
		      	  	
		      	  	$("#event_table input[name='discount']").prop("readonly", false);
		      	}
		      	
		      	function validate(){
		      		console.log($("#event_table input[name='discount']").val())
		      		if($("#event_table input[name='discount']").val() >= 1 && $("#event_table input[name='discount']").val()<= 100){
		      			return true;
		      		} else{
		      			alert("1부터 100까지 숫자만 입력가능합니다.");
		      			return false;
		      		}
		      	}
		      	
		      </script>
	
	        </div>
	      </div>
	    </div>
	
	<%@ include file="/views/manager/common/footer.jsp" %>
</body>
</html>