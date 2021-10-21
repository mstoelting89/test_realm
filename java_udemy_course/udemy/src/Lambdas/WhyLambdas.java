package Lambdas;

import innereKlassen.Person;

import java.util.*;
import java.util.function.Consumer;

public class WhyLambdas {

    public static void main(String[] args) {

        Integer[] numbers = {5,11,17,3,1,100,300,120};
        for (Integer number : numbers) {
            System.out.println(number);
        }

        // Lambda Syntax:
        // (Parameter) -> {}

        /* Alte Variante
        Arrays.sort(numbers, new Comparator<Integer>() {
            @Override
            public int compare(Integer a, Integer b) {
                return b - a;
            }
        });
        */
        Arrays.sort(numbers, (a,b) -> b-a);

        for (Integer number : numbers) {
            System.out.println(number);
        }


        /* Beispiel II */

        List<String> itemStrings = new ArrayList<String>();

        itemStrings.add("Einkaufen");
        itemStrings.add("Sport");
        itemStrings.add("Lernen");
        itemStrings.add("Grillen");
        itemStrings.add("Schreiben");

        // lange version
        itemStrings.forEach(new Consumer<String>() {
            @Override
            public void accept(String s) {
                System.out.println(s);
            }
        });

        // kürzer
        itemStrings.forEach((String t) -> {
            System.out.println(t);
        });

        // noch kürzer
        itemStrings.forEach(t -> {
            System.out.println(t);
        });

        // noch kürzer
        itemStrings.forEach(t -> System.out.println(t));

        /* UEBUNG */

        List<Person> personsList = Person.createShortList();

        // personsList sortieren

        // Mit einer Anonymen Klasse
        /*
        Collections.sort(personsList, new Comparator<Person>() {

            @Override
            public int compare(Person o1, Person o2) {
                return o1.getVorname().compareToIgnoreCase(o2.getVorname());
            }
        });

        Collections.sort(personsList, (o1,o2) -> o1.getVorname().compareToIgnoreCase(o2.getVorname())); */
    }
}
