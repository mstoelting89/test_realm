package oop.modifkation.beispielpaket;

public class Taschenrechner {
    public static void plus(int userZahl1, int userZahl2) {
        System.out.println("Ergebnis: " + (userZahl1 + userZahl2));
    }

    public static void minus(int userZahl1, int userZahl2) {
        System.out.println("Ergebnis: " + (userZahl1 - userZahl2));
    }

    public static void dividieren(int userZahl1, int userZahl2) throws NichtDruchNullTeilenExeption{
        if (userZahl2 == 0) {
            throw new NichtDruchNullTeilenExeption("Du darfst keine 0 eingeben");
        }
        System.out.println("Ergebnis: " + (userZahl1 / userZahl2));
    }
}
