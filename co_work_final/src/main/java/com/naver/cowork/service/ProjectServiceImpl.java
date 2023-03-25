package com.naver.cowork.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Project;
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
		return 0;
	}

	@Override
	public int getDayCount(String date1, String date2) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Project> getDeadLineProjects(int page, int limit) {
		// TODO Auto-generated method stub
		return null;
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
		return dao.getProjectList(logingID);
	}

	
}




