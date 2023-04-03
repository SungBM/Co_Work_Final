package com.naver.cowork.mybatis.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.Member;
import com.naver.cowork.domain.Project;
import com.naver.cowork.domain.Project_Board;
import com.naver.cowork.domain.Project_User;

@Mapper
public interface ProjectMapper {
	public List<Project> getProjectList(String id);

	public Project insert(Project p);

	public int getListCount();

	public ArrayList<Project_User> getProjectUser(int project_num);

	public int getProjectUserCount(int project_num);

	public List<Project> getDeadLineProjects(String logingID);

	public List<Project_Board> getPojectBoardFeed(int pNum);

	public String getProjectName(int pNum);

	public int increaseCheck(int pbNum);

	public int getCheckCount(int pbNum);

	public int decreaseCheck(int pbNum);
}
