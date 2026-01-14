package com.formypet.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.common.model.vo.Attachment;
import com.formypet.common.template.MultipartContent;
import com.formypet.product.model.service.ProductService;
import com.formypet.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ManagerProductUpdateController
 */
@WebServlet("/update.mpro")
public class ManagerProductUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerProductUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MultipartRequest multiRequest = new MultipartContent().getMultipart(request);
		int no = Integer.parseInt(multiRequest.getParameter("no"));
		String name = multiRequest.getParameter("title");
		String cate = multiRequest.getParameter("cate");
		int midd = Integer.parseInt(multiRequest.getParameter("midd"));
		int price = Integer.parseInt(multiRequest.getParameter("price"));
		int stock = Integer.parseInt(multiRequest.getParameter("stock"));
		String keywords = "";
		if(multiRequest.getParameterValues("keyword") != null) {
			String[] keyword = multiRequest.getParameterValues("keyword");
			keywords = String.join(",", keyword);
		}
		
		Product p = new Product();
		p.setProNo(no);
		p.setProName(name);
		p.setProCateCode(cate);
		p.setProMiddNo(midd);
		p.setPrice(price);
		p.setStock(stock);
		p.setKeyword(keywords);
		
		List<Attachment> list = new ArrayList<>();
		String mainPath = multiRequest.getParameter("image");
		if(multiRequest.getOriginalFileName("upfile2") != null) {
			// 첨부파일이 존재 할 경우
			// Attachment생성 + 원본명, 수정명, 경로, 파일레벨 담아서 => list에 추가
			Attachment at = new Attachment();
			at.setOriginName(multiRequest.getOriginalFileName("upfile2"));
			at.setChangeName(multiRequest.getFilesystemName("upfile2"));
			at.setFilePath("resources/thumbnail_upfiles/");
			at.setFileLevel(2);
			at.setRefBno(no);
			
			list.add(at);
		}
		p.setProMainImage(mainPath);
		int result = new ProductService().updateProduct(p, list);
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 상품이 수정되었습니다.");
		} else {
			request.getSession().setAttribute("alertMsg", "상품 수정에 실패했습니다.");
		}
		response.sendRedirect(request.getContextPath() + "/list.mpro?page=1");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
