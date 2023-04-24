package com.naver.cowork.cache;

import org.springframework.cache.CacheManager;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/ehcache")
public class CacheController {
    private CacheManager cacheManager;

    public CacheController(CacheManager cacheManager)
    {
        this.cacheManager = cacheManager;
    }

    @GetMapping("/all")
    public Response<Object> findAll(HttpServletRequest request){
        return Response.builder()
                .data(cacheManager.getCacheNames())
                .message("ehcache find All")
                .url(request.getRequestURI())
                .build();
    }
}