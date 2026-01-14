/**
 * 마이페이지 주문 js
 */
 
 /* 주문·교환·반품·취소 버튼 js */
document.addEventListener("DOMContentLoaded", function () {
    const divOrderButtons = document.querySelectorAll(".div_total div");
    const mypageFont6 = document.querySelector(".mypage_font6");
    divOrderButtons.forEach(function (button, index) {
        button.addEventListener("click", function () {
            // 모든 버튼의 색상을 초기화
            divOrderButtons.forEach(function (btn) {
                btn.querySelector("hr").classList.remove("hr_selected");
                btn.querySelector("hr").classList.add("hr_NoSelected");
            });
            // 클릭된 버튼만 색상 변경
            button.querySelector("hr").classList.remove("hr_NoSelected");
            button.querySelector("hr").classList.add("hr_selected");
            // 교환 버튼을 클릭했을 때
            if (button.classList.contains("product_order")) {
                mypageFont6.textContent = "주문내역";
            } else if (button.classList.contains('product_chagne')) {
                mypageFont6.textContent = "교환내역";
            } else if (button.classList.contains('product_return')) {
                mypageFont6.textContent = "반품내역";
            } else if (button.classList.contains('product_cancle')) {
                mypageFont6.textContent = "취소내역";
            }
        });
    });
});
// 페이지 로드 시 "주문" 내용 보이기
document.addEventListener("DOMContentLoaded", function() {
    var orderContent = document.getElementById("orderContent1");
    if (orderContent) {
        orderContent.style.display = "block";
    }
});

// 탭 선택 시 해당 내용 보이기
function selectTab(tabName) {
    var allContents = document.getElementsByClassName("content_result");
    for (var i = 0; i < allContents.length; i++) {
        allContents[i].style.display = "none";
    }

    var selectedContent = document.getElementById(tabName);
    if (selectedContent) {
        selectedContent.style.display = "block";
    }
}






/* 날짜 버튼 js start */
function openTab(event, tabName) {
    var tabs = document.querySelectorAll('.date_left .tab');
    tabs.forEach(function(tab) {
        tab.classList.remove('div_selected');
        tab.classList.add('div_NoSelected');
    });

    event.currentTarget.classList.remove('div_NoSelected');
    event.currentTarget.classList.add('div_selected');

    var startDateInput = document.getElementById('startDate');
    var endDateInput = document.getElementById('endDate');

    if (tabName === 'tab1') {
        startDateInput.value = getFormattedDate(-30);
        endDateInput.value = getFormattedDate(0);
    } else if (tabName === 'tab2') {
        startDateInput.value = getFormattedDate(-90);
        endDateInput.value = getFormattedDate(0);
    } else if (tabName === 'tab3') {
        startDateInput.value = getFormattedDate(-180);
        endDateInput.value = getFormattedDate(0);
    } else if (tabName === 'tab4') {
        startDateInput.value = getFormattedDate(-365);
        endDateInput.value = getFormattedDate(0);
    }

    // 날짜가 변경될 때 적립금 필터링 실행
    filterPoints(startDateInput.value, endDateInput.value);
}

function getFormattedDate(daysToAdd) {
    var date = new Date();
    date.setDate(date.getDate() + daysToAdd);

    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0');
    var day = date.getDate().toString().padStart(2, '0');

    return `${year}-${month}-${day}`;
}

function dateChanged() {
    var tabs = document.querySelectorAll('.date_left .tab');
    tabs.forEach(function(tab) {
        tab.classList.remove('div_selected');
        tab.classList.add('div_NoSelected');
    });

    // 사용자가 직접 날짜를 선택했을 때 선택한 날짜로 필터링
    var startDateInput = document.getElementById('startDate');
    var endDateInput = document.getElementById('endDate');
    filterPoints(startDateInput.value, endDateInput.value);
}

// 필터링 함수
function filterPoints(startDate, endDate) {
    var tableRows = document.querySelectorAll('.table_point .tr2');
    var hasVisibleRows = false; // 표시된 행이 있는지 여부

    tableRows.forEach(function(row) {
        var rowData = row.getElementsByTagName('td');
        var pointDate = rowData[0].innerText.trim(); // 첫 번째 열은 날짜

        // 적립금 내역의 날짜와 필터링된 날짜 범위 비교
        if (isDateInRange(pointDate, startDate, endDate)) {
            row.style.display = ''; // 범위 내에 있으면 표시
            hasVisibleRows = true; // 표시된 행이 있음을 표시
        } else {
            row.style.display = 'none'; // 범위 밖에 있으면 숨김
        }
    });

    // "내역 없음" 메시지 제어
    var noDataMessage = document.getElementById('noDataMessage');
    if (!hasVisibleRows) {
        noDataMessage.style.display = 'table-row'; // 보이기
    } else {
        noDataMessage.style.display = 'none'; // 숨기기
    }
}

function isDateInRange(pointDate, startDate, endDate) {
    var date = new Date(pointDate);
    var start = new Date(startDate);
    var end = new Date(endDate);

    return (date >= start && date <= end);
}

// 기본값 첫번째 탭(1개월)으로 보여지게 하기
window.addEventListener('load', function() {
    openTab({ currentTarget: document.querySelector('.date_left .tab') }, 'tab1');
});
/* 날짜 버튼 js end */

/* 주문 */

 