package com.naver.cowork.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Project;
import com.naver.cowork.mybatis.mapper.ProjectMapper;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	private ProjectMapper dao;
	
	
	@Autowired
	public ProjectServiceImpl(ProjectMapper dao) {
		this.dao = dao;
	}



	@Override
	public List<Project> getProjectList(String id) {
		List<Project> list = dao.getProjectList(id);
		System.out.println(list);
		return list;
	}

}
