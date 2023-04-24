package com.naver.cowork.config;

import org.springframework.context.annotation.Bean;
import net.sf.ehcache.config.FactoryConfiguration;
import org.springframework.cache.annotation.EnableCaching;

import net.sf.ehcache.CacheManager;
import net.sf.ehcache.config.CacheConfiguration;
import net.sf.ehcache.config.Configuration;
import org.springframework.context.annotation.Bean;



import javax.servlet.http.HttpServletRequest;


@org.springframework.context.annotation.Configuration
public class DeptEhcacheConfig {
    @Bean(destroyMethod = "shutdown")
    public CacheManager makeEhcacheManager(){
        Configuration config = new Configuration();
        config.setName("deptList");


        config.addCache(getCacheConfiguration("deptList",6*10));//60초


        return CacheManager.newInstance(config);
    }

    private CacheConfiguration getCacheConfiguration(String name , long second){
        return getCacheConfiguration(name ,second , 100L);
    }

    private CacheConfiguration getCacheConfiguration(String name , long second , long size){
        CacheConfiguration cacheConfiguration = new CacheConfiguration();
        cacheConfiguration.setName(name);
        cacheConfiguration.setMemoryStoreEvictionPolicy("LRU");
        cacheConfiguration.setMaxEntriesLocalHeap(size);
        cacheConfiguration.setTimeToLiveSeconds(second);
        cacheConfiguration.setTimeToIdleSeconds(0L);

        return cacheConfiguration;
    }


}


