package com.naver.cowork.mybatis.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.naver.cowork.domain.Member;
import com.naver.cowork.domain.Proboard_check_user;

import com.naver.cowork.domain.Project;
import com.naver.cowork.domain.Project_Board;
import com.naver.cowork.domain.Project_Board_Comment;
import com.naver.cowork.domain.Project_User;

@Mapper
public interface ProjectMapper {
	
	public List<Project> getProjectList(String id);

	public int insert(Project p);


	public Project insert_user(Project p);
	
	public List<Project_Board> getProjectDetailList();
	


	public int getListCount();

	public ArrayList<Project_User> getProjectUser(int project_num);

	public int getProjectUserCount(int project_num);

	public List<Project> getDeadLineProjects(String logingID);

	public List<Project_Board> getPojectBoardFeed(int pNum);

	public String getProjectName(int pNum);

	public int increaseCheck(int pbNum);

	public int getCheckCount(int pbNum);

	public int decreaseCheck(int pbNum);

	public String[] getProjectBookmarkList(int pNum);

	public String ProjectBookmarkCheckedClear(int pbNum);
	
	public int checkedClearBookmark(int pbNum);

	public int checkedBookmark(int pbNum);

	public String ProjectBookmarkChecked(int pbNum);

	public List<Proboard_check_user> getProBoardCheckUserList(String id);

	public void updateUserCheckInfo(HashMap<String, Object> map);

	public void updateUserCheckInfoClear(HashMap<String, Object> map);

	public int ProjectCommentAdd(Project_Board_Comment pbc);

	public List<Project_Board_Comment> getProjectCommentList(HashMap<String, Integer> map);

	public int commentDelete(int pbNum);

	public int ProjectCommentUpdate(Project_Board_Comment pbc);

	public int ProjectCommentReply(Project_Board_Comment pbc);

	public int getPjectCommentCount(int pbNum);

	public List<Project> getProjectListForMain();

	public int insertProjectBoard(Project_Board board);

	public List<Project> searchByKeyword(String keyword);

	public List<Project> getAllProjects();

	public List<Project> getProjectsByCreatorId(String creatorId);

}

