package com.formypet.event.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.formypet.common.model.vo.Attachment;
import com.formypet.common.model.vo.PageInfo;
import com.formypet.event.model.vo.Event;
import com.formypet.event.model.vo.EventProduct;

import static com.formypet.common.template.JDBCTemplate.*;

public class EventDao {
	private Properties prop = new Properties();
	
	public EventDao() {
		try {
			prop.loadFromXML(new FileInputStream(EventDao.class.getResource("/db/mappers/event-mapper.xml").getPath()));
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

	public List<Event> selectList(Connection conn, PageInfo pi) {
		List<Event> list = new ArrayList<>();
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
				Event e = new Event();
				e.setEventNo(rset.getInt("event_no"));
				e.setEventTitle(rset.getString("event_title"));
				e.setStartDate(rset.getString("start_date"));
				e.setEndDate(rset.getString("end_date"));
				e.setEventShow(rset.getString("event_show"));
				e.setStatus(rset.getString("status"));
				e.setEventMainImgPath(rset.getString("file_path") + rset.getString("change_name"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertEvent(Connection conn, Event e, List<EventProduct> products, List<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		sql = prop.getProperty("insertEvent");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, e.getEventTitle());
			pstmt.setString(2, e.getStartDate());
			pstmt.setString(3, e.getEndDate());
			pstmt.setString(4, e.getEventShow());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		sql = prop.getProperty("insertEventProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			for(EventProduct ep : products) {
				pstmt.setInt(1, ep.getProNo());
				pstmt.setInt(2, ep.getDiscount());
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e2) {
			e2.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		sql = prop.getProperty("insertAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			for(Attachment a : list) {
				pstmt.setString(1, a.getOriginName());
				pstmt.setString(2, a.getChangeName());
				pstmt.setString(3, a.getFilePath());
				pstmt.setInt(4, a.getFileLevel());
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		sql = prop.getProperty("updateProductType");
		try {
			pstmt = conn.prepareStatement(sql);
			for(EventProduct ep : products) {
				pstmt.setInt(1, ep.getProNo());
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Event selectEventDetail(Connection conn, int eNo) {
		Event ev = new Event();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDetailEvent")+"where e.status = 'Y' and event_no = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ev.setEventNo(rset.getInt("event_no"));
				ev.setEventTitle(rset.getString("event_title"));
				ev.setEventShow(rset.getString("event_show"));
				ev.setStatus(rset.getString("status"));
				ev.setStatus(rset.getString("status"));
				ev.setEventMainImgPath(rset.getString("file_path")+rset.getString("change_name"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return ev;
	}

	public List<Event> selectDetailEvent(Connection conn) {
		List<Event> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDetailEvent")+"where event_show = 'Y' ORDER BY event_no asc";
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Event e = new Event();
				e.setEventNo(rset.getInt("event_no"));
				e.setEventTitle(rset.getString("event_title"));
				e.setStartDate(rset.getString("start_date"));
				e.setEndDate(rset.getString("end_date"));
				e.setEventShow(rset.getString("event_show"));
				e.setStatus(rset.getString("status"));
				e.setEventMainImgPath(rset.getString("file_path")+rset.getString("change_name"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public List<Event> selectEventList(Connection conn, PageInfo pi) {
		List<Event> list = new ArrayList<>();
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
				Event e = new Event();
				e.setEventNo(rset.getInt("event_no"));
				e.setEventTitle(rset.getString("event_title"));
				e.setStartDate(rset.getString("start_date"));
				e.setEndDate(rset.getString("end_date"));
				e.setEventShow(rset.getString("event_show"));
				e.setStatus(rset.getString("status"));
				e.setEventMainImgPath(rset.getString("file_path") + rset.getString("change_name"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
