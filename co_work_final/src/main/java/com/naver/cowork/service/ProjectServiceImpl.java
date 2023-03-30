package com.naver.cowork.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
	public int getDayCount(String date1, String date2) {
		// TODO Auto-generated method stub
		return 0;
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
	public List<Project_Board> getPojectBoardFeed(int p_num) {
		return dao.getPojectBoardFeed(p_num);
	}

	@Override
	public String getProjectName(int p_num) {
		// TODO Auto-generated method stub
		return dao.getProjectName(p_num);
	}
}




