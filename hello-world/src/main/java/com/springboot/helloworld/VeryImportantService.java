package com.springboot.helloworld;

import org.springframework.beans.factory.annotation.Autowired;

public class VeryImportantService {

    private DatabasePersister databasePersister;
    // Objekt wird instanziert:
    // + einfach und schnell
    // - lässt sich nicht mehr ändern
    // - es entsteht eine feste Abhängigkeit zu dem DatabasePersister
    public VeryImportantService() {
        this.databasePersister = new DatabasePersister();
    }
    // Bei Dependency Injektion wird die benötigte Klasse durch einen DI-Container beim Start der Anwendung instanziert
    // Spring durchsucht die Beans im Container nach passenden Typen: - Abhängingkeit fällt weg

    // Constructor Injection
    private Persister persister;
    //Konstruktor, über den der Container ein Persister-Objekt injiziert
    @Autowired
    public VeryImportantService(Persister persister) {
        this.persister = persister;
    }

    //Setter, über den der Container ein Persister-Objekt injiziert
    @Autowired
    public void setPersister(Persister persister) {
        this.persister = persister;
    }

    // Field - Injection: --> wird so gut wie gar nicht verwendet
    // @Autowired
    // private Persister persister;
}
