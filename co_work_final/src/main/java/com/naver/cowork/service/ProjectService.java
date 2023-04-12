package com.naver.cowork.service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.naver.cowork.domain.Proboard_check_user;
import com.naver.cowork.domain.Project;
import com.naver.cowork.domain.Project_Board;
import com.naver.cowork.domain.Project_User;
import com.naver.cowork.mybatis.mapper.ProjectMapper;

@Service
public interface ProjectService {
	
	public int insertProjectBoard(Project_Board board);
	
	public void close(PreparedStatement pstmt, Connection conn);

	public void all_close(ResultSet rs, PreparedStatement pstmt, Connection conn);

	public int getListCount();

	public List<Project> getDeadLineProjects(String logingID);

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
	
	public Project_User insert_user(Project_User u);

	public List<Project_Board> getPojectBoardFeed(int pNum);

	public String getProjectName(int pNum);
	
	public List<Project_Board> getProjectDetailList();
	

    public List<Project_Board> getProjectBoardList();

	

	public int getDayCount(String startDate, String endDate);
	//public Project inser_user(Project_user u);

	public int increaseCheck(int pbNum, String id);


	public int decreaseCheck(int pbNum, String id);

	public String[] getProjectBookmarkList(int pNum);

	public String ProjectBookmarkCheckedClear(int pbNum);

	public String ProjectBookmarkChecked(int pbNum);

	public List<Proboard_check_user> getProBoardCheckUserList(String id);

	public List<Project> searchByKeyword(String keyword);
	
	public List<Project> getAllProjects();
	
	public List<Project> getProjectsByCreatorId(String creatorId);
	
	public List<Project> getFilteredProjects(String filter);
}



		



