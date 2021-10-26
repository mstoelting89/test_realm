package com.springboot.helloworld;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonSeviceImpl implements PersonService{
    @Autowired
    PersonRepository personRepository;

    @Override
    public String getFullName(Long id) {

        Person person = personRepository.findById(id).get();

        return person.getFirstname() + " " + person.getLastname();

    }
}
