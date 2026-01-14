<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="<%=contextPath%>/index.m">
          <i class="bi bi-grid"></i> <!-- 아이콘 -->
          <span>대시보드</span>
        </a>
      </li>
      <!-- 홈 Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>상품관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="<%=contextPath %>/list.mpro?page=1">
              <i class="bi bi-circle"></i><span>상품 조회</span>
            </a>
          </li>
          <li>
            <a href="<%=contextPath %>/list.msto?page=1">
              <i class="bi bi-circle"></i><span>상품 재고 관리</span>
            </a>
          </li>
        </ul>
      </li>
      
      <!-- 상품관리 Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-person"></i><span>회원관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="<%=contextPath %>/list.mm?page=1">
              <i class="bi bi-circle"></i><span>회원 조회</span>
            </a>
          </li>
          <li>
            <a href="<%=contextPath %>/updateList.mm?page=1">
              <i class="bi bi-circle"></i><span>회원 등록/변경/삭제</span>
            </a>
          </li>
        </ul>
      </li>
      <!-- 회원관리 -->

      <%-- <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#order-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-box-seam"></i><span>주문 관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="order-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="<%=contextPath%>/list.mor?page=1">
              <i class="bi bi-circle"></i><span>주문/취소/교환/반품 관리</span>
            </a>
          </li>
        </ul>
      </li>
      <!-- 주문 관리 Nav --> --%>


      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse">
          <i class="bi bi-calendar-event"></i><span>이벤트 관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="<%=contextPath %>/list.mev?page=1">
              <i class="bi bi-circle"></i><span>이벤트 목록 조회</span>
            </a>
          </li>
        </ul>
      </li>
      <!-- 이벤트 관리 Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>게시판 관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="<%=contextPath%>/list.mbo">
              <i class="bi bi-circle"></i><span>게시글 관리</span>
            </a>
          </li>
          <li>
            <a href="<%=contextPath%>/list.mre">
              <i class="bi bi-circle"></i><span>댓글 관리</span>
            </a>
          </li>
          <li>
            <a href="<%=contextPath%>/list.mrv">
              <i class="bi bi-circle"></i><span>리뷰 관리</span>
            </a>
          </li>
        </ul>
      </li>
      <!-- 게시판 Nav -->

      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#cs-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-headset"></i><span>고객센터 관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="cs-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="<%=contextPath%>/list.mno">
              <i class="bi bi-circle"></i><span>공지사항</span>
            </a>
          </li>
          <li>
            <a href="<%=contextPath%>/list.mfq">
              <i class="bi bi-circle"></i><span>FAQ</span>
            </a>
          </li>
          <li>
            <a href="<%=contextPath%>/list.mqa">
              <i class="bi bi-circle"></i><span>1:1 문의</span>
            </a>
          </li>
          
        </ul>
      </li>
      <!-- 고객센터 Nav -->
      
      
	</ul>
  </aside>
  <!-- End Sidebar-->
</body>
</html>