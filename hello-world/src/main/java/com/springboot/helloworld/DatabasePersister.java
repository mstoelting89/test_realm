package com.springboot.helloworld;

public class DatabasePersister implements Persister {
    @Override
    public void persist() {
        System.out.println("In DatabasePersister persist");
    }
}

