/* 마이페이지 자바스크립트 */


/* 주문 내역 js start */
function openOrderTab(event, tabName) {
    var tabs = document.querySelectorAll('.order_buttons .order_button');
    tabs.forEach(function(tab) {
        tab.classList.remove('selected');
    });

    event.currentTarget.classList.add('selected');

    var startDateInput = document.getElementById('orderStartDate');
    var endDateInput = document.getElementById('orderEndDate');

    if (tabName === 'orderTab1') {
        startDateInput.value = getFormattedDate(-30);
        endDateInput.value = getFormattedDate(0);
    } else if (tabName === 'orderTab2') {
        startDateInput.value = getFormattedDate(-90);
        endDateInput.value = getFormattedDate(0);
    } else if (tabName === 'orderTab3') {
        startDateInput.value = getFormattedDate(-180);
        endDateInput.value = getFormattedDate(0);
    } else if (tabName === 'orderTab4') {
        startDateInput.value = getFormattedDate(-365);
        endDateInput.value = getFormattedDate(0);
    }

    // 날짜가 변경될 때 주문 내역 필터링 실행
    filterOrders(startDateInput.value, endDateInput.value);
}

function getFormattedDate(daysToAdd) {
    var date = new Date();
    date.setDate(date.getDate() + daysToAdd);

    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0');
    var day = date.getDate().toString().padStart(2, '0');

    return `${year}-${month}-${day}`;
}

function filterOrders(startDate, endDate) {
    var orderDetails = document.querySelectorAll('.mypage_order_detail');
    orderDetails.forEach(function(order) {
        var orderDate = order.querySelector('.mypage_font8').textContent;
        var parsedOrderDate = new Date(orderDate);

        if (parsedOrderDate >= new Date(startDate) && parsedOrderDate <= new Date(endDate)) {
            order.style.display = 'block';
        } else {
            order.style.display = 'none';
        }
    });
}

window.addEventListener('load', function() {
    openOrderTab({ currentTarget: document.querySelector('.order_buttons .order_button') }, 'orderTab1');
});
/* 주문 내역 js end */






/* 배송지 관리 js start */
// 모달 열기
function open_address_modal() {
    var modal = document.getElementById("modal_address");
    modal.style.display = "block";
}

// 모달 닫기
function close_address_modal() {
    var modal = document.getElementById("modal_address");
    modal.style.display = "none";

    // 배송지 추가 텍스트 변경
    $("#addres_title").text("배송지 추가");
    
    // 입력 필드 초기화
    $("#receiver").val("");
    $("#phone").val("");
    $("#sample6_postcode").val("");
    $("#sample6_address").val("");
    $("#sample6_detailAddress").val("");
    $("#sample6_extraAddress").val("");
    $("#defaultCheck").prop("checked", false);
    $("#conditionCheck").prop("checked", false);
}

// 기본 배송지로 바꾸기
function setAsDefault(deliveryNo) {
    $.ajax({
        type: "POST",
        url: "MypageAddressUpdate",
        data: { deliveryNo: deliveryNo },
        success: function(response) {
            console.log("기본 배송지로 설정 요청 성공:", response);
            window.location.reload(); // 페이지 새로고침 또는 적절한 UI 업데이트
        },
        error: function(xhr, status, error) {
            console.error("기본 배송지로 설정 요청 실패:", error);
        }
    });
}

// 배송지 삭제하기
function deleteAddress(deliveryNo) {
    $.ajax({
        type: "POST",
        url: "MypageAddressDelete",
        data: { deliveryNo: deliveryNo },
        success: function(response) {
            console.log("배송지 삭제 요청 성공:", response);
            window.location.reload(); // 페이지 새로고침 또는 적절한 UI 업데이트
        },
        error: function(xhr, status, error) {
            console.error("배송지 삭제 요청 실패:", error);
        }
    });
}

// 배송지 추가하기(저장버튼)
function insertAddress() {
    // 사용자가 입력한 데이터 가져오기
    var name = $("#receiver").val();
    var phone = $("#phone").val();
    var postCode = $("#sample6_postcode").val();
    var address = $("#sample6_address").val();
    var detailAddress = $("#sample6_detailAddress").val();
    var defaultCheck = $("#defaultCheck").prop("checked");
    var conditionCheck = $("#conditionCheck").prop("checked");
    
    // 필수 입력 필드인지 확인하고 빈 값인지 체크
    if (!name.trim() || !phone.trim() || !postCode.trim() || !address.trim() || !detailAddress.trim()) {
        alert("이름, 전화번호, 우편번호, 주소는 필수 입력 항목입니다.");
        return; // 필수 입력 필드 중 하나라도 비어있다면 함수 종료
    }
    if (!conditionCheck) {
        alert("배송지 정보 수집 및 이용 동의에 체크를 해야 합니다.");
        return;
    }

    // 배송지 추가인지 수정인지 확인
    var title = $("#addres_title").text();
    
    if (title === "배송지 추가") {
        // 배송지 추가일 때 처리
        $.ajax({
            type: "POST",
            url: "MypageAddressInsert",
            data: {
                name: name,
                phone: phone,
                postCode: postCode,
                address: address,
                detailAddress: detailAddress,
                defaultCheck: defaultCheck
            },
            success: function(response) {
                console.log("배송지 추가 요청 성공:", response);
                window.location.reload(); // 페이지 새로고침 또는 적절한 UI 업데이트
                alert("배송지가 추가되었습니다.");
            },
            error: function(xhr, status, error) {
                console.error("배송지 추가 요청 실패:", error);
            }
        });
    } else if (title === "배송지 수정") {
        // 배송지 수정일 때 처리
        updateAddress();
    }
}

// 배송지 수정하기
function updateAddress() {
    var deliveryNo = $("#deliveryNo").val(); // hidden 필드에서 deliveryNo 가져오기
    var name = $("#receiver").val();
    var phone = $("#phone").val();
    var postCode = $("#sample6_postcode").val();
    var address = $("#sample6_address").val();
    var detailAddress = $("#sample6_detailAddress").val();
    var defaultCheck = $("#defaultCheck").prop("checked");
    
    // 필수 입력 필드 확인
    if (!name.trim() || !phone.trim() || !postCode.trim() || !address.trim() || !detailAddress.trim()) {
        alert("이름, 전화번호, 우편번호, 주소는 필수 입력 항목입니다.");
        return;
    }

	console.log(deliveryNo);
	console.log(name);
	console.log(phone);
	console.log(postCode);
	console.log(address);
	console.log(detailAddress);
	console.log(defaultCheck);

    // 배송지 수정 처리
    $.ajax({
        type: "POST",
        url: "MypageAddressUpdateInfo",
        data: {
            deliveryNo: deliveryNo,
            name: name,
            phone: phone,
            postCode: postCode,
            address: address,
            detailAddress: detailAddress,
            defaultCheck: defaultCheck
        },
        success: function(response) {
            console.log("배송지 수정 요청 성공:", response);
            window.location.reload(); // 페이지 새로고침 또는 적절한 UI 업데이트
            alert("배송지가 수정되었습니다.");
        },
        error: function(xhr, status, error) {
            console.error("배송지 수정 요청 실패:", error);
        }
    });
}

// 배송지 수정 모달 띄우기 값가져오기
function editAddress(deliveryNo) {
    // 먼저 모달 창 출력
    open_address_modal();

    // 배송지 추가 텍스트 변경
    $("#addres_title").text("배송지 수정");

    console.log(deliveryNo);
    console.log("쫌ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
    // 값을 가져와서 모달 창에 보여줌
    $.ajax({
        type: "GET",
        url: "MypageModifyAddress",
        data: { deliveryNo: deliveryNo },
        dataType: "json",
        success: function(response) {
            // 모달 내용 업데이트
            $("#receiver").val(response.deliveryReceiver);
            $("#phone").val(response.phone);
            $("#sample6_postcode").val(response.post);
            $("#sample6_address").val(response.address);
            $("#sample6_detailAddress").val(response.addressDetail);
            
		 	// status가 "Y"인 경우 conditionCheck 체크박스 체크하기
		    if (response.status === "Y") {
		        $("#defaultCheck").prop("checked", true);
		    } else {
		        $("#defaultCheck").prop("checked", false);
		    }
		    
		    // 수정 대상 deliveryNo 저장 (추가 정보)
            $("#editDeliveryNo").val(deliveryNo);
            
            console.log(response);
            console.log(response);
            console.log(response);
            console.log(response);
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청 에러:", error);
        }
    });
}
// 배송지 수정하기

/* 배송지 관리 js end */





// 전화번호 자동으로 숫자만 입력되고 하이픈 추가되는 기능
$(document).ready(function() {
    $("#phone").on("blur", function() {
        var regExp = /[/:<>'="]/gi;
        var curStr = $(this).val();
        if (regExp.test(curStr)) {
            $(this).val(curStr.replace(regExp, ""));
            alert("특수문자 / : < > ' = \" 는 사용하실 수 없습니다.");
            $(this).focus();
            return;
        }
    });

    $("#phone").on("input", function() {
        var check_string = $(this).val();
        var check_string = check_string.replace(/[^0-9]/g, '');
        var len = check_string.length;

        if (len >= 1 && check_string.substr(0, 1) == '1') {
            if (len >= 5 && len <= 7) {
                var subA = check_string.substr(0, 4);
                var subF = check_string.substr(4, 4);
                $(this).val(subA + "-" + subF);
            } else if (len >= 8) {
                var subA = check_string.substr(0, 4);
                var subF = check_string.substr(4, 4);
                $(this).val(subA + "-" + subF);
            } else {
                $(this).val(check_string);
            }
        } else if (len >= 2 && check_string.substr(0, 2) == '02') {
            if (len >= 3 && len <= 5) {
                var subA = check_string.substr(0, 2);
                var subF = check_string.substr(2, 3);
                $(this).val(subA + "-" + subF);
            } else if (len >= 6 && len <= 9) {
                var subA = check_string.substr(0, 2);
                var subF = check_string.substr(2, 3);
                var subB = check_string.substr(5, 4);
                $(this).val(subA + "-" + subF + "-" + subB);
            } else if (len >= 10) {
                var subA = check_string.substr(0, 2);
                var subF = check_string.substr(2, 4);
                var subB = check_string.substr(6, 4);
                $(this).val(subA + "-" + subF + "-" + subB);
            } else {
                $(this).val(check_string);
            }
        } else if (len >= 2 && check_string.substr(0, 2) != '02') {
            if (len >= 4 && len <= 6) {
                var subA = check_string.substr(0, 3);
                var subF = check_string.substr(3, 3);
                $(this).val(subA + "-" + subF);
            } else if (len >= 7 && len <= 10) {
                var subA = check_string.substr(0, 3);
                var subF = check_string.substr(3, 3);
                var subB = check_string.substr(6, 4);
                $(this).val(subA + "-" + subF + "-" + subB);
            } else if (len >= 11) {
                var subA = check_string.substr(0, 3);
                var subF = check_string.substr(3, 4);
                var subB = check_string.substr(7, 4);
                $(this).val(subA + "-" + subF + "-" + subB);
            } else {
                $(this).val(check_string);
            }
        } else {
            $(this).val(check_string);
        }
    });
});



/* 위시리스트 모달 */
// 모달 열기
function openModal(modalId) {
    var modal = document.getElementById(modalId);
    modal.style.display = "block";
    modal.addEventListener("click", outsideModalClick);
}
// 모달 닫기 함수
function closeModal(modalId) {
    var modal = document.getElementById(modalId);
    modal.style.display = "none";
    modal.removeEventListener("click", outsideModalClick);
}






/* 위시리스트 전체 삭제 start */
function deleteAllWishlist() {
	
	location.href = "deleteAllWishlist";
	
    closeModal("deleteAllWishlist"); // 실행 후 모달창 닫기
}
/* 위시리스트 전체삭제 end*/


/* 위시리스트 품절 제외 start */
document.addEventListener("DOMContentLoaded", function() {
  const checkboxWishlist = document.getElementById('checkbox_wishlist');
  const soldoutProducts = document.querySelectorAll('.soldout_img');

  // 체크박스 상태가 변경될 때 진행
  function filterSoldOutProducts() {
    soldoutProducts.forEach(product => {
      if (checkboxWishlist.checked && product.classList.contains('soldout_img')) {
        product.closest('.div_pro').style.display = 'none';
      } else {
        product.closest('.div_pro').style.display = 'block';
      }
    });
  }
  checkboxWishlist.addEventListener('change', filterSoldOutProducts);
  filterSoldOutProducts();
  checkboxWishlist.addEventListener('load', filterSoldOutProducts);
});
/* 위시리스트 품절 제외 end */




/* 위시리스트 1개 삭제 start */
function deleteOneWishlist(proNo) {
    
     $.ajax({
         type: "POST",
         url: "deleteOneWishlist",  // 실제 요청을 처리할 서버의 URL
         data: { proNo: proNo },     // 전송할 데이터
         success: function(response) {
             console.log("삭제 요청 성공:", response);
             window.location.reload();
         },
         error: function(xhr, status, error) {
             console.error("삭제 요청 실패:", error);
         }
     });
}
/* 위시리스트 1개 삭제 end */














