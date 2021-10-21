package arrayListSetMap.DSUebungen;

import java.util.*;

public class Smartphone {
    private List<Kontakt> meineKontakte;

    public Smartphone() {
        meineKontakte = new ArrayList<Kontakt>();
    }

    public boolean addKontakt(Kontakt kontakt) {
        for (Kontakt kontaktEntry:meineKontakte) {
            if (kontaktEntry.getName().equals(kontakt.getName())) {
                System.out.println("Kontakt ist bereits vorhanden");
                return false;
            }
        }

        meineKontakte.add(kontakt);
        System.out.println("Kontakt wurde hinzugefügt");
        return true;
    }

    public boolean findKontakt(String name) {
        for (Kontakt kontaktEntry:meineKontakte) {
            if (kontaktEntry.getName().equals(name)) {
                System.out.println("Kontakt wurde gefunden: " + kontaktEntry.getName() + " " + kontaktEntry.getTelefonNummer());
                return true;
            }
        }
        System.out.println("Es wurde kein Kontakt gefunden");
        return false;
    }

    public void ausgabe() {
        for (Kontakt kontaktEntry:meineKontakte) {
            System.out.println("Name: " + kontaktEntry.getName() + " Telefonnummer: " + kontaktEntry.getTelefonNummer());
        }
    }
}
