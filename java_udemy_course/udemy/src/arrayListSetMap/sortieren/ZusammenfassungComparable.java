package arrayListSetMap.sortieren;

import java.util.*;

class VergleicheStringLaenge implements Comparator<String> {

    @Override
    public int compare(String s, String t1) {

        int laenge1 = s.length();
        int laenge2 = t1.length();

        if (laenge1 > laenge2) {
            return 1;
        } else if (laenge1 < laenge2) {
            return -1;
        } else {
            return 0;
        }
    }
}

class UmgekehrteAlphabetischeReihenfolgeLaenge implements Comparator<String> {

    @Override
    public int compare(String s, String t1) {
        return -s.compareTo(t1);
    }
}

public class ZusammenfassungComparable {

    public static void main(String[] args) {

        List<String> angestelltenListe = new ArrayList<>();

        angestelltenListe.add("Hans");
        angestelltenListe.add("Chris");
        angestelltenListe.add("Andi");
        angestelltenListe.add("Frauke");
        angestelltenListe.add("Regina");
        angestelltenListe.add("Petra");
        angestelltenListe.add("Peter");

        Collections.sort(angestelltenListe, new UmgekehrteAlphabetischeReihenfolgeLaenge());

        for (String string: angestelltenListe) {
            System.out.println(string);
        }
    }
}
