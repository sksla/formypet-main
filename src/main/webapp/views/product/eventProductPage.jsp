<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>   
<%@page import="com.formypet.common.model.vo.PageInfo"%>  
<%@ page import="com.formypet.product.model.vo.Product" %>
<%
    PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Product> list = (List<Product>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>header</title>
  <style>
  	#menu_e a{
	    font-weight: bold;
	    color: #ffa51f; 
	    text-shadow: 1px 1px 1px #b47920;
  	}
	.pro_pageName{
	    text-align: center;
	    padding-bottom: 50px;
	    text-shadow: 1px 1px 1px;
	}
	.category_area_dog{
	     height: 360px;
	     background-color: #ffa51f50;
	     padding-top: 40px;
	}
	.category_area_cat{
	    height: 400px;
	    background-color: #ffa51f50;
	    padding-top: 40px;
	}
	.category{
	    width: 100%;
	    padding-bottom: 30px;
	    align-items: center;
	    display: flex;
	    padding-bottom:8px;
	    padding-top: 5px;
	}
	.big_category{
	    width: 15%;
	    height: 50px;
	    text-align: center;
	    font-size: 22px;
	    color: rgb(37, 28, 28);
	    text-shadow: 1px 1px 2px rgb(136, 127, 127) ;
	}
	.category td{
	    padding: 10px;
	    text-align: left;
	    /* border-top: 1px dotted darkgray; */
	}
	
	.category_line{
	    border-top: 2px solid darkgray;
	    border-bottom: 2px solid darkgray;
	}
	.category span{
	    font-size: 13px;
	    padding-left: 3px;
	}
	.best_product{
	    display: flex;
	    justify-content: space-around;
	    border-bottom: 2px solid darkgray;
	    padding-bottom: 50px;
	 }
	
	 .product_content>div{
	    /* border: 2px solid #1ABC9C; */
	    width: 80%;
	    margin: auto;
	    /* margin-top: 50px; */
	    margin: bottom 50px; 
	    min-height: 1000px;
	    padding: 50px;
	    border-radius: 10px;
	}
	.product_main{
	    margin-top: 100px;
	}
	.category td:hover{
		cursor:pointer;
		font-weight:bolder;
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
		
	/* ------------------------ 페이징 바 ----------------------------- */
	.page-link{
	    color: darkgray;
	}
	.page-link::marker{
	    background-color: #ffa51f;
	}
	.pagination .page-item.active .page-link {
	    background-color: #ffd000; 
	    color: #fff; 
	    border-color: #f7cb07;
	}
  </style>
</head>

<body>
	<div class="wrap">

		<!--head start-->
		<%@ include file="/views/common/header.jsp"%>
		<!--head end-->

		<!--section start-->

		<section class="main_content">
			<h1 class="pro_pageName" style="padding-top:60px;">●●● EVENT ●●●</h1>
			<%if(list.isEmpty()){ %>
			<!-- 리스트가 존재하지 않았을 때 쓸 구문~ -->
			<h5>존재하는 상품이 없습니다.</h5>

			<%}else{ %>
			<div class="product_main">
				<div class="main_list">
					<%for(Product p : list){ %>
					<% if(!p.getStatus().equals("N")){ %>
					<div class="thumbnail">
					<input type="hidden" value="<%=p.getProNo() %>">
						<img class="thumbnail_img" src="<%= p.getProMainImage() %>">
						<%if(p.getStock()==0){ %>
						<div id="thumbnail_status">품절</div>
						<%}%>
						<table class="thumbnail_etc">
							<tr>
								<th colspan="4" class="product_name"><%=p.getProName() %></th>
							</tr>
							<%if(p.getStatus().equals("E")){ %>
							<tr>
								<td colspan="4" class="o_price"><s><%=p.getPrice() %></s></td>
							</tr>
							<tr>
								<td colspan="2" class="discount"><b><%=p.getDiscount() %></b>%</td>
								<td colspan="2" class="fin_price"><%=p.getPrice() - (int)((p.getPrice() * p.getDiscount()) * 0.01) %><a>
										원 </a></td>
							</tr>
							<%}else{ %>
							<tr>
								<td colspan="4" class="o_price"></td>
							</tr>
							<tr>
								<td colspan="2" class="discount"></td>
								<td colspan="2" class="fin_price"><%= p.getPrice()%><a>
										원 </a></td>
							</tr>
							<%} %>
							<tr>
								<td colspan="2" class="star">★</td>
								<!-- 도움도움 -->
								<td class="average"><%=p.getStar() %></td>
								<td class="review_count">(&nbsp<%= p.getReCount() %>&nbsp)
								</td>
							</tr>
						</table>
					</div>
					<%} %>
					<%} %>
				</div>

				<br>
				<ul class="pagination pagination-sm justify-content-center">
						<%if(pi.getCurrentPage() == 1){ %>
						<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a></li>
						<%} else{ %>
						<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.ev?&&page=<%=pi.getCurrentPage() - 1%>" tabindex="-1" aria-disabled="true">&lt;</a></li>
						<%} %>
						<%for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
			                <%if(p == pi.getCurrentPage()){ %>
							<li class="page-item"><a class="page-link" href="#"><%=p %></a></li>
							<%}else{ %>
							<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.ev?&page=<%=p%>"><%=p %></a></li>
							<%} %>
                   		 <%} %>
                   	 	<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
						<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
					 	<%} else{ %>
						 <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.ev?&&page=<%=pi.getCurrentPage() + 1%>">&gt;</a></li>
					 	<%} %>
					</ul>
				</div>
				<%} %>
				
				<script>
				 // 페이지 로드 시 현재 페이지에 해당하는 페이지 숫자의 배경색을 변경하는 함수
			    function setPageBackground() {
			        // 현재 페이지 번호 가져오기
			        var currentPage = <%= pi.getCurrentPage() %>;
			        // 페이지 숫자 요소들을 가져옴
			        var pageItems = document.querySelectorAll('.page-item');

			        // 각 페이지 숫자 요소에 대해 현재 페이지에 해당하는 요소에 active 클래스 추가
			        pageItems.forEach(function(item) {
			            if (parseInt(item.innerText) === currentPage) {
			                item.classList.add('active');
			            }
			        });
			    }

			    // 페이지 로드가 완료되면 배경색 변경 함수를 호출
			    window.onload = function() {
			        setPageBackground();
			    };
			    
			    $(function(){
			    	$(".thumbnail").click(function(){
			    		location.href = "<%=contextPath%>/detail.pro?no="+$(this).children().eq(0).val()+"&page=1";
			    	})
			    })
				</script>
		</section>


		<!--section end-->


		<!--footer start-->
		<%@ include file="/views/common/footer.jsp"%>
		<!--footer end-->

		<!--sidebar start-->
		<button id="toggleButton">></button>
		<div id="sidebar">
			<ul id="recently-viewed">
				<li><a href="#">ìí 1</a></li>
				<li><a href="#">ìí 2</a></li>
				<li><a href="#">ìí 3</a></li>
				<li><a href="#">ìí 4</a></li>
				<li><a href="#">ìí 5</a></li>
			</ul>
			<h4>최근 본 상품</h4>
		</div>

		<script>
      const toggleButton = document.getElementById('toggleButton');
      const sidebar = document.getElementById('sidebar');

      toggleButton.addEventListener('click', function () {
        const currentRight = parseInt(getComputedStyle(sidebar).right);

        if (currentRight < 0) {
          sidebar.style.right = '0';
        } else {
          sidebar.style.right = '-250px';
        }
      });
    </script>
		</nav>
		<!--sidebar end-->
	</div>




	</div>

</body>

</html>