package com.formypet.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.formypet.member.model.vo.Member;

public class UserNumber {

	public static int getUserNo(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Member loginUser = (Member) session.getAttribute("loginUser");
            if (loginUser != null) {
                // 로그인한 사용자의 회원 번호를 리턴
                return loginUser.getUserNo();
            }
        }
        return 0;
    }
}
