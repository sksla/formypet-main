<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>   
<%@ page import="com.formypet.product.model.vo.Product" %>

<%
	List<Product> list = (List<Product>)request.getAttribute("list");
	String kind = (String)request.getAttribute("kind");
%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>메인페이지</title>
<style>
    .search_area{
        display: flex;
        justify-content: center; /* 수평 가운데 정렬 */
    }
    .return_search{
        color: lightgray;
        font-size: small;
        display: flex;
        justify-content: center;
        padding-top: 20px;
    }

    .search_cate{
        width: 80px;
        height: 35px;
    }
    .search_keyword{
        width: 500px;
        height: 35px;
        margin-left: 10px;
    }
    .search_btn{
        width: 80px;
        height: 35px;
        margin-left: 10px;
    }
    .search_result {
        display: flex;
        justify-content: center; /* 수평 가운데 정렬 */
    }
    .result_bar{
        width: 100%;
        background-color: lightgray;
        text-align: center;
        color: white;
        font-size: small;
        /* font-weight: bold; */
    }
    /* 상품 품절일 때 스타일 */
	#thumbnail_status{
	    width: 240px;
	    height: 50px;
	    background-color: rgba(95, 95, 95, 0.600);
	    color: white;
	    text-align: center;
	    position: absolute;
	    top: 200px;
	    z-index: 10;
	    font-size: 30px;
	    font-weight: bolder;
	}
    
</style>
</head>

<body>

	<div class="wrap">

		<%@ include file="/views/common/header.jsp"%>


		<!--section start-->
		<section class="main_content">

			<div class="search_content">
				<div class="search_area">
					<%if(kind.equals("D")){ %>
					<img src="<%= request.getContextPath() %>/resources/images/dog2.png" style="height:45px;">
					<%}else{ %>
					<img src="<%= request.getContextPath() %>/resources/images/cat1.png" style="height:45px;">
					<%} %>
					<select name="mid_category" class="search_cate">
						<option value="0">전체</option>
						<option value="1">사료</option>
						<option value="2">간식</option>
						<option value="3">용품</option>
					</select> 
					<input class="search_keyword" type="text" placeholder="검색할 키워드를 입력하세요.">
					<button class="search_btn">검색</button>
				</div>
				<a class="return_search" href="<%=contextPath%>/search.do">< 카테고리 다시 선택하기</a> <br>
				<br>
				<br>
				<br>

				<div clss="search_result">
					<div class="result_bar">조회 결과</div>
					<div class="result_list main_list"></div>
				</div>

			</div>

		</section>
		
		<script>
		$(function(){
			$(".search_btn").click(function(){
		 		// mid_category의 선택된 값
		        var cate = $(".search_cate").val();
				
		        // search_keyword의 입력된 값
		        var keyword = $(".search_keyword").val();
		        
		        $.ajax({
		        	url:"<%=contextPath%>/search.re",
		        	data:{
		        		kind: '<%=kind%>',
		        		cate: cate,
		        		keyword:keyword
		        	},
		        	success:function(list){
		        		let value = "";
		        		if(list.length == 0){
		        			value += "조회된 상품이 없습니다.";
		        		}else{
		        			for (let i = 0; i <list.length; i++) {
								const p = list[i];
								if(p.status!=="N"){ 
									value += "<div class='thumbnail'>"
										  + "<input type='hidden' value='"+p.proNo+"'>"
										  + "<img class='thumbnail_img' src='"+p.proMainImage+"'>";
									if (p.stock == 0) {
										value += "<div id='thumbnail_status'>품절</div>";
									}
									value += "<table class='thumbnail_etc'>"
											+ "<tr><th colspan='4' class='product_name'>"
											+ p.proName
											+ "</th></tr>";
									if (p.status === "E") {
										value += "<tr><td colspan='4' class='o_price'><s>"
												+ p.price
												+ "</s></td></tr>"
												+ "<tr><td colspan='2' class='discount'><b>"
												+ p.discount
												+ "</b>%</td>"
												+ "<td colspan='2' class='fin_price'>"
												+ (p.price - parseInt((p.price * p.discount) * 0.01))
												+ "<a> 원 </a></td></tr>";
									} else {
										value += "<tr><td colspan='4' class='o_price'></td></tr>"
												+ "<tr><td colspan='2' class='discount'></td>"
												+ "<td colspan='2' class='fin_price'>"
												+ p.price
												+ "<a> 원 </a></td></tr>";
									}
									value += "<tr><td colspan='2' class='star'>★</td><td class='average'>"
											+ p.star
											+ "</td><td class='review_count'>(&nbsp"
											+ p.reCount
											+ "&nbsp)</td></tr>"
											+ "</table></div></div>";
								}
							}
		        		}
	        			$(".result_list").html(value);
						$(".thumbnail").click(function(){
					    		location.href = "<%=contextPath%>/detail.pro?no="+$(this).children().eq(0).val()+"&page=1";
					    	})
		        	},error:function(){
		        		
		        	}
		        
		        })
			})
		})
		</script>
		<!--section end-->


		<%@ include file="/views/common/footer.jsp"%>

	</div>



</body>

</html>