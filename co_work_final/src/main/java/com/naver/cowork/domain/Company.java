package com.naver.cowork.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Company {
    private String company_url;
    private String company_logo;
    private String company_csv_form;
    private MultipartFile imgupload;
    private String originalfile;

}

