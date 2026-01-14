package com.formypet.common.template;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.formypet.common.model.vo.PageInfo;

public class PagingTemplate {

	/**
	 * 
	 * @param request 작성중인 서블릿의 request그대로 넣어주세요
	 * @param curPageKey 받아올 페이징처리의 첫 페이지수의 키 값을 적어주세요
	 * @param listCount 리스트의 총 길이를 구해서 넣어주세요
	 * @param pageLimit 보여질 페이지의 제한 길이 ex)5로 작성시 <|1|2|3|4|5|> 6으로 작성시 <|1|2|3|4|5|6|>
	 * @param boardLimit 리스트로 보여질 개수 5로 작성시 목록에 5개로 보임
	 * @return
	 */
	public PageInfo Paging(HttpServletRequest request, String curPageKey, int listCount, int pageLimit, int boardLimit) {
		int currentPage;	
		
		int maxPage; 		
		int startPage;		
		int endPage;
		
		currentPage = Integer.parseInt(request.getParameter(curPageKey));
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		return pi;
	}
}
