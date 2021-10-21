package arrayListSetMap.meinpackage;

import arrayListSetMap.DSUebungen.Kontakt;
import arrayListSetMap.DSUebungen.Smartphone;

public class MeineSmartphones {

    public static void main(String[] args) {

        Smartphone iPhone6 = new Smartphone();

        iPhone6.addKontakt(Kontakt.erstelleKontakt("Michael", "015161291089"));
        iPhone6.addKontakt(Kontakt.erstelleKontakt("Peter", "1245"));
        iPhone6.addKontakt(Kontakt.erstelleKontakt("Hans", "897575"));
        iPhone6.addKontakt(Kontakt.erstelleKontakt("Hans", "897575"));

        Kontakt petra = new Kontakt("Petra", "561445");

        iPhone6.addKontakt(petra);

        System.out.println("Suchen: ");
        iPhone6.findKontakt("Petra");

        iPhone6.ausgabe();
    }
}
