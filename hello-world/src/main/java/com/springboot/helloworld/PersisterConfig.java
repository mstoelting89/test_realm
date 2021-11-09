package com.springboot.helloworld;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class PersisterConfig {
    @Bean
    public Persister databasePersister(){
        return new DatabasePersister();
    }
}
