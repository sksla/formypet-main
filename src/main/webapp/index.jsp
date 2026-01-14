<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>   
<%@ page import="com.formypet.product.model.vo.Product" %>
<%@ page import="com.formypet.event.model.vo.*" %>

<%
	List<Product> list = (List<Product>)request.getAttribute("list");
	/* List<Event> elist = (List<Event>)request.getAttribute("elist"); */
	Event ev = (Event)request.getAttribute("ev");
	
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
	.list_more{
    float: right;
    background: #ffa51f;
    font-weight: bold;
    border-radius: 20px; /* 둥글게 만들기 */
    border: none; /* 테두리 없애기 */
    width:70px;
    text-align:center;
	}
	.list_more a{
    color: whitesmoke;
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

		<div id="ev_content" class="carousel slide" data-ride="carousel">
		<!-- 이벤트 배너 띄우기 -->
		</div>

		<!--section start-->
		<section class="main_content">


			<div class="best_content">
				<h1 class="main_h1">BEST</h1>
				<div class="main_list best_list">
				<!-- 베스트 상품 띄우기 -->
					
			</div>
				<div class="list_more"><a href="<%=contextPath %>/list.best" type="button">More ></a></div>
			</div>
	</div>
	

	</section>
	<section class="main_content">

		<div class="event_content">
			<h1 class="main_h1">EVENT</h1>
			<div class="main_list event_list">
				<!-- 이벤트 상품 띄우기 -->
					
			</div>
			<div class="list_more"><a href="<%=contextPath %>/list.ev?page=1" type="button">More ></a></div>
			<br> <br> <br>


		</div>
		</div>
		<script>
			$(function(){
				$.ajax({
		    	    url: "<%=contextPath%>/detail.ev",
		    	    success:function(list) {
		    	    	console.log(list);
		    	        let value="";
		    	        let count1 = 0;
		    	        let count2 = 0;
		    	        if(!list.isEmpty) {
		    	            value += "<div id='ev_banner' class='carousel slide' data-ride='carousel'>"
		    	                  + "<ul class='carousel-indicators'>";
			    	        for(let i = 0; i < list.length; i++) {
			    	            value += "<li data-target='#ev_banner' data-slide-to='"+ count1 +"' class='"+(count1==0 ? "active" : "")+"'></li>";
			    	            count1++;
			    	            }
		    	            value += "</ul>"
		    	            + "<div class='carousel-inner'>";
		    	              
	    	                for(let j = 0; j <list.length; j++) {
		    	             const e = list[j]; 
		    	             console.log(e);
	    	                    value += "<div class='carousel-item "+(count2==0 ? "active" : "")+"'>"
	    	                          + "<input type='hidden' value='"+e.eventNo+"'>"
	    	                          + "<img style='height:800px; object-fit:contain;' src='"+ e.eventMainImgPath+"'></div>";
	    	                          count2++;
		    	                }
		    	                
		    	                value += "</div><a class='carousel-control-prev' href='#ev_banner' data-slide='prev'>"
		    	                      + "<span class='carousel-control-prev-icon'></span></a>"
		    	                      + "<a class='carousel-control-next' href='#ev_banner' data-slide='next'>"
		    	                      + "<span class='carousel-control-next-icon'></span></a>";

		    	            }
		    	        console.log(value);
			    	        $("#ev_content").html(value);
		    	        $(".carousel-item").click(function() {
		    	            location.href = "<%=contextPath%>/detail.e?no="+$(this).children().eq(0).val();
		    	        });
		    	     
		    	    }
		    	});
				
				
				
				$(".thumbnail").click(function(){
		    		location.href = "<%=contextPath%>/detail.pro?no="+$(this).children().eq(0).val()+"&page=1";
		    	})
		    	
		    	
		    	$.ajax({
			    	url:"<%=contextPath%>/main.b",
			    	success:function(list){
			    		let value="";
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
		        		
	        			$(".best_list").html(value);
						$(".thumbnail").click(function(){
					    		location.href = "<%=contextPath%>/detail.pro?no="+$(this).children().eq(0).val()+"&page=1";
					    	})
			    	},error:function(list){}
		    	});
		    	
		    	$.ajax({
			    	url:"<%=contextPath%>/main.e",
			    	success:function(list){
			    		let value="";
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
		        		
	        			$(".event_list").html(value);
						$(".thumbnail").click(function(){
					    		location.href = "<%=contextPath%>/detail.pro?no="+$(this).children().eq(0).val()+"&page=1";
					    	})
			    	}
		    	})
		    	
		    	
		    })

		    
		</script>



	</section>
	<!--section end-->


	<%@ include file="/views/common/footer.jsp"%>

	</div>



</body>

</html>