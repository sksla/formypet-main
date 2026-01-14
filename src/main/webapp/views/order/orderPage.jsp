<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,java.text.NumberFormat,java.util.Locale" %>  
<%@page import="com.formypet.common.model.vo.PageInfo"%>  
<%@ page import="com.formypet.product.model.vo.Product" %>
<%
	Product p = (Product)request.getAttribute("p");
	int quantity = (int)request.getAttribute("quantity");
	NumberFormat formatter = NumberFormat.getNumberInstance(Locale.KOREA);
	int price = (int)request.getAttribute("price");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>header</title>
  <style>
  	/*--------- 장바구니 스타일 ---------------*/
    *{
        box-sizing: border-box;
    }
    
    body{
      width:100%;
      margin:auto;
    }
    .main_content{
      display: flex;
      flex-direction: column;
      
    }

    .cart_wrap{
      height:90%;
      text-align: center;
    }

    .main_content>div {
      margin-top: 0;
      padding: 0;
    }
    .payment, .delivery_area, .point{
       text-align: center;
       justify-content:space-between;
    }


    /* 선택삭제 체크박스, 버튼 스타일*/
    .check_del{
      width:80%;
      display: flex;
      justify-content: space-between;
      
    }
    
    /* 상품 정보 스타일 */
    .pro_info_wrap{
            display: flex;
            /* justify-content: space-evenly; */
            width:80%
        }

        .pro_info{
            margin-left: 15px;
        }

        .thumbnail_img{
            width: 240px;
            height: 240px;
        }

        .thumbnail{
            position:relative;
        }

        .thumbnail_like{
            position:absolute;
            top:175px;
            left:180px;
            text-align: right;
            z-index: 10;
        }



        /* 찜아이콘 스타일 */
        .bi-heart{
            font-size: 40px;
            
        }

        .bi-heart-fill{
            font-size: 40px;
            color:hotpink;
        }
    
        .pay_count{
          color:darkorange;
        }

        /* 결제예상금액 */
        .expect_price{
          display: flex;
          justify-content: space-evenly;
        }
        .expect_price_wrap{
        	width:80%;
        	margin:auto;
        }
        
        /* 전체 배송지 정보 컨테이너 스타일 */
.delivery_area {
    margin-bottom: 20px;
    align-items: center;
    
}

/* 배송지 정보 헤더 스타일 */
.delivery_area h2 {
    font-size: 1.2em;
    margin-bottom: 10px;
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
      
        <div class="cart_wrap">
            <h1>주문 결제</h1>
            <br><br>

            <!-- 전체 선택 체크박스 & 선택삭제 -->
            <div class="cart_list">
              <!-- <div class="check_del">
                <div>
                  <input name="all" type="checkbox" id="del_all">&nbsp;
                  <label for="del_all">전체선택</label>

                </div>

                <button type="button" class="btn btn-outline-secondary">선택삭제</button>
              </div> -->
              <br>
              

              <!-- 주문 상품 정보 -->
              <form action="">
                  <table class="table" align="center">
                      <tr>
                        <th width="50px"></th>
                        <th width="500px">상품정보</th>
                        <th width="140px">수량</th>
                        <th width="220px">주문금액</th>
                      </tr>
                      <tr>
                        <td><!-- <input type="checkbox" name="check"> --></td>
                        <td align="center">
                          <div class="pro_info_wrap">
                            <div class="thumbnail">
                              <img class="thumbnail_img" src="<%=p.getProMainImage() %>" alt="">
                              
                              <!-- 상품 품절 아닐때 -->
                              <div class="thumbnail_like">
                                <!-- 찜 누르기 전 -->
                                <i class="bi bi-heart heart"></i>
                                <!-- 찜 누른 후 -->
                                <!-- <i class="bi bi-heart-fill heart"></i> -->
                              </div>
                    
                            </div>
                            
                            <table class="pro_info">
                              <tr>
                                  <td><%=p.getProName() %></td>
                              </tr>
                            </table>
                            
                          </div>
                          
                        </td>
                        <td><input type="number" name="quantity" min="1" value="<%=quantity %>" id="quantity" onchange="sum();"></td>
                        <td><h5 id="s_price"><%=price %></h5></td>
                      </tr>

                  </table>

                      </div>
                    </div>
                  </div>

                  <br><br>


                  <!-- 결제예상금액 -->

                  <div class="expect_price_wrap">
                  <hr>
                    <h4 style="text-align: left;">
                      총 결제 금액 &nbsp; <span class="pay_count">1</span> 건
                    </h4>
                    <hr>

                    <div class="expect_price">
                      <div>
                        <h3 id="t_price"><%=formatter.format(price * quantity) %></h3>
                        <h6>상품금액</h6>
                      </div>

                      <div>
                        <h3>+</h3>
                        <h6></h6>
                      </div>

                      <div>
                        <h3>0원</h3>
                        <h6>배송비</h6>
                      </div>

                      <div>
                        <h3>=</h3>
                        <h6></h6>
                      </div>

                      <div>
                        <h3 id="o_price"><%=formatter.format(price * quantity)%></h3>
                        <h6>총 결제금액</h6>
                      </div>


                    </div>
                    <hr>
                   	<br><!-- 
					    <h4 style="text-align: left;">
	                      배송지 입력 &nbsp;
	                    </h4>
                   	<hr>
                  
                    <div class="delivery_area">
					    <div class="delivery_address">
					        <table style="width: 80%;">
					            <tr>
				                  <th style="text-align: center;">수령인</th>
				                  <td>
				                  	<input type="text" class="form-control" style= "width: 300px;"name="userName" id="userName" placeholder="이름을 입력해주세요." required>				                  
				                  </td>
				                </tr>
					            <tr>
				                  <th>&nbsp;&nbsp;휴대폰 번호</th>
				                  <td>
				                    <div style="display: flex; align-items: center; margin-top: 25px;">
				                  		<div style="display: flex; flex-grow: 1;">
											<input type="text" class="form-control" style="width: 300px;" id="phone" name="phone" placeholder="- 포함 휴대폰 번호를 입력해주세요.">
				                    	</div>
				                    </div>
				                  </td>
				                </tr>
					            <tr>
				                  <th>&nbsp;&nbsp;주소</th>
				                  <td>
				                  <div style="display: flex; align-items: center;">
				                  	<div style="display: flex; flex-grow: 1; margin-top:25px;">
				                    	<input type="text" id="addressPost" name="addressPost" class="form-control" placeholder="우편번호" style="width: 100px;" readonly="readonly"> &nbsp;&nbsp;
										<input type="button" onclick="postcode()" class="btn btn-secondary btn-sm" value="우편번호 찾기" style="width: 120px;">&nbsp;&nbsp;
									</div>
								  </div>	
								  <div style="margin-top: 25px;">
									<input type="text" id="address" name="address" class="form-control" placeholder="주소" style="width: 400px;" readonly="readonly">&nbsp;&nbsp;
								  </div>				
								  <div>
									<input type="text" id="addressDetail" name="addressDetail" class="form-control" placeholder="상세주소" style="width: 400px;">&nbsp;&nbsp;
				                  </div>
				                  
				                  </td>    
				                </tr>
				                	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
				                	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				                
									<script>
				    			      function postcode() {
				        				 new daum.Postcode({
				            				oncomplete: function(data) {
							                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
							                var addr = ''; // 주소 변수
										
							                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							                    addr = data.roadAddress;
							                } else { // 사용자가 지번 주소를 선택했을 경우(J)
							                    addr = data.jibunAddress;
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('addressPost').value = data.zonecode;
							                document.getElementById("address").value = addr;
							                // 커서를 상세주소 필드로 이동한다.
							                document.getElementById("addressDetail").focus();
				            				}
				        			    }).open();
				        			}
				        				 
							        </script>    
				                	
					            <tr>
					                <th style="align-items: center;">요청 사항</th>
									<td style="display: flex; align-items: center;">
										<input type="text" class="form-control" placeholder="" style="width: 600px;">
					            	<td>
					            </tr>
					        </table>
					    </div>
					</div>
					<hr>
						<div style="display: flex;">
					    	<label>적립금</label><br>
					    	<input type="number" class="form-control" style="width: 200px;">&nbsp;&nbsp;
					    	<input type="checkbox" style="width:25px; height:25px;" id="use_points">&nbsp;&nbsp;
					    	<label for="use_points">전액사용</label>&nbsp;&nbsp;
					    	<span>3000원</span>
						</div>
					<hr>
					<div class="payment" style="display: flex;">
					    <p>결제 수단</p>
					    <label><input type="radio" name="payment_method"> 신용카드</label>
					    <label><input type="radio" name="payment_method"> 계좌이체</label>
					</div>
					<hr>
					<div class="btn-group btn-block btn-group-lg">
					    <button type="button" class="btn btn-outline-secondary">뒤로가기</button>
					    <button type="button" class="btn btn-warning">결제하기</button>
					</div>
                  </div>


                </form>
            </div> -->
            <br>
            <br>
        </div>

    </section>

		<!--section end-->
		
		<script>
		$(function(){
			 function sum() {
			        let s = parseInt($("#s_price").text().replace('원', '').replace(',', ''));
			        let q = $("#quantity").val();
			        let totalPrice = s * q;
			        $("#t_price").text(totalPrice.toLocaleString());
			        $("#o_price").text(totalPrice.toLocaleString());
			    }
			    
			    sum();

			    // 수량 변경 시 합계 업데이트
			    $("#quantity").on('change', function() { 
			        sum();
			    });
			    
		})
		</script>


		<!--footer start-->
		<%@ include file="/views/common/footer.jsp"%>
		<!--footer end-->

		
	</div>




	</div>

</body>

</html>