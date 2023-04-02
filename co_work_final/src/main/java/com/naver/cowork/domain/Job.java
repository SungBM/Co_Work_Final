package com.naver.cowork.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
}
