package com.springboot.helloworld;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class PersonController {

    @Autowired
    PersonRepository personRepository;

    @Autowired
    PersonService personService;

    /*
    // Rückgabe von simplen Text (ohne Template) --> responseBody
    @GetMapping("/")
    @ResponseBody
    public String home() {

        Optional<Person> person = personRepository.findById(-1L);
        //List<Person> persons = (List<Person>) personRepository.findByFirstname("Max");
        //List<Person> persons = (List<Person>) personRepository.findAll();


        if(person.isPresent()) {
            return person.get().getLastname();

        } else {
            return "Keine Person mit dieser Id gefunden";
        }
    } */

    // Aufruf der Seite zum rendern des html-Templates "home"
    @GetMapping("/")
    public String home(Model model) {
        // Rückgabewert dient zum Auffinden des Templates
        Person person = new Person();

        model.addAttribute(person);
        return "home"; // .html Endung muss nicht mit angegebenen werden

    }

    // Verarbeiten der Formulareingabe von Template "home"
    @PostMapping("/")
    public String home(@Valid Person person, BindingResult bindingResult, Model model) {

        if(bindingResult.hasErrors()) {
            bindingResult.getAllErrors().stream().forEach(System.out::println);
        }
        model.addAttribute(person);
        return "home";
    }

}
