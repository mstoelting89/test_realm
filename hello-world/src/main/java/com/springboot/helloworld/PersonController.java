package com.springboot.helloworld;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
public class PersonController {
    @GetMapping("/")
    public String home(Model model) {
        // Rückgabewert dient zum Auffinden des Templates
        Person person1 = new Person();
        person1.setFirstname("Michael");
        person1.setLastname("Stölting");

        Person person2 = new Person();
        person2.setFirstname("Svenja");
        person2.setLastname("Stölting");

        Person person3 = new Person();
        person3.setFirstname("Ella");
        person3.setLastname("Stölting");

        ArrayList<Person> personList = new ArrayList<Person>();
        personList.add(person1);
        personList.add(person2);
        personList.add(person3);

        model.addAttribute(personList);
        return "home"; // .html Endung muss nicht mit angegebenen werden

    }
}
