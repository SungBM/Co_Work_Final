package com.naver.cowork.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.Company;

@Mapper
public interface CompanyMapper {


    public int companyUpdate(Company company);
    public int companyInsert(Company company);
    public String companySelect();


}
