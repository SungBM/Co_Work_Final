package com.naver.cowork.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.naver.cowork.domain.Project;
import com.naver.cowork.domain.Project_Board;
import com.naver.cowork.domain.Project_User;


@Mapper
public interface ProjectMapper {
	
	public List<Project> getProjectList(String id);

	public Project insert(Project p);

	public Project insert_user(Project p);
	
	public List<Project_Board> getProjectDetailList();
	
}