package com.formypet.event.model.service;

import static com.formypet.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.formypet.common.model.vo.Attachment;
import com.formypet.common.model.vo.PageInfo;
import com.formypet.event.model.dao.EventDao;
import com.formypet.event.model.vo.Event;
import com.formypet.event.model.vo.EventProduct;

public class EventService {
	EventDao eDao = new EventDao();
	
	public int selectListCount() {
		Connection conn = getConnection();
		int result = eDao.selectListCount(conn);
		close(conn);
		return result;
	}

	public List<Event> selectList(PageInfo pi) {
		Connection conn = getConnection();
		List<Event> list = eDao.selectList(conn, pi);
		close(conn);
		return list;
	}

	public int insertEvent(Event e, List<EventProduct> products, List<Attachment> list) {
		Connection conn = getConnection();
		int result = eDao.insertEvent(conn, e, products, list);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Event selectEventDetail(int eNo) { //이벤트 상품페이지
		Connection conn = getConnection();
		Event ev = eDao.selectEventDetail(conn,eNo);
		close(conn);
		return ev;
	}


	public List<Event> selectDetailEvent() {
		Connection conn = getConnection();
		List<Event> list = eDao.selectDetailEvent(conn);
		close(conn);
		return list;
	}

	public List<Event> selectEventList(PageInfo pi) {
		Connection conn = getConnection();
		List<Event> list = eDao.selectEventList(conn,pi);
		close(conn);
		return list;
	}

}
	
