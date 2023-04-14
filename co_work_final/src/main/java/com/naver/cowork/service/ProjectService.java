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
import com.naver.cowork.domain.Project_Board_Comment;
import com.naver.cowork.domain.Project_User;

@Service
public interface ProjectService {
	
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
	
	public int insert(Project p);

	public List<Project_Board> getPojectBoardFeed(int pNum);

	public String getProjectName(int pNum);
	

	public Project insert_user(Project_User u);

	public List<Project_Board> getProjectDetailList();
	

	//@Transactional
	//public Project insert(Project p) {
		
	//}

	public int getDayCount(String startDate, String endDate);
	//public Project inser_user(Project_user u);

	public int increaseCheck(int pbNum, String id);


	public int decreaseCheck(int pbNum, String id);

	public String[] getProjectBookmarkList(int pNum);

	public String ProjectBookmarkCheckedClear(int pbNum);

	public String ProjectBookmarkChecked(int pbNum);

	public List<Proboard_check_user> getProBoardCheckUserList(String id);

	public int ProjectCommentAdd(Project_Board_Comment pbc);

	public List<Project_Board_Comment> getProjectCommentList(int pbNum, int page);

	public int commentDelete(int pbNum);

	public int ProjectCommentUpdate(Project_Board_Comment pbc);

	public int ProjectCommentReply(Project_Board_Comment pbc);

	public int getPjectCommentCount(int pbNum);

	public List<Project> getProjectListForMain();
	
	public List<Project> getProjectListWithProg(List<Project> list);

	public int insertProjectBoard(Project_Board board);

	public List<Project> searchByKeyword(String keyword);

	public List<Project> getAllProjects();

	public List<Project> getProjectsByCreatorId(String creatorId);

}
