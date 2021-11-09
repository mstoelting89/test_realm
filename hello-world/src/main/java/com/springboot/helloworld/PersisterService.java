package com.springboot.helloworld;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersisterService {

    @Autowired
    private Persister persister;
    public void persistData() {
        persister.persist();
    }
}
