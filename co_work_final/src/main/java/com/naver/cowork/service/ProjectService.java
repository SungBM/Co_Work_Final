package com.naver.cowork.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Project;

@Service
public interface ProjectService {
	public List<Project> getProjectList(String id);
}
