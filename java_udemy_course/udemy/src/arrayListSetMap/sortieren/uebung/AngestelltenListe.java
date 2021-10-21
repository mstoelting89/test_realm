package arrayListSetMap.sortieren.uebung;

import java.util.*;

class SortiereAngestelltenID implements Comparator<Angestellter> {

    @Override
    public int compare(Angestellter angestellter, Angestellter t1) {
        if (angestellter.getId() > t1.getId()) {
            return 1;
        } else if (angestellter.getId() < t1.getId()) {
            return -1;
        } else {
            return 0;
        }
    }
}

class SortiereAngestelltenName implements Comparator<Angestellter> {

    @Override
    public int compare(Angestellter angestellter, Angestellter t1) {
        return angestellter.getName().compareTo(t1.getName());
    }
}

class SortiereAngestelltenGeburtsjahr implements Comparator<Angestellter> {

    @Override
    public int compare(Angestellter angestellter, Angestellter t1) {
        if (angestellter.getGeburtsJahr() > t1.getGeburtsJahr()) {
            return 1;
        } else if (angestellter.getGeburtsJahr() < t1.getGeburtsJahr()) {
            return -1;
        } else {
            return 0;
        }
    }
}

public class AngestelltenListe {

    public static void main(String[] args) {

        List<Angestellter> angestelltenListe = new ArrayList<>();

        AngestelltenListe.addAngestellter(3, angestelltenListe);

        Collections.sort(angestelltenListe, new SortiereAngestelltenID());

        AngestelltenListe.getAngestellte(angestelltenListe);
    }

    public static void addAngestellter(int anzahl, Collection<Angestellter> col) {
        for (int i = 1; i <= anzahl; i++) {
            Scanner scanAngestellter = new Scanner(System.in);
            System.out.println("Bitte Namen eingeben");
            String name = scanAngestellter.next();
            System.out.println("Bitte ID eingeben");
            int id = scanAngestellter.nextInt();
            System.out.println("Bitte Geburtsjahr eingeben");
            int geburtsjahr = scanAngestellter.nextInt();

            Angestellter angestellter = new Angestellter(id, name, geburtsjahr);
            col.add(angestellter);
        }
    }

    public static void getAngestellte(Collection<Angestellter> col) {
        for (Angestellter angestellter : col) {
            System.out.print("Angestellter: " );
            System.out.println(angestellter);
        }
    }
}
