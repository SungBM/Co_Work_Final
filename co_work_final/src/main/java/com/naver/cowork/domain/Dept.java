package com.naver.cowork.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Dept {
    private int dept_no;
    private String dept_name;
    private List<Member> deptUser;
    private int dept_order;

    public Dept(int dept_no, String dept_name) {
        this.dept_no = dept_no;
        this.dept_name = dept_name;
    }

    public Dept() {

    }
}
