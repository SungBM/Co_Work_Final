package com.naver.cowork.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Company;
import com.naver.cowork.mybatis.mapper.CompanyMapper;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CompanyServiceImpl implements CompanyService {

    private CompanyMapper dao;

    @Autowired
    public CompanyServiceImpl(CompanyMapper dao) {
        this.dao = dao;
    }

    @Transactional
    public int companyUpdate(Company company) {
        return dao.companyUpdate(company);
    }

    @Transactional
    public int companyInsert(Company company) {
        return dao.companyInsert(company);
    }

    public String companySelect() {
        return dao.companySelect();
    }

}