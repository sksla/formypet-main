package com.formypet.product.model.service;

import static com.formypet.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import com.formypet.board.model.vo.Review;
import com.formypet.common.model.vo.Attachment;
import com.formypet.common.model.vo.PageInfo;
import com.formypet.product.model.dao.ProductDao;
import com.formypet.product.model.vo.Product;
import com.formypet.product.model.vo.Stock;

public class ProductService {

	ProductDao pDao = new ProductDao();
	
	public int selectListCount() {
		Connection conn = getConnection();
		int result = pDao.selectListCount(conn);
		close(conn);
		return result;
	}
	
	public int selectSearchListCount(String[] category, String middle, String search) {
		Connection conn = getConnection();
		int result = pDao.selectSearchListCount(conn, category, middle, search);
		close(conn);
		return result;
	}

	public List<Product> selectList(PageInfo pi) {
		Connection conn = getConnection();
		List<Product> product = pDao.selectList(conn, pi);
		close(conn);
		return product;
	}


	public int insertProduct(Product p, List<Attachment> list) {
		Connection conn = getConnection();
		int result1 = pDao.insertProduct(conn, p, false);
		int result2 = pDao.insertAttachment(conn, list, false);			
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	public List<Product> selectProductList(String kind, PageInfo pi) { // 사용자 
		Connection conn = getConnection();
		List<Product> list = pDao.selectProductList(conn, kind, pi);
		close(conn);
		
		return list;

	}


	public Product selectProduct(int no) { // 사용자, 관리자
		Connection conn = getConnection();
		Product p = pDao.selectProduct(conn, no);
		close(conn);
		return p;
	}

	public List<Attachment> selectAttachment(int no) { // 사용자, 관리자
		Connection conn = getConnection();
		List<Attachment> at = pDao.selectAttachment(conn, no);
		close(conn);
		return at;
	}

	public int updateProduct(Product p, List<Attachment> list) {
		Connection conn = getConnection();
		int result1 = pDao.insertProduct(conn, p, true);
		int result2 = 0;
		if(list.isEmpty()) {
			result2 = 1;
		} else {
			result2 = pDao.insertAttachment(conn, list, true);						
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

	public List<Product> searchProductList(PageInfo pi, String[] category, String middle, String search) {
		Connection conn = getConnection();
		List<Product> list = pDao.searchProductList(conn, pi, category, middle, search);
		close(conn);
		
		return list;
	}

	public List<Product> selectBestList() { // 사용자
		Connection conn = getConnection();
		List<Product> list = pDao.selectBestList(conn);
		close(conn);
		return list;
	}

	public List<Product> selectEventList(PageInfo pi) { // 사용자
		Connection conn = getConnection();
		List<Product> list = pDao.selectEventList(conn,pi);
		close(conn);
		return list;
	}
	public int selectKindCount(String kind) { // 사용자
		Connection conn = getConnection();
		int result = pDao.selectKindCount(conn, kind);
		close(conn);
		return result;
	}
	public int selectECount() { // 사용자 
		Connection conn = getConnection();
		int result = pDao.selectECount(conn);
		close(conn);
		return result;
	}

	public int selectStockListCount() {
		Connection conn = getConnection();
		int result = pDao.selectStockListCount(conn);
		close(conn);
		return result;
	}

	public List<Stock> selectStockList(PageInfo pi) {
		Connection conn = getConnection();
		List<Stock> stock = pDao.selectStockList(conn, pi);
		close(conn);
		return stock;
	}

	public List<Product> selectCateProduct(String cate, PageInfo pi, String kind) { // 사용자
		Connection conn = getConnection();
		List<Product> list = pDao.selectCateProduct(conn, cate, pi, kind);
		close(conn);
		return list;
	}
	public int selectCateCount(String kind, String cate) { // 사용자
		Connection conn = getConnection();
		int result = pDao.selectCateCount(conn, kind, cate);
		close(conn);
		return result;
	}
	
	public int selectSearchStockCount(Stock s, Date dateStart, Date dateEnd) {
		Connection conn = getConnection();
		int result = pDao.selectSearchStockCount(conn, s, dateStart, dateEnd);
		close(conn);
		return result;
	}

	public List<Stock> selectSearchStockList(PageInfo pi, Stock s, Date dateStart, Date dateEnd) {
		Connection conn = getConnection();
		List<Stock> stock = pDao.selectStockList(conn, pi, s, dateStart, dateEnd);
		close(conn);
		return stock;
	}

	public int insertStock(Stock s) {
		Connection conn = getConnection();
		int result = pDao.insertStock(conn, s);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<Product> searchKeywordList(String cate, String keyword, String kind) {
		Connection conn = getConnection();
		List<Product> list = pDao.searchKeywordList(cate,keyword,kind,conn);
		close(conn);
		return list;
	}

	public List<Product> selectMainBestList() {
		Connection conn = getConnection();
		List<Product> list = pDao.selectMainBestList(conn);
		close(conn);
		return list;
	}

	public List<Product> selectMainEventList() {
		Connection conn = getConnection();
		List<Product> list = pDao.selectMainEventList(conn);
		close(conn);
		return list;
	}

	public List<Review> selectProReviewList(int proNo) {
		Connection conn = getConnection();
		List<Review> list = pDao.selectProReviewList(conn,proNo);
		close(conn);
		return list;
	}

	public int selectProReviewCount(int proNo) {
		Connection conn = getConnection();
		int result = pDao.selectProReviewListCount(conn, proNo);
		close(conn);
		return result;
	}

	public int selectWishProduct(int proNo, int userNo) {
		Connection conn = getConnection();
		int result = pDao.selectWishProduct(conn, proNo, userNo);
		close(conn);
		return result;
	}

	public Product selectProductOrder(int pNo) {
		Connection conn = getConnection();
		Product p = pDao.selectProductOrder(conn, pNo);
		close(conn);
		return p;
	}

	public int deleteProduct(int no) {
		Connection conn = getConnection();
		int result = pDao.deleteProduct(conn, no);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	
	
	
}
