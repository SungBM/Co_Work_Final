package com.naver.cowork.service;

import com.naver.cowork.domain.Job;
import com.naver.cowork.mybatis.mapper.JobMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobServiceImpl implements JobService {

    private JobMapper dao;

    @Autowired
    public JobServiceImpl(JobMapper dao) {
        this.dao = dao;
    }


    public List<Job> jobAll() {
        return dao.jobAll();
    }

    public int jmaxNo() {
        return dao.jmaxNo();
    }

    public int delete(int job_no) {
        return dao.delete(job_no);
    }

    public int insert(Job job) {
        return dao.insert(job);
    }

}