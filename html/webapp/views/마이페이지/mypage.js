/* 마이페이지 자바스크립트 */


/* 사이드바 js */
$(document).ready(function() {
    $('.sidebar').load('sidebar.html');
});
$(document).ready(function() {
    $('.date_tab').load('mypage_date.html');
});

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

/* 날짜 버튼 js start */
function openTab(event, tabName) {
    var tabs = document.querySelectorAll('.date_left .tab');
    tabs.forEach(function(tab) {
        tab.classList.remove('div_selected');
        tab.classList.add('div_NoSelected');
    });

    event.currentTarget.classList.remove('div_NoSelected');
    event.currentTarget.classList.add('div_selected');

    var resultDiv = document.getElementById('content_result');
    var startDateInput = document.getElementById('startDate');
    var endDateInput = document.getElementById('endDate');

    if (tabName === 'tab1') {
        startDateInput.value = getFormattedDate(-30);
        endDateInput.value = getFormattedDate(0);
        // resultDiv.innerHTML = "1개월 결과";
        // resultDiv.style.backgroundColor = 'yellow';
    } else if (tabName === 'tab2') {
        startDateInput.value = getFormattedDate(-90);
        endDateInput.value = getFormattedDate(0);
        // resultDiv.innerHTML = "3개월 결과";
        // resultDiv.style.backgroundColor = 'orange';
    } else if (tabName === 'tab3') {
        startDateInput.value = getFormattedDate(-180);
        endDateInput.value = getFormattedDate(0);
        // resultDiv.innerHTML = "6개월 결과";
        // resultDiv.style.backgroundColor = 'orangered';
    } else if (tabName === 'tab4') {
        startDateInput.value = getFormattedDate(-365);
        endDateInput.value = getFormattedDate(0);
        // resultDiv.innerHTML = "12개월 결과";
    }
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
}

// 기본값 첫번째 탭(1개월)으로 보여지게 하기
window.addEventListener('load', function() {
    openTab({ currentTarget: document.querySelector('.date_left .tab') }, 'tab1');
});
/* 날짜 버튼 js end */








/* 배송지 관리 js start */
$(document).ready(function(){
    // 주소 목록을 가져와서 테이블에 추가하는 함수
    function populateAddressTable(addressList) {
        $.each(addressList, function(index, address) {
            // 주소 테이블 생성
            const table = $('<table>').addClass('address_table');

            const tr1 = $('<tr>');
            const th1 = $('<th>').addClass('address_th1');
            th1.append($('<span>').text(address.name));
            th1.append($('<span>').text(address.phone));
            tr1.append(th1);
            tr1.append($('<td>').addClass('address_td1').attr('rowspan', '3').append(
                $('<div>').addClass('btn_sort').append(
                    $('<div>').addClass('btn_address').text('수정').on('click', function() {
                        // 수정 버튼 클릭 시 동작
                        console.log('수정 버튼 클릭 - 주소:', address.address);
                    }),
                    $('<div>').addClass('btn_address').text('삭제').on('click', function() {
                        // 삭제 버튼 클릭 시 동작
                        console.log('삭제 버튼 클릭 - 주소:', address.address);
                    })
                )
            ));
            table.append(tr1);

            const tr2 = $('<tr>').addClass('address_tr2');
            const td2 = $('<td>');
            td2.append($('<span>').text('[' + address.zip + '] ' + address.address));
            tr2.append(td2);
            table.append(tr2);

            const tr3 = $('<tr>').addClass('address_tr3');
            const td3 = $('<td>');
            if (address.isDefault) {
                td3.append($('<div>').addClass('default_address').text('기본'));
            } else {
                td3.append($('<div>').addClass('other_address').text('기본 배송지로 설정'));
            }
            tr3.append(td3);
            table.append(tr3);

            // 테이블을 주소 테이블 컨테이너에 추가
            $('#table_address').append(table);
            
            // 주소 테이블 사이에 수평선 추가
            if (index < addressList.length - 1) {
                $('#table_address').append($('<hr>').addClass('hr1'));
            }
        });
    }

    // 가상의 데이터베이스에서 주소 목록을 가져와서 테이블에 추가
    function getAddressListFromDatabase(callback) {
        // 여기에서 실제 데이터베이스로부터 데이터를 가져오는 AJAX 요청 등의 코드를 사용할 수 있습니다.
        // 이 예제에서는 가상의 주소 목록을 사용합니다.
        const addressList = [
            {
                name: '우리집',
                phone: '010-2222-5555',
                zip: '54848',
                address: '서울특별시 금천구 가산디지털2로 95(가산동, km타워) 2층, 3층',
                isDefault: true
            },
            {
                name: '남의집',
                phone: '010-7777-6666',
                zip: '54848',
                address: '서울특별시 금천구 가산디지털2로 95(가산동, km타워) 2층, 3층',
                isDefault: false
            },
            {
                name: '회사입니다.',
                phone: '02-9999-2222',
                zip: '54848',
                address: '서울특별시 금천구 가산디지털2로 95(가산동, km타워) 2층, 3층',
                isDefault: false
            }
        ];

        callback(addressList);
    }

    // 가상의 데이터베이스에서 주소 목록을 가져와서 테이블에 추가
    getAddressListFromDatabase(populateAddressTable);
});

// 모달 열기
function open_address_modal() {
    document.getElementById("modal_address").style.display = "block";
}
// 모달 닫기
function close_address_modal() {
    document.getElementById("modal_address").style.display = "none";
}
//  외부 영역과 x버튼 클릭시 창 닫기
window.onclick = function(event) {
    var modal = document.getElementById("modal_address");
    if (event.target == modal) {
        close_address_modal();
    }
};
/* 배송지 관리 js end */








/* 위시리스트 전체삭제 js start*/
// 모달 열기
function openModal(modalId) {
    var modal = document.getElementById(modalId);
    if (modal) {
      modal.style.display = "block";
      // 모달 외부 클릭 시 닫기 이벤트 추가
      window.addEventListener('click', outsideClickHandler);
    }
  }
  // 모달 닫기
  function closeModal(modalId) {
    var modal = document.getElementById(modalId);
    if (modal) {
      modal.style.display = "none";
      // 모달 닫힐 때 이벤트 제거
      window.removeEventListener('click', outsideClickHandler);
    }
  }
  // 삭제 기능
  function deleteWishlist() {
    // 여기에 삭제 로직을 추가합니다.
    // 예를 들어, AJAX 요청을 보내거나 필요한 작업을 수행합니다.
    console.log("전체 삭제되었습니다.");
    // 삭제가 완료되면 모달을 닫을 수 있습니다.
    closeModal('deleteWishlist');
  }
  // 모달 외부 클릭 시 닫기
  function outsideClickHandler(event) {
    var modal = document.getElementById('deleteWishlist');
    if (modal && event.target === modal) {
      closeModal('deleteWishlist');
    }
  }
/* 위시리스트 전체삭제 js end*/



/* 회원정보 수정 js start*/
function checkPassword() {
    // 입력된 비밀번호 가져오기
    var inputPassword = document.getElementById("pwd").value;
    var passwordInput = document.getElementById("pwd");

    // 비밀번호가 1234인지 확인
    if (inputPassword === "1234") {
        // 맞으면 페이지 이동
        window.location.href = "mypage_member_info.html";
    } else {
        // 틀리면 테두리 빨간색으로 변경
        alert("비밀번호를 잘못 입력했습니다.");
        passwordInput.style.border = "2px solid red";
        passwordInput.focus();
    }
}
/* 회원정보 수정 js end*/
