package com.formypet.cs.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.formypet.common.model.vo.Attachment;
import com.formypet.common.template.MyFileRenamePolicy;
import com.formypet.cs.model.service.QnaService;
import com.formypet.cs.model.vo.Qna;
import com.formypet.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class MemberQnaInsert
 */
@WebServlet("/insert.qo")
public class MemberQnaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQnaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String qnaTitle = multiRequest.getParameter("qnaTitle");
			String qnaContent = multiRequest.getParameter("qnaContent");
			String category = multiRequest.getParameter("category");
			
			HttpSession session = request.getSession();
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			
			Qna q = new Qna();
			q.setQnaTitle(qnaTitle);
			q.setQnaContent(qnaContent);
			q.setCategory(category);
			q.setQnaWriter(String.valueOf(userNo));
			
			Attachment at = null;
			
			// multiRequest.getOriginalFileName("키") : 넘어온 첨부파일이 있을 경우 "원본명" | 없을 경우 null
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/upfiles/");
			}
			
			int result = new QnaService().insertQna(q, at);
			
			if(result > 0) { // 등록성공
				
				session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.qo");
				
				
			}else { // 실패 => 에러페이지
				
				// 이미 업로드된 파일 => 더이상 쓸모없음 (용량만 차지)
				// => 파일 제거 
				if(at != null) { // 첨부파일이 있었을 경우 
					new File(savePath + at.getChangeName()).delete();
				}
			}
				
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
