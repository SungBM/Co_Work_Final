package com.naver.cowork.domain;

public class Dept {
    private int dept_no;
    private String dept_name;
    private int dept_order;

    public Dept(int dept_no, String dept_name) {
        this.dept_no = dept_no;
        this.dept_name = dept_name;
    }

    public Dept() {

    }

    public int getDept_no() {
        return dept_no;
    }

    public void setDept_no(int dept_no) {
        this.dept_no = dept_no;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    public int getDept_order() {
        return dept_order;
    }

    public void setDept_order(int dept_order) {
        this.dept_order = dept_order;
    }
}
