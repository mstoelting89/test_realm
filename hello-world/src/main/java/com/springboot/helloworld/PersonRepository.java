package com.springboot.helloworld;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PersonRepository extends CrudRepository<Person, Long> {
    List<Person> findByFirstname(String firstname);
    List<Person> findByFirstnameAndLastname(String firstname, String lastname);
    List<Person> findByFirstnameContaining(String str);
    List<Person> findByLastnameOrderByBirthdateAsc(String lastname);
    List<Person> findFirst2ByLastnameOrderByBirthdateAsc(String lastname);

    @Query("SELECT p FROM Person p WHERE p.status = 1")
    List<Person> findAllActivePersons();

    @Query("SELECT p FROM Person p WHERE p.firstname = ?1")
    List<Person> findPersonByFirstname(String firstname);
}
