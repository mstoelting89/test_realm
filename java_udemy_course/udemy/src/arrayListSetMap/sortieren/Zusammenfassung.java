package arrayListSetMap.sortieren;

import java.util.*;

class Person implements Comparable<Person> {

    private String vorName;

    public Person(String vorName) {
        this.vorName = vorName;
    }

    @Override
    public String toString() {
        return "Person{" +
                "vorName='" + vorName + '\'' +
                '}';
    }

    @Override
    public int compareTo(Person person) {
        // 0 = Beide gleich
        // 1 = Objekt ist größer
        //-1 = Objekt ist kleiner

        //return vorName.compareTo(person.vorName);
        //return -(vorName.compareTo(person.vorName)) ; --> Anders herum sortieren

        // Sortierung nach Stringlänge
        int laenge1 = vorName.length();
        int laenge2 = person.vorName.length();

        if (laenge1 > laenge2) {
            return 1;
        } else if (laenge1 < laenge2) {
            return -1;
        } else {
            // Beim Set werden gleichlange Strings normalerweise entfernt
            //
            return vorName.compareTo(person.vorName); // Sortiert aber nur die gleichlangen Strings
        }
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Person person = (Person) o;
        return Objects.equals(vorName, person.vorName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(vorName);
    }
}



public class Zusammenfassung {

    public static void main(String[] args) {

        List<Person> list = new ArrayList<>();

        Zusammenfassung.addElements(3, list);
        Collections.sort(list);
        Zusammenfassung.getElements(list);

        System.out.println("-----------");

        //Set<String> set = new HashSet<>();
        Set<Person> set = new TreeSet<>(); // -> sortiert

        Zusammenfassung.addElements(5, set);
        Zusammenfassung.getElements(set);

        System.out.println("-----------");

        ////Map<Integer, String> map = new HashMap<>();
        //Map<Integer, String> map = new TreeMap<>(); // -> sortiert nach Schlüssel
//
        //map.put(1,"Katze");
        //map.put(4,"Aal");
        //map.put(2,"Hund");
        //map.put(3,"Kanninchen");
//
        //for (Integer key: map.keySet()) {
        //    System.out.println("Key: " + key + " Value: " + map.get(key));
        //}
    }

    public static void addElements(int anzahlPerson, Collection<Person> col) {

        for (int i = 0; i<anzahlPerson; i++) {
            Scanner scanName = new Scanner(System.in);
            System.out.println("Name eingeben:");
            String eingabeName = scanName.next();

            Person person = new Person(eingabeName);
            col.add(person);
        }
    }

    public static void getElements(Collection<Person> col) {
        for (Person person: col) {
            System.out.println(person);
        }
    }
}
