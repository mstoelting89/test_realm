package arrayListSetMap;

import java.util.ArrayList;

public class DSArrayList {

    public static void main (String[] args) {

        //ArrayList einkaufsListe = new ArrayList();
        ArrayList<String> namensListe = new ArrayList<String>();

        //einkaufsListe.add("Wasser");
        //einkaufsListe.add("Brot");
        //einkaufsListe.add(Integer.valueOf(4));

        namensListe.add("Michael");
        namensListe.add("Peter");
        //namensListe.add(Double.valueOf(3.4));

        for (int i = 0; i < namensListe.size(); i++) {
            System.out.println("Name: " + namensListe.get(i));
        }

        for (String string: namensListe) {
            System.out.println(string);
        }
    }

    // ArrayList bei häufigem Suchen ( Nutzen von get)
    // LinkedList beim häufigen Hinzufügen und Löschen ( Nutzen von remove, add )
}
