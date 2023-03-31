package com.naver.cowork.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Project;
import com.naver.cowork.domain.Project_Board;
import com.naver.cowork.domain.Project_User;
import com.naver.cowork.mybatis.mapper.ProjectMapper;

@Service
public class ProjectServiceImpl implements ProjectService {

	private ProjectMapper dao;

	@Autowired
	public ProjectServiceImpl(ProjectMapper dao, PasswordEncoder passwordEncoder) {
		this.dao = dao;
	}

	@Override
	public void close(PreparedStatement pstmt, Connection conn) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void all_close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return dao.getListCount();
	}

	@Override
	public Project getDetailProject() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Project insert(Project p) {
		// TODO Auto-generated method stub
		return dao.insert(p);
	}

	@Override
	public List<Project> getProjectList(String logingID) {
		// TODO Auto-generated method stub
		List<Project> list = null;
		list = dao.getProjectList(logingID);
		list = getProject_UserInfo(list);
		
		return list;
	}
	

	@Override
	public List<Project> getDeadLineProjects(String logingID) {
		List<Project> list = dao.getDeadLineProjects(logingID);
		list = getProject_UserInfo(list);
	
		return list;
	}

	public List<Project> getProject_UserInfo(List<Project> list) {
		for(Project p : list) {
			ArrayList<Project_User> user_list = dao.getProjectUser(p.getProject_num());
			int user_count = dao.getProjectUserCount(p.getProject_num());
			p.setProject_parti(user_list);
			p.setParti_count(user_count);
			p.setProject_parti_forModal(user_list);
		}
		
		return list;
	}

	@Override
	public List<Project_Board> getPojectBoardFeed(int pNum) {
		return dao.getPojectBoardFeed(pNum);
	}

	@Override
	public String getProjectName(int pNum) {
		// TODO Auto-generated method stub
		return dao.getProjectName(pNum);
	}
	
	@Override
	public int getDayCount(String startDate, String endDate) {
		int dayCount = 0;

		SimpleDateFormat sdf = new SimpleDateFormat(DateUtil.DATE_FORMAT);
		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());
		try {
			Date startFormat = sdf.parse(startDate);
			Date endFormat = sdf.parse(endDate);
			Date todayformat = sdf.parse(strToday);
			long diffSec = (endFormat.getTime() - startFormat.getTime()) / 1000; //초 차이
			long all_Days_diff = diffSec / (24*60*60); //일자수 차이

			long today_diff_sec = (endFormat.getTime() - todayformat.getTime()) / 1000;
			long today_diff = today_diff_sec / (24*60*60);

			double all_days = all_Days_diff;
			double today =  today_diff;
			dayCount = 100-(int)((today / all_days)*100 );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dayCount;
	}

	@Override
	public int increaseCheck(int pbNum) {
		
		int re = dao.increaseCheck(pbNum);
		if(re == 1 ) {
			return dao.getCheckCount(pbNum);
		} else {
			return 0;
		}
		
	}

	@Override
	public int decreaseCheck(int pbNum) {
		int re = dao.decreaseCheck(pbNum);
		if(re == 1 ) {
			return dao.getCheckCount(pbNum);
		} else {
			return 0;
		}
	}
}




