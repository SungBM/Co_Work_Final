package com.naver.cowork.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.Project;


@Mapper
public interface ProjectMapper {
	
	public List<Project> getProjectList(String id);

	public Project insert(Project p);
	
}
