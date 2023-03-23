package com.naver.cowork.domain;

public class Job {
    private int job_no;
    private String job_name;
    private int job_order;

    public Job(int job_no, String job_name) {
        this.job_no = job_no;
        this.job_name = job_name;
    }

    public Job() {
    }

    public int getJob_no() {
        return job_no;
    }

    public void setJob_no(int job_no) {
        this.job_no = job_no;
    }

    public String getJob_name() {
        return job_name;
    }

    public void setJob_name(String job_name) {
        this.job_name = job_name;
    }

    public int getJob_order() {
        return job_order;
    }

    public void setJob_order(int job_order) {
        this.job_order = job_order;
    }
}
