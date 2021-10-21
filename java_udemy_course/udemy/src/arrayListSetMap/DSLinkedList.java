package arrayListSetMap;

import java.util.*;

public class DSLinkedList {

    public static void main(String[] args) {

        //LinkedList<Integer> liste = new LinkedList<Integer>();
        List<Integer> liste = new ArrayList<Integer>();

        for(int i = 0; i<10000000; i++) {
            liste.add(i);
        }
        final long timeStart = System.currentTimeMillis();
        DSLinkedList.getZahl(1999999, liste);
        final long timeEnd = System.currentTimeMillis();

        System.out.println("Das Suchen hat gedauert: " + (timeEnd - timeStart));
    }

    public static void getZahl(int index, List<Integer> liste) {
        System.out.println(liste.get(index));
    }

    // ArrayList bei häufigem Suchen ( Nutzen von get)
    // LinkedList beim häufigen Hinzufügen und Löschen ( Nutzen von remove, add )
}
