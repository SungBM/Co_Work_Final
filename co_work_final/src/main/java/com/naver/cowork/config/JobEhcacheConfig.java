package com.naver.cowork.config;

import net.sf.ehcache.CacheManager;
import net.sf.ehcache.config.CacheConfiguration;
import net.sf.ehcache.config.Configuration;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;

@org.springframework.context.annotation.Configuration
public class JobEhcacheConfig {
    @Bean(destroyMethod = "shutdown")
    public CacheManager makeEhcacheManager2(){
        Configuration config = new Configuration();
        config.setName("jobList");

        config.addCache(getCacheConfiguration("jobList",6*10));//6초
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
