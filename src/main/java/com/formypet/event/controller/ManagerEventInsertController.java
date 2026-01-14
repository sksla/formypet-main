package com.formypet.event.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.formypet.common.model.vo.Attachment;
import com.formypet.common.template.MultipartContent;
import com.formypet.common.template.MyFileRenamePolicy;
import com.formypet.event.model.service.EventService;
import com.formypet.event.model.vo.Event;
import com.formypet.event.model.vo.EventProduct;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ManagerEventInsertController
 */
@WebServlet("/insert.mev")
public class ManagerEventInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerEventInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MultipartRequest multiRequest = new MultipartContent().getMultipart(request);
		Event e = new Event();
		
		e.setEventTitle(multiRequest.getParameter("title"));
		e.setStartDate(multiRequest.getParameter("startDate"));
		e.setEndDate(multiRequest.getParameter("endDate"));
		e.setEventShow(multiRequest.getParameter("showEvent"));

		String[] product = multiRequest.getParameterValues("productNo");
		String[] discount = multiRequest.getParameterValues("discount");
		List<EventProduct> products = new ArrayList<>();
		for(int i = 0; i < product.length; i++) {
			EventProduct ep = new EventProduct();
			ep.setProNo(Integer.parseInt(product[i]));
			ep.setDiscount(Integer.parseInt(discount[i]));
			products.add(ep);
		}
		// 첨부파일 정보 => Attachment 여러행 insert
		List<Attachment> list = new ArrayList<>();
		for(int i = 1; i <= 2; i++) {
			String key = "upfile" + i;
			
			if(multiRequest.getOriginalFileName(key) != null) {
				// 첨부파일이 존재 할 경우
				// Attachment생성 + 원본명, 수정명, 경로, 파일레벨 담아서 => list에 추가
				Attachment at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName(key));
				at.setChangeName(multiRequest.getFilesystemName(key));
				at.setFilePath("resources/thumbnail_upfiles/");
				at.setFileLevel(i == 1 ? 1 : 2);
				
				list.add(at);
			}
		}
		int result = new EventService().insertEvent(e, products, list);
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/list.mev?page=1");
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
