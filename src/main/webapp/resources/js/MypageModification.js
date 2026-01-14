/** 
 * 회원 정보 수정 js
 */
 
 
 function validateForm() {
    // 유효성 검사 로직 추가
    return true; // 유효성 검사를 통과하면 true 반환
}

$(document).ready(function() {
	console.log("테스트");
    $("#updateButton").click(function(event) {
        event.preventDefault(); // 기본 이벤트 방지

        // 유효성 검사 함수 호출
        if (!validateForm()) {
            return;
        }

        // Ajax를 통한 데이터 전송
        $.ajax({
            type: "POST",
            url: "<%= request.getContextPath() %>/update.me", // 서블릿 URL
            data: {
                userName: $("#userName").val(),
                userBirth: $("#dateInput").val(),
                gender: $("input[name='gender']:checked").val(),
                email: $("#email_id").val() + "@" + $("#domain-text").val(),
                phone: $("#phone").val(),
                addressPost: $("#addressPost").val(),
                address: $("#address").val(),
                addressDetail: $("#addressDetail").val(),
                statusSns: $("#status_sns").is(":checked") ? 1 : 0,
                statusEmail: $("#emailCheck").is(":checked") ? 1 : 0,
                petType: $("input[name='petType']:checked").val(),
                petName: $("#petName").val(),
                petKind: $("#petKind").val(),
                petAge: $("#petAge").val(),
                petGender: $("input[name='petGender']:checked").val()
            },
            success: function(response) {
                // 서버로부터 응답을 받았을 때 실행할 코드
                console.log("회원정보 수정 성공");
                // 성공 메시지 등 추가적인 동작
            },
            error: function(xhr, status, error) {
                // 에러 발생 시 실행할 코드
                console.error("Error: " + error);
                // 에러 메시지 등 추가적인 동작
            }
        });
    });
});