package com.naver.cowork.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.Job;

@Mapper
public interface JobMapper {

    public List<Job> jobAll();
    public int jmaxNo();
    public int delete(int job_no);
    public int insert(Job job);
    public List<Job> jobList();
    public String jobName(String user_id);
    public int jobNo(String user_id);




}
