package com.naver.cowork.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Project;
import com.naver.cowork.domain.Project_User;

@Service
public interface ProjectService {
	
	public void close(PreparedStatement pstmt, Connection conn);

	public void all_close(ResultSet rs, PreparedStatement pstmt, Connection conn);

	public int getListCount();

	public int getDayCount(String date1, String date2);

	public List<Project> getDeadLineProjects(int page, int limit);

	public List<Project> getProjectList(String logingID);

	private int getIsAdmin(String id) {
		return 0;
	}
	
	private int getModalCount(int pro_num) {
		return 0;
	}

	private ArrayList<Project_User> getParticipants(int pro_num) {
		return null;
	}

	public Project getDetailProject();

	public Project insert(Project p);
	
	//public Project inser_user(Project_user u);


}
