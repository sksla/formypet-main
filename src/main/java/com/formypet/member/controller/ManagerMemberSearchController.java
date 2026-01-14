package com.formypet.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.common.model.vo.PageInfo;
import com.formypet.common.template.PagingTemplate;
import com.formypet.member.model.service.MemberService;
import com.formypet.member.model.vo.Member;

/**
 * Servlet implementation class ManagerMemberSearchController
 */
@WebServlet("/search.mm")
public class ManagerMemberSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemberSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String main = request.getParameter("main");
		String search = request.getParameter("search");
		boolean check = true;
		int listCount;
		PageInfo pi = null;
		int update = Integer.parseInt(request.getParameter("update"));
		listCount = new MemberService().selectSearchCount(main, search);
		pi = new PagingTemplate().Paging(request, "page", listCount, 5, 10);			

		// * 사용자가 요청한 페이지에 보여져야될 게시글 목록
		List<Member> list = new MemberService().selectSearchList(pi, main, search);
		
		request.setAttribute("main", main);
		request.setAttribute("search", search);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("check", check);
		if(update > 0) {
			request.getRequestDispatcher("/views/manager/member/mMemberUpdateList.jsp").forward(request, response);						
		} else {
			request.getRequestDispatcher("/views/manager/member/mMemberList.jsp").forward(request, response);			
		}
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
