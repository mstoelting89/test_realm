package com.example.test_spring_boot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Optional;

@Controller
public class OutputController {

    @Autowired
    PersonRepository personRepository;

    // Rückgabe von simplen Text (ohne Template) --> responseBody
    @GetMapping("/")
    @ResponseBody
    public String home() {

        Optional<Person> person = personRepository.findById(-1L);
        if (person.isPresent()) {
            return person.get().getLastname();
        } else {
            return "Foo";
        }

        //return data.map(daten -> "Text: " + daten.getData()).orElse("Kein Text");

    }
}
