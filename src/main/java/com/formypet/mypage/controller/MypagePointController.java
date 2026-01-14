package com.formypet.mypage.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.common.model.vo.PageInfo;
import com.formypet.common.template.PagingTemplate;
import com.formypet.member.model.vo.Member;
import com.formypet.mypage.model.service.MypageService;
import com.formypet.mypage.model.vo.Point;

/**
 * Servlet implementation class MypagePointController
 */
@WebServlet("/MypagePoint")
public class MypagePointController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypagePointController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 사용자 정보 가져오기
        int userNo = UserNumber.getUserNo(request);

        // 총 포인트 불러오기
        int pointTotal = new MypageService().getUserPoint(userNo);
        request.setAttribute("pointTotal", pointTotal);

        List<Point> pointHistory = new MypageService().PointHistory(userNo);

        List<Integer> userNoList = new ArrayList<>();
        List<Integer> orderNo = new ArrayList<>();
        List<Date> pointDate = new ArrayList<>();
        List<Integer> pointAdd = new ArrayList<>();
        List<Integer> pointUse = new ArrayList<>();
        List<Integer> pointReason = new ArrayList<>();

        for (Point point : pointHistory) {
            userNoList.add(point.getUserNo());
            orderNo.add(point.getOrderNo());
            pointDate.add(point.getPointDate());
            pointAdd.add(point.getPointAdd());
            pointUse.add(point.getPointUse());
            pointReason.add(point.getPointReason());
        }
        request.setAttribute("userNo", userNoList);
        request.setAttribute("orderNo", orderNo);
        request.setAttribute("pointDate", pointDate);
        request.setAttribute("pointAdd", pointAdd);
        request.setAttribute("pointUse", pointUse);
        request.setAttribute("pointReason", pointReason);

        // 포인트 페이지 실행
        request.getRequestDispatcher("/views/mypage/MypagePoint.jsp").forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}