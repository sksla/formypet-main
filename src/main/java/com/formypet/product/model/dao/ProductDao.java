package com.formypet.product.model.dao;

import static com.formypet.common.template.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.formypet.board.model.vo.Review;
import com.formypet.common.model.vo.Attachment;
import com.formypet.common.model.vo.PageInfo;
import com.formypet.product.model.vo.Product;
import com.formypet.product.model.vo.Stock;


public class ProductDao {
	private Properties prop = new Properties();

	public ProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/mappers/product-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int selectListCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int selectSearchListCount(Connection conn, String[] category, String middle, String search) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String cate = "";
		if(category.length > 1) {
			for(int i = 0; i < category.length; i++) {
				if(i == category.length - 1) {
					cate += "\'" + category[i] + "\'";
				} else {
					cate += "\'" + category[i] + "\',";
				}
			}			
		}else {
			cate = "\'" + category[0] + "\'";
		}
		String sql = prop.getProperty("selectListCount") 
				   + "and pro_midd_no in (" + middle + ") \n and pro_cate_code in (" + cate + ") and pro_name like \'%" + search + "%\'";
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public List<Product> selectList(Connection conn, PageInfo pi) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Product(rset.getInt("pro_no")
						, rset.getString("pro_name")
						, rset.getString("pro_cate_code")
						, rset.getInt("pro_midd_no")
						, rset.getInt("price")
						, rset.getInt("stock")
						, rset.getInt("discount")
						, rset.getString("status")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}

	public int insertProduct(Connection conn, Product p, boolean checkUpdate) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = checkUpdate ? prop.getProperty("updateProduct") : prop.getProperty("insertProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProName());
			pstmt.setString(2, p.getProCateCode());
			pstmt.setInt(3, p.getProMiddNo());
			pstmt.setInt(4, p.getPrice());
			pstmt.setInt(5, p.getStock());
			pstmt.setString(6, p.getKeyword());
			pstmt.setString(7, p.getProMainImage());

			if(checkUpdate) {
				pstmt.setInt(8, p.getProNo());
			}

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int insertAttachment(Connection conn, List<Attachment> list, boolean checkUpdate) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = checkUpdate ? prop.getProperty("updateAttachment") : prop.getProperty("insertAttachment");
		try {
			for(Attachment at : list) { 
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());

				if(checkUpdate) {
					pstmt.setInt(5, at.getRefBno());
				}

				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Product> selectProductList(Connection conn, String kind,PageInfo pi) { // 사용자
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");

		try {
			pstmt=conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setString(1,kind);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				Product p = new Product(
						rset.getInt("pro_no")
						, rset.getString("pro_name")
						, rset.getInt("price")
						, rset.getInt("stock")
						, rset.getString("status")
						, rset.getString("pro_main_image")
						, rset.getInt("discount")
						, rset.getInt("star")
						, rset.getInt("re_count")

						);
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);

		}

		return list;
	}


	public Product selectProduct(Connection conn, int no) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p = new Product();
				p.setProNo(rset.getInt("pro_no"));
				p.setProName(rset.getString("pro_name"));
				p.setProCateCode(rset.getString("pro_cate_code"));
				p.setProMiddNo(rset.getInt("pro_midd_no"));
				p.setPrice(rset.getInt("price"));
				p.setStock(rset.getInt("stock"));
				p.setStatus(rset.getString("status"));
				p.setKeyword(rset.getString("keyword"));
				p.setProMainImage(rset.getString("pro_main_image"));
				p.setStar(rset.getInt("star"));
				p.setDiscount(rset.getInt("discount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	public List<Attachment> selectAttachment(Connection conn, int no) {
		List<Attachment> at = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Attachment a = new Attachment();
				a.setOriginName(rset.getString("origin_name"));
				a.setRefBno(rset.getInt("ref_bno"));
				a.setRefType(rset.getString("ref_type"));
				a.setChangeName(rset.getString("change_name"));
				a.setFilePath(rset.getString("file_path"));
				a.setFileLevel(rset.getInt("file_level"));

				at.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}
	public List<Product> searchProductList(Connection conn, PageInfo pi, String[] category, String middle, String search) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("searchProductList");

		sql += "and pro_cate_code in (";
		for(int i = 0; i < category.length; i++) {
			if(i == category.length - 1) {
				sql += "\'" + category[i] + "\'";
			} else {
				sql += "\'" + category[i] + "\',";
			}
		}
		sql += ") and pro_midd_no in (" + middle+ ")";
		sql += "order by pro_no desc) A ) where RNUM BETWEEN ? AND ?";
		String frontSql = "SELECT * FROM ( SELECT ROWNUM RNUM, A.* FROM(";
		sql = frontSql + sql;


		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Product(rset.getInt("pro_no")
						, rset.getString("pro_name")
						, rset.getString("pro_cate_code")
						, rset.getInt("pro_midd_no")
						, rset.getInt("price")
						, rset.getInt("stock")
						, rset.getInt("discount")
						, rset.getString("status")
						));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public List<Product> selectBestList(Connection conn) { // 사용자
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String spl = prop.getProperty("selectBestList");

		try {
			pstmt = conn.prepareStatement(spl);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Product p = new Product(
						rset.getInt("pro_no")
						, rset.getString("pro_name")
						, rset.getInt("price")
						, rset.getInt("stock")
						, rset.getString("status")
						, rset.getString("pro_main_image")
						, rset.getInt("discount")
						, rset.getInt("star")
						, rset.getInt("re_count")

						);
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public List<Product> selectEventList(Connection conn,PageInfo pi) { // 사용자
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String spl = prop.getProperty("selectEventList");

		try {
			pstmt = conn.prepareStatement(spl);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			while(rset.next()) {
				Product p = new Product(
						rset.getInt("pro_no")
						, rset.getString("pro_name")
						, rset.getInt("price")
						, rset.getInt("stock")
						, rset.getString("status")
						, rset.getString("pro_main_image")
						, rset.getInt("discount")
						, rset.getInt("star")
						, rset.getInt("re_count")

						);
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int selectKindCount(Connection conn,String kind) { // 사용자
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount")+ "AND PRO_CATE_CODE IN ('A','"+ kind +"')";
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int selectStockListCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStockListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int selectECount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount")+ "AND STATUS = 'E'";
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;

	}
	public List<Stock> selectStockList(Connection conn, PageInfo pi) {
		List<Stock> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStockList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				String main = "";
				String status = "";
				//대분류
				if(rset.getString("pro_cate_code").charAt(0) == 'A') {
					main = "공통";
				} else if(rset.getString("pro_cate_code").charAt(0) == 'D') {
					main = "강아지";
				} else {
					main = "고양이";
				}
				//입출고 상태값 받기
				if(rset.getString("status").charAt(0) == 'I') {
					status = "입고";
				} else {
					status = "출고";
				}
				
				Stock s = new Stock();
				s.setProNo(rset.getInt("pro_no"));
				s.setProMain(main);
				s.setProSub(rset.getInt("pro_midd_no") == 1 ? "사료" : rset.getInt("pro_midd_no") == 2 ? "간식" : "용품");
				s.setStatus(status);
				s.setCount(rset.getInt("count"));
				s.setProName(rset.getString("pro_name"));
				s.setEnrollDate(rset.getDate("enroll_date"));
				s.setStock(rset.getInt("stock"));
				list.add(s);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public List<Product> selectCateProduct(Connection conn, String cate, PageInfo pi, String kind) {// 사용자
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCateProduct");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setString(1, kind);
			pstmt.setString(2,"%"+cate+"%");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Product p = new Product(
						rset.getInt("pro_no")
						, rset.getString("pro_name")
						, rset.getInt("price")
						, rset.getInt("stock")
						, rset.getString("status")
						, rset.getString("pro_main_image")
						, rset.getInt("discount")
						, rset.getInt("star")
						, rset.getInt("re_count")

						);
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	public int selectSearchStockCount(Connection conn, Stock s, Date dateStart, Date dateEnd) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStockListCount")
				   + "join product using(pro_no)"
				   + "where pro_cate_code = \'" + s.getProMain() + "\'"
				   + "and pro_midd_no = \'" + s.getProSub() + "\'"
				   + "and s.status = \'" + s.getStatus() + "\'"
				   + "and pro_name like \'%" + s.getProName() + "%\'"
				   + "and s.enroll_date between \'" + dateStart + "\' and \'" + dateEnd +"\'";
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}
	
	public int selectCateCount(Connection conn,String kind, String cate) { // 사용자
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount")+ "AND PRO_CATE_CODE IN ('A','"+ kind +"')"
														+ "AND KEYWORD LIKE '%"+cate+"%'";
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public List<Stock> selectStockList(Connection conn, PageInfo pi, Stock s, Date dateStart, Date dateEnd) {
		List<Stock> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStockSearchList");
		System.out.println(s.getProName() + "빈칸인가요");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getProMain());
			pstmt.setString(2, s.getProSub());
			pstmt.setString(3, s.getStatus());
			pstmt.setString(4, "%" + s.getProName() + "%");
			pstmt.setDate(5, dateStart);
			pstmt.setDate(6, dateEnd);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(7, startRow);
			pstmt.setInt(8, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				String main = "";
				String status = "";
				//대분류
				if(rset.getString("pro_cate_code").charAt(0) == 'A') {
					main = "공통";
				} else if(rset.getString("pro_cate_code").charAt(0) == 'D') {
					main = "강아지";
				} else {
					main = "고양이";
				}
				//입출고 상태값 받기
				if(rset.getString("status").charAt(0) == 'I') {
					status = "입고";
				} else {
					status = "출고";
				}
				
				s = new Stock();
				s.setProNo(rset.getInt("pro_no"));
				s.setProMain(main);
				s.setProSub(rset.getInt("pro_midd_no") == 1 ? "사료" : rset.getInt("pro_midd_no") == 2 ? "간식" : "용품");
				s.setStatus(status);
				s.setProName(rset.getString("pro_name"));
				s.setEnrollDate(rset.getDate("enroll_date"));
				s.setCount(rset.getInt("count"));
				s.setStock(rset.getInt("stock"));
				list.add(s);
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public int insertStock(Connection conn, Stock s) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertStock");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s.getProNo());
			pstmt.setInt(2, s.getCount());
			pstmt.setDate(3, s.getEnrollDate());
			pstmt.setString(4, s.getStatus());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public List<Product> searchKeywordList(String cate, String keyword, String kind, Connection conn) { // 사용자
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		try {
			  if(cate.equals("0")) {
		            sql = prop.getProperty("searchKeywordList") + "WHERE PRO_CATE_CODE IN ('A',?) "
		            											+ "AND (KEYWORD LIKE ? OR PRO_NAME LIKE ?) "
		            											+ "GROUP BY PRO_NO, PRO_NAME, PRICE, STOCK, P.STATUS, PRO_MAIN_IMAGE, DISCOUNT "
											        			+ "ORDER BY PRO_NO DESC";
		           
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setString(1, kind);
		            pstmt.setString(2, "%" + keyword + "%");
		            pstmt.setString(3, "%" + keyword + "%");
		        } else {
		        	sql = prop.getProperty("searchKeywordList") + " WHERE PRO_CATE_CODE IN ('A', ?) "
											        			+ "AND PRO_MIDD_NO = ? "
											        			+ "AND (KEYWORD LIKE ? OR PRO_NAME LIKE ?) "
											        			+ "GROUP BY PRO_NO, PRO_NAME, PRICE, STOCK, P.STATUS, PRO_MAIN_IMAGE, DISCOUNT "
											        			+ "ORDER BY PRO_NO DESC";
		         
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setString(1, kind);
		            pstmt.setString(2, cate);
		            pstmt.setString(3, "%" + keyword + "%");
		            pstmt.setString(4, "%" + keyword + "%");
		        }
			  rset = pstmt.executeQuery();
					  
			while(rset.next()) {
				Product p = new Product(
						rset.getInt("pro_no")
						, rset.getString("pro_name")
						, rset.getInt("price")
						, rset.getInt("stock")
						, rset.getString("status")
						, rset.getString("pro_main_image")
						, rset.getInt("discount")
						, rset.getInt("star")
						, rset.getInt("re_count")

						);
				list.add(p);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public List<Product> selectMainBestList(Connection conn) { // 사용자
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset=null;
		String sql = prop.getProperty("selectMainBestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product(
						rset.getInt("pro_no")
						, rset.getString("pro_name")
						, rset.getInt("price")
						, rset.getInt("stock")
						, rset.getString("status")
						, rset.getString("pro_main_image")
						, rset.getInt("discount")
						, rset.getInt("star")
						, rset.getInt("re_count")

						);
				list.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public List<Product> selectMainEventList(Connection conn) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset=null;
		String sql = prop.getProperty("selectMainEventList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product(
						rset.getInt("pro_no")
						, rset.getString("pro_name")
						, rset.getInt("price")
						, rset.getInt("stock")
						, rset.getString("status")
						, rset.getString("pro_main_image")
						, rset.getInt("discount")
						, rset.getInt("star")
						, rset.getInt("re_count")

						);
				list.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 상품 상세 페이지 리뷰 부분
	public List<Review> selectProReviewList(Connection conn, int proNo) { // 사용자
		List<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			
			rset = pstmt.executeQuery();
			int i = 0; // 첫행 일때 | list.add(r) 했을 때
			while(rset.next()) {
				
				int currReNo = rset.getInt("re_no");
				
				if(i != 0 && list.get(i-1).getReNo() == currReNo) { // 첫 행이 아니고 전행의 글번호와 현 행의 글번호가 같다(전행에 이미 리뷰객체 생성됨 &첨부파일이 여러개, 전행에서 atList 생성되어있음)
					// 첨부파일 이 있다
					Attachment at = new Attachment();
					// 첨부파일관련값 담고 
					at.setFileNo(rset.getInt("file_no"));
					at.setRefBno(rset.getInt("ref_bno"));
					at.setRefType(rset.getString("ref_type"));
					at.setOriginName(rset.getString("origin_name"));
					at.setChangeName(rset.getString("change_name"));
					at.setFilePath(rset.getString("file_path"));
					at.setFileLevel(rset.getInt("file_level"));
					
					// list의 전인덱스의 atList에 추가
					list.get(i-1).getAtList().add(at);
					
				}else { // 첫 행 | 전행의 글번호화 현 행의 글번호가 다르다
					
					// 리뷰객체 생성
					Review r = new Review();
					
					// 글번호(currReNo)담기
					r.setReNo(currReNo);
					
					// 다른값들도 담기
					r.setProNo(rset.getInt("pro_no"));
					r.setProName(rset.getString("pro_name"));
					r.setReWriter(rset.getString("user_id"));
					r.setReTitle(rset.getString("re_title"));
					r.setReContent(rset.getString("re_content"));
					r.setReStar(rset.getInt("re_star"));
					r.setEnrollDate(rset.getString("enroll_date"));
					r.setReadCount(rset.getInt("read_count"));
					r.setStatus(rset.getString("status"));
					r.setMacroNo(rset.getInt("macro_no"));
					r.setReview(rset.getString("review"));
					
					
					String changeName = rset.getString("change_name");
					if(changeName != null) { // 첨부파일이 있다.
						List<Attachment> atList = new ArrayList<>();
						Attachment at = new Attachment();
						// 첨부파일관련값 담고 
						at.setFileNo(rset.getInt("file_no"));
						at.setRefBno(rset.getInt("ref_bno"));
						at.setRefType(rset.getString("ref_type"));
						at.setOriginName(rset.getString("origin_name"));
						at.setChangeName(rset.getString("change_name"));
						at.setFilePath(rset.getString("file_path"));
						at.setFileLevel(rset.getInt("file_level"));
						
						atList.add(at);
						
						r.setAtList(atList);
					}
					
					list.add(r);
					i++;
				}
			
				 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 상품 상세 페이지 리뷰 페이징
	public int selectProReviewListCount(Connection conn, int proNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	public int selectWishProduct(Connection conn, int proNo, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWishProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, proNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = 1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	public Product selectProductOrder(Connection conn, int pNo) {
		Product p = new Product();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,pNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p.setProName(rset.getString("pro_name"));
				p.setPrice(rset.getInt("price"));
				p.setProMainImage(rset.getString("pro_main_image"));
				p.setStatus(rset.getString("status"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return p;
	}

	public int deleteProduct(Connection conn, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
