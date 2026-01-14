<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 등록</title>
</head>
<body>
	<%@ include file="/views/manager/common/header.jsp" %>
	
	<%@ include file="/views/manager/common/sidebar.jsp" %>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>상품 등록</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=contextPath%>/index.m">홈</a></li>
					<li class="breadcrumb-item">
						<a href="<%=contextPath%>/list.mpro?page=1">상품조회</a></li>
					<li class="breadcrumb-item active">상품등록</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col">
					<div class="card">
						<div class="card-title">상품등록</div>
						<form action="<%=contextPath%>/insert.mpro" method="post" enctype="multipart/form-data">
							<div class="product-bar">
								<div class="product-img d-flex justify-content-center">
									<img class="img_preview" style="width: 80%">
								</div>
								<div class="col" style="margin: auto">
									<table class="product-info">
										<tr>
											<th>상품명</th>
											<td><input type="text" class="form-control" name="title" required></td>
										</tr>
										<tr>
											<th>상품코드</th>
											<td class="d-flex">
												<select id="cate_code" class="form-select me-2" name="cate" onchange="changeList();">
													<option value="A" selected>공통</option>
													<option value="C">고양이</option>
													<option value="D">강아지</option>
												</select>
												<select id="midd_code" class="form-select" name="midd">
													<option value="1" selected>사료</option>
													<option value="2">간식</option>
													<option value="3">용품</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>가격</th>
											<td><input type="text" class="form-control" name="price" required></td>
										</tr>
										<tr>
											<th>할인율</th>
											<td><input type="text" class="form-control" placeholder="이벤트상품만 입력 가능합니다." name="discount" readonly></td>
										</tr>
										<tr>
											<th>재고</th>
											<td><input type="text" class="form-control" name="stock" value="0" readonly></td>
										</tr>
										<tr id="add_list">
											<th>키워드</th>
											<td id="select_list">
												<select id="inputState" class="form-select me-2" name="keyword">
													<optgroup label="간식">
														<option value="전체">전체</option>
														<option value="뼈간식">뼈간식</option>
														<option value="껌">껌</option>
														<option value="저키">저키</option>
														<option value="간식캔">간식캔</option>
														<option value="캣닢">캣닢</option>
														<option value="추르">추르</option>
														<option value="트릿">트릿</option>
														<option value="저키">저키</option>
														<option value="음료">음료</option>
														<option value="영양/기능">영양/기능</option>
														<option value="처방식">처방식</option>
														<option value="수제간식">수제간식</option>
													</optgroup>
													<optgroup label="용품">
														<option value="노즈워크">노즈워크</option>
														<option value="모래">모래</option>
														<option value="캣타워/휠">캣타워/휠</option>
														<option value="위생용품">위생용품</option>
														<option value="미용/관리">미용/관리</option>
														<option value="산책용품">산책용품</option>
														<option value="장난감">장난감</option>
														<option value="스크래쳐">스크래쳐</option>
														<option value="배변용품">배변용품</option>
														<option value="의류/악세사리">의류/악세사리</option>
														<option value="생활용품">생활용품</option>
														<option value="급식기/급수기">급식기/급수기</option>
														<option value="기타">기타</option>
													</optgroup>
											</select>
											</td>
											<td><button type="button" id="product_code" class="btn btn-outline-secondary">+</button></td>
										</tr>
									</table>
								</div>
							</div>
							<!-- 이미지 상품정보 입력 div -->
							<div class="product-img d-flex justify-content-end mt-3">
								<label for="file" class="btn btn-outline-secondary me-5">파일선택</label> 
									<input type="file" accept="image/*" name="upfile1" id="file" style="display: none;" onchange="loadImg(0);" required>
							</div>
							<!-- 이미지 등록 버튼 -->
							<div class="ms-5">
								상품상세 이미지 <input name="upfile2" class="form-control product-img" type="file" id="formFile" style="width: 40%;">
							</div>
							<!-- 상품상세 이미지 -->
							<div class="d-flex justify-content-end me-5 mb-5">
								<button type="submit" class="btn btn-secondary event-btn">등록하기</button>
							</div>
							<!-- 등록하기 버튼 -->
							<script>
								var count = 1;
								/* 삭제버튼 상품 코드 테이블 지우기 */
								$(document).on('click', "[id='delBtn']", function(){
									var tr = $(this).parent().parent();
									tr.remove();
								});
								$(function(){
									/* 상품코드 테이블 추가 */
									$("#product_code").click(function(){
										let code = $("#cate_code").val();
										
										if(code == "D"){
											var tr = '<tr id="add_list">'
												   + '<th>키워드</th>'
												   + '<td id="select_list">'
												   + '<select id="inputState" class="form-select me-2" name="keyword">'
												   + '<optgroup label="사료">'
												   + '<option value="퍼피" selected>퍼피</option>'
												   + '<option value="어덜트">어덜트</option>'
												   + '<option value="시니어">시니어</option>'
												   + '<option value="전연령">전연령</option>'
												   + '<option value="건식사료">건식사료</option>'
												   + '<option value="에어/동결사료">에어/동결사료</option>'
												   + '<option value="습식사료">습식사료</option>'
												   + '</optgroup>'
												   + '<optgroup label="간식">'
												   + '<option value="전체">전체</option>'
												   + '<option value="뼈간식">뼈간식</option>'
												   + '<option value="껌">껌</option>'
												   + '<option value="저키">저키</option>'
												   + '<option value="음료">음료</option>'
												   + '<option value="영양/기능">영양/기능</option>'
												   + '<option value="처방식">처방식</option>'
												   + '<option value="수제간식">수제간식</option>'
												   + '</optgroup>'
												   + '<optgroup label="용품">'
												   + '<option value="배변용품">배변용품</option>'
												   + '<option value="위생용품">위생용품</option>'
												   + '<option value="미용/관리">미용/관리</option>'
												   + '<option value="산책용품">산책용품</option>'
												   + '<option value="훈련용품">훈련용품</option>'
												   + '<option value="장난감">장난감</option>'
												   + '<option value="노즈워크">노즈워크</option>'
												   + '<option value="의류/악세사리">의류/악세사리</option>'
												   + '<option value="생활용품">생활용품</option>'
												   + '<option value="급식기/급수기">급식기/급수기</option>'
												   + '<option value="기타">기타</option>'
												   + '</optgroup>'
												   + '</select>'
												   + '</td>'
												   + '<td><button type="button" id="delBtn" class="btn btn-outline-danger" onclick="delBtn();">-</button></td>'
												   + '</tr>';
											$("#add_list").after(tr);
												   
										} else if(code == "C"){
											console.log("고양이");
											var tr = '<tr id="add_list">'
												   + '<th>키워드</th>'
												   + '<td id="select_list">'
												   + '<select id="inputState" class="form-select me-2" name="keyword">'
												   + '<optgroup label="사료">'
												   + '<option value="키튼" selected>키튼</option>'
												   + '<option value="어덜트">어덜트</option>'
												   + '<option value="시니어">시니어</option>'
												   + '<option value="전연령">전연령</option>'
												   + '<option value="건식사료">건식사료</option>'
												   + '<option value="에어/동결사료">에어/동결사료</option>'
												   + '<option value="주식캔">주식캔</option>'
												   + '</optgroup>'
												   + '<optgroup label="간식">'
												   + '<option value="전체">전체</option>'
												   + '<option value="간식캔">간식캔</option>'
												   + '<option value="캣닢">캣닢</option>'
												   + '<option value="추르">추르</option>'
												   + '<option value="트릿">트릿</option>'
												   + '<option value="저키">저키</option>'
												   + '<option value="음료">음료</option>'
												   + '<option value="영양/기능">영양/기능</option>'
												   + '<option value="처방식">처방식</option>'
												   + '<option value="수제간식">수제간식</option>'
												   + '</optgroup>'
												   + '<optgroup label="용품">'
												   + '<option value="모래">모래</option>'
												   + '<option value="위생용품">위생용품</option>'
												   + '<option value="미용/관리">미용/관리</option>'
												   + '<option value="산책용품">산책용품</option>'
												   + '<option value="캣타워/휠">캣타워/휠</option>'
												   + '<option value="장난감">장난감</option>'
												   + '<option value="스크래쳐">스크래쳐</option>'
												   + '<option value="배변용품">배변용품</option>'
												   + '<option value="의류/악세사리">의류/악세사리</option>'
												   + '<option value="생활용품">생활용품</option>'
												   + '<option value="급식기/급수기">급식기/급수기</option>'
												   + '<option value="기타">기타</option>'
												   + '</optgroup>'
												   + '</select>'
												   + '</td>'
												   + '<td><button type="button" id="delBtn" class="btn btn-outline-danger" onclick="delBtn();">-</button></td>'
												   + '</tr>';
											$("#add_list").after(tr);
										} else{
											var tr = '<tr id="add_list">'
												   + '<th>키워드</th>'
												   + '<td id="select_list">'
												   + '<select id="inputState" class="form-select me-2" name="keyword">'
												   + '<optgroup label="간식">'
												   + '<option value="전체">전체</option>'
												   + '<option value="뼈간식">뼈간식</option>'
												   + '<option value="껌">껌</option>'
												   + '<option value="저키">저키</option>'
												   + '<option value="간식캔">간식캔</option>'
												   + '<option value="캣닢">캣닢</option>'
												   + '<option value="추르">추르</option>'
												   + '<option value="트릿">트릿</option>'
												   + '<option value="저키">저키</option>'
												   + '<option value="음료">음료</option>'
												   + '<option value="영양/기능">영양/기능</option>'
												   + '<option value="처방식">처방식</option>'
												   + '<option value="수제간식">수제간식</option>'
												   + '</optgroup>'
												   + '<optgroup label="용품">'
												   + '<option value="노즈워크">노즈워크</option>'
												   + '<option value="모래">모래</option>'
												   + '<option value="캣타워/휠">캣타워/휠</option>'
												   + '<option value="위생용품">위생용품</option>'
												   + '<option value="미용/관리">미용/관리</option>'
												   + '<option value="산책용품">산책용품</option>'
												   + '<option value="장난감">장난감</option>'
												   + '<option value="스크래쳐">스크래쳐</option>'
												   + '<option value="배변용품">배변용품</option>'
												   + '<option value="의류/악세사리">의류/악세사리</option>'
												   + '<option value="생활용품">생활용품</option>'
												   + '<option value="급식기/급수기">급식기/급수기</option>'
												   + '<option value="기타">기타</option>'
												   + '</optgroup>'
												   + '</select>'
												   + '</td>'
												   + '<td><button type="button" id="delBtn" class="btn btn-outline-danger" onclick="delBtn();">-</button></td>'
												   + '</tr>';
											$("#add_list").after(tr);
										}
									})
									
								});
								
								
								
								function changeList(){
									let code = $("#cate_code").val();
									
									console.log(code);
									
									if(code == "D"){
										console.log("강아지");
										var tr = '<select id="inputState" class="form-select me-2" name="keyword">'
											   + '<optgroup label="사료">'
											   + '<option value="퍼피" selected>퍼피</option>'
											   + '<option value="어덜트">어덜트</option>'
											   + '<option value="시니어">시니어</option>'
											   + '<option value="전연령">전연령</option>'
											   + '<option value="건식사료">건식사료</option>'
											   + '<option value="에어/동결사료">에어/동결사료</option>'
											   + '<option value="습식사료">습식사료</option>'
											   + '</optgroup>'
											   + '<optgroup label="간식">'
											   + '<option value="전체">전체</option>'
											   + '<option value="뼈간식">뼈간식</option>'
											   + '<option value="껌">껌</option>'
											   + '<option value="저키">저키</option>'
											   + '<option value="음료">음료</option>'
											   + '<option value="영양/기능">영양/기능</option>'
											   + '<option value="처방식">처방식</option>'
											   + '<option value="수제간식">수제간식</option>'
											   + '</optgroup>'
											   + '<optgroup label="용품">'
											   + '<option value="배변용품">배변용품</option>'
											   + '<option value="위생용품">위생용품</option>'
											   + '<option value="미용/관리">미용/관리</option>'
											   + '<option value="산책용품">산책용품</option>'
											   + '<option value="훈련용품">훈련용품</option>'
											   + '<option value="장난감">장난감</option>'
											   + '<option value="노즈워크">노즈워크</option>'
											   + '<option value="의류/악세사리">의류/악세사리</option>'
											   + '<option value="생활용품">생활용품</option>'
											   + '<option value="급식기/급수기">급식기/급수기</option>'
											   + '<option value="기타">기타</option>'
											   + '</optgroup>'
											   + '</select>'
										$("#add_list>#select_list").html(tr);
											   
									} else if(code == "C"){
										console.log("고양이");
										var tr = '<select id="inputState" class="form-select me-2" name="keyword">'
											   + '<optgroup label="사료">'
											   + '<option value="키튼" selected>키튼</option>'
											   + '<option value="어덜트">어덜트</option>'
											   + '<option value="시니어">시니어</option>'
											   + '<option value="전연령">전연령</option>'
											   + '<option value="건식사료">건식사료</option>'
											   + '<option value="에어/동결사료">에어/동결사료</option>'
											   + '<option value="주식캔">주식캔</option>'
											   + '</optgroup>'
											   + '<optgroup label="간식">'
											   + '<option value="전체">전체</option>'
											   + '<option value="간식캔">간식캔</option>'
											   + '<option value="캣닢">캣닢</option>'
											   + '<option value="추르">추르</option>'
											   + '<option value="트릿">트릿</option>'
											   + '<option value="저키">저키</option>'
											   + '<option value="음료">음료</option>'
											   + '<option value="영양/기능">영양/기능</option>'
											   + '<option value="처방식">처방식</option>'
											   + '<option value="수제간식">수제간식</option>'
											   + '</optgroup>'
											   + '<optgroup label="용품">'
											   + '<option value="모래">모래</option>'
											   + '<option value="위생용품">위생용품</option>'
											   + '<option value="미용/관리">미용/관리</option>'
											   + '<option value="산책용품">산책용품</option>'
											   + '<option value="캣타워/휠">캣타워/휠</option>'
											   + '<option value="장난감">장난감</option>'
											   + '<option value="스크래쳐">스크래쳐</option>'
											   + '<option value="배변용품">배변용품</option>'
											   + '<option value="의류/악세사리">의류/악세사리</option>'
											   + '<option value="생활용품">생활용품</option>'
											   + '<option value="급식기/급수기">급식기/급수기</option>'
											   + '<option value="기타">기타</option>'
											   + '</optgroup>'
											   + '</select>'
										$("#add_list>#select_list").html(tr);
									} else{
										var tr = '<select id="inputState" class="form-select me-2" name="keyword">'
											   + '<optgroup label="간식">'
											   + '<option value="전체">전체</option>'
											   + '<option value="뼈간식">뼈간식</option>'
											   + '<option value="껌">껌</option>'
											   + '<option value="저키">저키</option>'
											   + '<option value="간식캔">간식캔</option>'
											   + '<option value="캣닢">캣닢</option>'
											   + '<option value="추르">추르</option>'
											   + '<option value="트릿">트릿</option>'
											   + '<option value="저키">저키</option>'
											   + '<option value="음료">음료</option>'
											   + '<option value="영양/기능">영양/기능</option>'
											   + '<option value="처방식">처방식</option>'
											   + '<option value="수제간식">수제간식</option>'
											   + '</optgroup>'
											   + '<optgroup label="용품">'
											   + '<option value="노즈워크">노즈워크</option>'
											   + '<option value="모래">모래</option>'
											   + '<option value="캣타워/휠">캣타워/휠</option>'
											   + '<option value="위생용품">위생용품</option>'
											   + '<option value="미용/관리">미용/관리</option>'
											   + '<option value="산책용품">산책용품</option>'
											   + '<option value="장난감">장난감</option>'
											   + '<option value="스크래쳐">스크래쳐</option>'
											   + '<option value="배변용품">배변용품</option>'
											   + '<option value="의류/악세사리">의류/악세사리</option>'
											   + '<option value="생활용품">생활용품</option>'
											   + '<option value="급식기/급수기">급식기/급수기</option>'
											   + '<option value="기타">기타</option>'
											   + '</optgroup>'
											   + '</select>'
										$("#add_list>#select_list").html(tr);
									}
								}
								function loadImg(idx) {
									// idx : img요소들 중 몇번 인덱스 img요소에 미리보기 효과를 넣을 건지
									// window.event.target : 현재 change이벤트(파일선택, 파일해제)가 발생한 input type="file" 요소
									const inputFile = window.event.target;

									if (inputFile.files.length == 1) { //선택된 파일이 있을 경우 => 각 영역에 맞춰서 미리보기

										const reader = new FileReader();
										reader
												.readAsDataURL(inputFile.files[0]);

										reader.onload = function(e) {
											$(".img_preview").eq(idx).attr(
													"src", e.target.result);
										}

									} else { //선택됐된 파일이 제거 됐을 경우 => 미리보기 했던거 안보이게
										$(".img_preview").eq(idx).attr("src",
												null);
									}
								}
							</script>
						</form>
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<%@ include file="/views/manager/common/footer.jsp" %>
</body>
</html>