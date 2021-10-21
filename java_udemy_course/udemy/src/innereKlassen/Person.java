package innereKlassen;

import java.util.List;

public class Person {

    private String name;

    public Person(String _name) {
        this.name = _name;
        printName();
    }

    public static List<Person> createShortList() {
        return null;
    }

    public void printName() {
        System.out.println(name);
    }

    public String getName() {
        return name;
    }

    public void getVorname() {

    }
}
