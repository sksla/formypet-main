<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<%@ include file="/views/manager/common/header.jsp" %>
	
	<%@ include file="/views/manager/common/sidebar.jsp" %>
	<main id="main" class="main">

	    <div class="pagetitle">
	      <h1>관리자 페이지</h1>
	      <nav>
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item"><a href="index.html">홈</a></li>
	          <li class="breadcrumb-item active">대시보드</li>
	        </ol>
	      </nav>
	    </div><!-- End Page Title -->
	
	    <section class="section dashboard">
	      <div class="row">
	
	        <!-- Left side columns -->
	        <div class="col-lg">
	          <div class="row">
	            
	            <!-- Sales Card -->
	            <div class="col-xxl-3 col-md-6">
	              <div class="card info-card sales-card">
	                <div class="card-body">
	                  <h5 class="card-title">품절 상품 <span>| Now</span></h5>
	
	                  <div class="d-flex align-items-center">
	                    <div class="card-icon rounded d-flex align-items-center justify-content-center"><!--아이콘 뒤 원-->
	                    </div>
	                    <div class="ps-3 card-icon-detail">
	                      <h6 id="soldOutProCount">145</h6>
	                      <span class="text-success small pt-1 fw-bold"></span> <span class="text-muted small pt-2 ps-1">개</span>
	
	                    </div>
	                  </div>
	                </div>
	
	              </div>
	            </div><!-- End Sales Card -->
	
	            <!-- Sales Card -->
	            <div class="col-xxl-3 col-md-6">
	              <div class="card info-card sales-card">
	                <div class="card-body">
	                  <h5 class="card-title">신규가입 회원<span>| Today</span></h5>
	
	                  <div class="d-flex align-items-center">
	                    <div class="card-icon rounded d-flex align-items-center justify-content-center"><!--아이콘 뒤 원-->
	                    </div>
	                    <div class="ps-3 card-icon-detail">
	                      <h6 id="newMemCount">145</h6>
	                      <span class="text-success small pt-1 fw-bold"></span> <span class="text-muted small pt-2 ps-1">명</span>
	
	                    </div>
	                  </div>
	                </div>
	
	              </div>
	            </div><!-- End Sales Card -->
	            
	             <!-- Sales Card -->
	            <div class="col-xxl-3 col-md-6">
	              <div class="card info-card sales-card">
	                <div class="card-body">
	                  <h5 class="card-title">새 문의 <span>| Today</span></h5>
	
	                  <div class="d-flex align-items-center">
	                    <div class="card-icon rounded d-flex align-items-center justify-content-center"><!--아이콘 뒤 원-->
	                    </div>
	                    <div class="ps-3 card-icon-detail">
	                      <h6 id="newQnaCount">145</h6>
	                      <span class="text-success small pt-1 fw-bold"></span> <span class="text-muted small pt-2 ps-1">개</span>
	
	                    </div>
	                  </div>
	                </div>
	
	              </div>
	            </div><!-- End Sales Card -->
	            
	            <!-- Sales Card -->
	            <div class="col-xxl-3 col-md-6">
	              <div class="card info-card sales-card">
	                <div class="card-body">
	                  <h5 class="card-title">고객센터 관리<span></span></h5>
	
	                  <div class="d-flex align-items-center">
	                    <div class="card-icon rounded d-flex align-items-center justify-content-center"><!--아이콘 뒤 원-->
	                    </div>
	                    <div class="ps-3 card-icon-detail">
	                      <h6><a href="<%=contextPath%>/list.mqa">1:1 문의 관리</a></h6>
	                      <span class="text-success small pt-1 fw-bold"></span> <span class="text-muted small pt-2 ps-1"></span>
	
	                    </div>
	                  </div>
	                </div>
	
	              </div>
	            </div><!-- End Sales Card -->
	
	            <!-- Top Selling -->
	            <div class="col-9">
	              <div class="card top-selling overflow-auto" style="height: 500px;">
	                <div class="card-body pb-1">
	                  <h5 class="card-title">판매량 순위 <span>| Today</span></h5>
	
	                  <table class="table table-borderless" id="TopSale5">
	                    <thead>
	                      <tr>
	                      	<th scope="col">순위</th>
	                        <th scope="col">미리보기</th>
	                        <th scope="col">상품명</th>
	                        <th scope="col">가격</th>
	                        <th scope="col">판매량</th>
	                        <th scope="col">수익</th>
	                      </tr>
	                    </thead>
	                    <tbody>
	                      
	                    </tbody>
	                  </table>
	
	                </div>
	
	              </div>
	            </div><!-- End Top Selling -->
	            <!-- Sales Card -->
	            <div class="col-xxl-3 col-md-6">
	              <div class="card info-card sales-card">
	
	                
	
	                <div class="card-body" style="height:500px;">
	                  <h5 class="card-title display-4">게시판 관리<span></span></h5>
					  
	                  <div class="d-flex align-items-center">
	                    <div class="card-icon rounded d-flex align-items-center justify-content-center"><!--아이콘 뒤 원-->
	                    </div>
	                    <div class="ps-3 card-icon-detail">
	                      <h6><a href="<%=contextPath%>/list.mbo">게시글 관리</a></h6>
	                      <span class="text-success small pt-1 fw-bold"></span> 
	                      <span class="text-muted small pt-2 ps-1"></span>
	
	                    </div>
	                  </div>
	                  
	                  <br>
	                  
	                  <div class="d-flex align-items-center">
	                    <div class="card-icon rounded d-flex align-items-center justify-content-center"><!--아이콘 뒤 원-->
	                    </div>
	                    <div class="ps-3 card-icon-detail">
	                      <h6><a href="<%=contextPath%>/list.mre">댓글 관리</a></h6>
	                      <span class="text-success small pt-1 fw-bold"></span> 
	                      <span class="text-muted small pt-2 ps-1"></span>
	
	                    </div>
	                  </div>
	                  
	                  <br>
	                  
	                  <div class="d-flex align-items-center">
	                    <div class="card-icon rounded d-flex align-items-center justify-content-center"><!--아이콘 뒤 원-->
	                    </div>
	                    <div class="ps-3 card-icon-detail">
	                      <h6><a href="<%=contextPath%>/list.mrv">리뷰글 관리</a></h6>
	                      <span class="text-success small pt-1 fw-bold"></span> 
	                      <span class="text-muted small pt-2 ps-1"></span>
	
	                    </div>
	                  </div>
	                </div>
	
	              </div>
	            </div><!-- End Sales Card -->
	            <!-- Sales Card -->
	            <div class="col-xxl-4 col-md-6">
	              <div class="card info-card sales-card">
	                <div class="card-body">
	                  <h5 class="card-title"><a href="<%=contextPath%>/list.mm?page=1">회원 조회</a></h5>
	                </div>
	              </div>
	            </div>
	            <!-- End Sales Card -->
	            
	            <!-- Sales Card -->
	            <div class="col-xxl-4 col-md-6">
	              <div class="card info-card sales-card">
	                <div class="card-body">
	                  <h5 class="card-title"><a href="<%=contextPath%>/list.msto?page=1">재고 관리</a></h5>
	                </div>
	              </div>
	            </div>
	            <!-- End Sales Card -->
	
	            <!-- Sales Card -->
	            <div class="col-xxl-4 col-md-6">
	              <div class="card info-card sales-card">
	                <div class="card-body">
	                  <h5 class="card-title"><a href="<%=contextPath%>/list.mev?page=1">이벤트 관리</a></h5>
	                </div>
	              </div>
	            </div><!-- End Sales Card -->
	
	          </div>
	        </div><!-- End Left side columns -->
	        
	        <script>
	        
	        $(function(){
	        	
	        	selectTodayData();
	        	
	        })
	        
	        function selectTodayData(){
	        	
	        	$.ajax({
	        		url:"<%=contextPath%>/input.md",
	        		data:{},
	        		success:function(result){
	        			console.log(result);
	        			
	        			let soCount = result.soCount;
	        			let nmCount = result.nmCount;
	        			let nqCount = result.nqCount;
	        			let list = result.list;
	        			
	        			$("#soldOutProCount").text(soCount);
	        			$("#newMemCount").text(nmCount);
	        			$("#newQnaCount").text(nqCount);
	        			
	        			
		        		let value ="";
	        			
		        		if(list.length > 0){
	        				
	        				for(let i=0; i<5; i++){
	        					
	        					let hm = list[i];
	        					let rank = list[i].rank;
	        					let proName = list[i].proName;
	        					let proMainImage = list[i].proMainImage;
	        					let totalSale = list[i].totalSale.toLocaleString();
	        					let price = list[i].price.toLocaleString();
	        					let totalPrice = (list[i].price * list[i].totalSale).toLocaleString(); 
	        					
	        					value += "<tr>"
	        					       + 	"<td>" + rank + "</td>"
	        					       +	"<th scope='row'><img src='" + proMainImage + "' alt='" + proName + "대표이미지'></th>"
	        					       +	"<td class='text-primary fw-bold'>" + proName + "</td>"
	        					       + 	"<td>" + price + "원</td>"
	        					       +	"<td class='fw-bold'>" + totalSale +"</td>"
	        					       +	"<td>" + totalPrice + "원</td>"
	        					       + "</tr>";
	        					
	        				}
	        				
	        			}else{
	        				value += "<tr><td cospan='6' style='text-align:center;'>조회된 결과가 없습니다</td></tr>";
	        			}
	        			
	        			
                        $("#TopSale5 tbody").html(value);
	        			
	        			
	        		},
	        		error:function(){
	        			console.log("데이터 뿌리기 용 ajax통신 실패");
	        		}
	        		
	        	})
	        }
	        
	        </script>
	
	      </div>
	    </section>
	
	  </main>
	  <!-- End #main -->
	<%@ include file="/views/manager/common/footer.jsp" %>
</body>
</html>