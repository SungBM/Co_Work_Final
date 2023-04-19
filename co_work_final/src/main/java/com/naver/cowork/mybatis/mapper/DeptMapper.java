package com.naver.cowork.mybatis.mapper;

import com.naver.cowork.domain.Dept;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DeptMapper {

    public List<Dept> deptAll();

    public int dmaxNo();

    public int delete(int dept_no);

    public int insert(Dept dept);

    public List<Dept> deptList();

    public String deptName(String user_id);

    public int deptNo(String user_id);

    public int deptCheck(Dept dept);

}
