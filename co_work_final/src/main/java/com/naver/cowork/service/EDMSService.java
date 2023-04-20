package com.naver.cowork.service;

import com.naver.cowork.domain.ChatVO;
import com.naver.cowork.domain.EDMS;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public interface EDMSService {
    public List<EDMS> getMyDoc(String user_id);

    public List<EDMS> getMyDocApp(String user_id);

    public int getCountDoc(String user_id);

    public int getCountDocApp(String user_id);
}
