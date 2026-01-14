package com.formypet.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.formypet.board.model.service.BoardService;
import com.formypet.board.model.vo.Board;
import com.formypet.common.model.vo.Attachment;
import com.formypet.common.template.MyFileRenamePolicy;
import com.formypet.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ThumbnailInsertController
 */
@WebServlet("/insert.th")
public class ThumbnailInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String errorMsg = null;
		request.setCharacterEncoding("UTF-8");

		
		if(ServletFileUpload.isMultipartContent(request)) { //성공
			
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/thumbnail_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Board b = new Board();
			b.setBoardTitle(multiRequest.getParameter("title"));
			b.setBoardContent(multiRequest.getParameter("content"));
			
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			b.setBoardWriter(String.valueOf(userNo));
			
			List<Attachment> list = new ArrayList<>();
			for(int i=1; i<=4; i++) {
				String key = "upfile" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/thumbnail_upfiles/");
					at.setFileLevel(i == 1 ? 1 : 2);
					
					list.add(at);
				}
			}

			int result = new BoardService().insertThumbnailBoard(b, list);
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/list.th?page=1"); //상세조회페이지이동링크로
				
			}
			
			request.setAttribute("errorMsg", "success"); // errorMsg 설정 - 모달창
			
			
		} else { //작성실패 -> 창 따로 뜨지않음
			
			

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
