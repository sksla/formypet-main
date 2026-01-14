/**
 * 
 */
 
/* 회원 탈퇴 start */
function Unregister() {
    // 체크박스와 비밀번호 입력값 가져오기
    const checkbox = document.getElementById('checkbox');
    const userPwd = document.getElementById('user_Pwd').value;
    
    // 체크박스가 선택되지 않은 경우
    if (!checkbox || !checkbox.checked) {
        alert('회원탈퇴를 진행하려면 체크박스를 선택해주세요.');
        return;
    }
    
    // 비밀번호 입력되지 않은 경우
    if (userPwd.trim() === '') {
        alert('비밀번호를 입력하세요.');
        return;
    }
    
    // AJAX를 사용하여 서버로 회원 탈퇴 요청 보내기
    $.ajax({
    type: "GET",
    url: "Unregister",
    data: { userPwd: userPwd },
    dataType: "text",
    success: function(response) {
		
        if (response > 0) {
            location.href = "logout.me";
            alert("회원 탈퇴를 성공하였습니다. 그동안 이용해 주셔서 감사합니다.");
        } else {
            // 회원 탈퇴 실패 시 경고 메시지 표시
            alert("비밀번호가 틀렸습니다. 다시 시도해주세요.");
        }
    },
    error: function(xhr, status, error) {
        // AJAX 요청 실패 시 경고 메시지 표시
        alert("회원 탈퇴에 실패했습니다.");
    }
});
    
}
/* 회원탈퇴 end */
 
 