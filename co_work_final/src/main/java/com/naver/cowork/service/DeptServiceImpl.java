package com.naver.cowork.service;

import com.naver.cowork.domain.Dept;
import com.naver.cowork.mybatis.mapper.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    private DeptMapper dao;

    @Autowired
    public DeptServiceImpl(DeptMapper dao) {
        this.dao = dao;
    }


    public List<Dept> deptAll() {
        return dao.deptAll();
    }

    public int dmaxNo() {
        return dao.dmaxNo();
    }

    public int delete(int dept_no) {
        return dao.delete(dept_no);
    }

    public int insert(Dept dept) {
        return dao.insert(dept);
    }

}