package com.naver.cowork.mybatis.mapper;

import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.Job;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface JobMapper {

    public List<Job> jobAll();
    public int jmaxNo();
    public int delete(int job_no);
    public int insert(Job job);
    public List<Job> jobList();
    public String jobName(String user_id);
    public int jobNo(String user_id);
    public int jobCheck(Job job);




}
