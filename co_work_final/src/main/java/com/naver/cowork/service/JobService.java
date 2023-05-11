package com.naver.cowork.service;

import com.naver.cowork.domain.Job;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface JobService {

    public List<Job> jobAll();

    public int jmaxNo();

    public int delete(int job_no);

    public int insert(Job job);

    public List<Job> jobList();

    public String jobName(String user_id);
    public int jobNo(String user_id);


    public int jobCheck(Job job);
}
