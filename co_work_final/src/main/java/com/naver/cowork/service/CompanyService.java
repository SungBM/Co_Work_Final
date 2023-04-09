package com.naver.cowork.service;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Company;

@Service
public interface CompanyService {


    public int companyUpdate(Company company);
    public int companyInsert(Company company);
    public String companySelect();


}