package com.formypet.common.template;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {

	// 1. Connection 객체 생성 (== db에 접속) 후 해당 Connection 객체 반환
	public static Connection getConnection() {
		
		Connection conn = null;
		Properties prop = new Properties();
		
		// 읽어들이고자 하는 파일 : driver.properties(src/main/java 안에 있는 파일 X, src/main/webapp/WEB-INF/classes 안의 파일)
		// 해당 파일의 물리적인 경로
		
		String filePath = JDBCTemplate.class.getResource("/db/driver/driver.properties").getPath();
		
		//System.out.println(filePath);
		try {
			prop.load(new FileInputStream(filePath));			
			
			//jdbc driver 등록
			Class.forName(prop.getProperty("driver"));
			//접속하고자하는 db의 url, 계정명, 비번 제시해서 db에 접속 (Connection생성)
			conn = DriverManager.getConnection(prop.getProperty("url")
												,prop.getProperty("username")
												,prop.getProperty("password"));
			
			conn.setAutoCommit(false);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
	// 2. Connection 을 이용해서 커밋처리해주는 메소드
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// 3. Connection 을 이용해서 롤백처리해주는 메소드
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 4. Connection 객체 반납하는 메소드
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 5. Statement 관련 객체 반납하는 메소드
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 6. ResultSet 객체 반납하는 메소드
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
