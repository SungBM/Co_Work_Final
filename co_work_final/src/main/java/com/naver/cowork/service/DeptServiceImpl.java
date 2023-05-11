package com.naver.cowork.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naver.cowork.domain.Dept;
import com.naver.cowork.mybatis.mapper.DeptMapper;

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

    @Transactional
    public int delete(int dept_no) {
        return dao.delete(dept_no);
    }

    @Transactional
    public int insert(Dept dept) {
        return dao.insert(dept);
    }



    //@Cacheable(value = "deptList")
    public List<Dept> deptList() {
    	
        return dao.deptList();
    }
    

    public String deptName(String user_id) {
        return dao.deptName(user_id);
    }

    public int deptNo(String user_id) {
        return dao.deptNo(user_id);
    }

    public int deptCheck(Dept dept){
        return dao.deptCheck(dept);
    }


}