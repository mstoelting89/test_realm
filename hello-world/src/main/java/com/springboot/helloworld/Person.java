package com.springboot.helloworld;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

@Entity
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @NotBlank(message = "Bitte geben Sie einen Vornamen ein")
    private String firstname;
    @NotBlank(message = "Bitte geben Sie einen Nachnamen ein")
    private String lastname;
    private LocalDate birthdate;
    private Integer status;
    @Email(message = "Bitte geben Sie eine korrekte Email-Adresse an")
    @NotBlank(message = "Bitte geben Sie einen Email-Adresse an")
    private String email;

    public LocalDate getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(LocalDate birthdate) {
        this.birthdate = birthdate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id  = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }
}
