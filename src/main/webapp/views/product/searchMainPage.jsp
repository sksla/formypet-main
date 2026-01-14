<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

    .search_btn{
      display: flex;
      justify-content: center; /* 수평 가운데 정렬 */
  
    }

    .search_btn a {
      width: 400px;
      height: 55px;
      text-align: center;
      border-radius: 10px;
      font-size: 30px;
      margin: 0 50px; /* 각 버튼 사이의 간격을 설정합니다. */
      margin-top: 120px;
      padding-top: 5px;
    }
</style>
</head>

<body>

	<div class="wrap">

		<%@ include file="/views/common/header.jsp"%>


		<!--section start-->
		<section class="main_content">

			<div class="search_btn">
				<a type="button" style="background-color: rgb(255, 224, 96);" onclick="kind('D');" >강아지</a> 
				<a type="button" style="background-color: rgb(196, 192, 198);" onclick="kind('C');">고양이</a>
			</div>

		</section>
		<script>
			function kind(k){
				location.href ="<%=contextPath%>/search?kind="+ k
			}
		</script>

		<!--section end-->


		<%@ include file="/views/common/footer.jsp"%>

	</div>



</body>

</html>