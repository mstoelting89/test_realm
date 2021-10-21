package arrayListSetMap;

import java.util.ArrayList;

public class Addressbuch {

    public static void main(String[] args) {
        Adresse peterAdresse = new Adresse("Peter", "Fritzlangen.5", "Berlin");
        Adresse hansAdresse = new Adresse("Hans", "Berlinerstraße.6", "Leipzig");
        Adresse michaelAdresse = new Adresse("Michael", "Leipzigerstraße.6", "Hamburg");

        ArrayList<Adresse> adressenListe = new ArrayList<Adresse>();

        adressenListe.add(peterAdresse);
        adressenListe.add(hansAdresse);
        adressenListe.add(michaelAdresse);

        for (Adresse adresse: adressenListe
             ) {
            System.out.println("Name: " + adresse.getName() + " " + adresse.getStrasse() + " " + adresse.getStadt());
        }

        // ArrayList bei häufigem Suchen ( Nutzen von get)
        // LinkedList beim häufigen Hinzufügen und Löschen ( Nutzen von remove, add )
    }
}
