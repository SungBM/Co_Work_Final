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

}
