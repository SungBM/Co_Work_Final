package com.naver.cowork.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naver.cowork.domain.Job;
import com.naver.cowork.mybatis.mapper.JobMapper;

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

    @Transactional
    public int delete(int job_no) {
        return dao.delete(job_no);
    }

    @Transactional
    public int insert(Job job) {
        return dao.insert(job);
    }
    
    //@Cacheable(value = "jobList")
    public List<Job> jobList() {
        return dao.jobList();
    }

    public String jobName(String user_id) {
        return dao.jobName(user_id);
    }

    public int jobNo(String user_id) {
        return dao.jobNo(user_id);
    }

    public int jobCheck(Job job){
        return dao.jobCheck(job);
    }

}