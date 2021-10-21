package arrayListSetMap.set;

import java.util.*;

public class Main {

    public static void main(String[] args) {

        List<String> list1 = new ArrayList<String>();
        Set<String> set1 = new TreeSet<String>();
        Set<String> set2 = new HashSet<String>();
        Set<String> set3 = new LinkedHashSet<String>();

        list1.add("Peter");
        list1.add("Frank");
        list1.add("Frauke");
        list1.add("Regina");
        list1.add("Peter");

        set1.add("Peter");
        set1.add("Frank");
        set1.add("Frauke");
        set1.add("Regina");
        set1.add("Peter");

        set2.add("Peter");
        set2.add("Frank");
        set2.add("Frauke");
        set2.add("Regina");
        set2.add("Peter");

        set3.add("Peter");
        set3.add("Frank");
        set3.add("Frauke");
        set3.add("Regina");
        set3.add("Peter");

        // Set übernimmt keine doppelten Werte
        // Treeset -> sortiert in natürliche Ordnung
        /*              5 (Wurzel)
        *            /       \
        *           4           8 (Knoten)
        *                    /      \
        *                   6       10
        *   Alles was kleiner ist als Wurzel/Knoten steht links
        *   Alles was größer ist als Wurzel/Knoten steht rechts
         */
        // Hashset -> ist ungeordnet
        // LinkedHashSet -> in der Reihenfolge, in der die Elemente hinzugefügt wurden

        System.out.println("Ausgabe Arraylist");
        Main.getElement(list1);
        System.out.println("Ausgabe Treeset");
        Main.getElement(set1);
        System.out.println("Ausgabe Hashset");
        Main.getElement(set2);
        System.out.println("Ausgabe LinkedHashset");
        Main.getElement(set3);
    }

    public static void getElement(Collection<String> collection) {
        for (String string:collection
             ) {
            System.out.println(string);
        }
    }
}
