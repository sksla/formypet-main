/**
 * 마이페이지 적립금
 */
 
 
 /* 날짜 기능 js start */
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

    // 날짜가 변경될 때 필터링 실행
    filterContent(startDateInput.value, endDateInput.value);
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
    filterContent(startDateInput.value, endDateInput.value);
}

// 필터링 함수
function filterContent(startDate, endDate) {
    var tableRows = document.querySelectorAll('.table_point .tr2');
    var hasVisibleRows = false; // 표시된 행이 있는지 여부

    tableRows.forEach(function(row) {
        var rowData = row.getElementsByTagName('td');
        var pointDate = rowData[0].innerText.trim(); // 첫 번째 열은 날짜

        // 날짜와 필터링된 날짜 범위 비교
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
/* 날짜 기능 js end */