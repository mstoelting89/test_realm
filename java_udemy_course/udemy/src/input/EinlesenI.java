package input;

import java.util.Scanner;

public class EinlesenI {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Bitte eine Zahl eingeben...");
        double zahl = scan.nextDouble();
        System.out.println("Ihre Zahl lautet: " + zahl);

        Scanner scan2 = new Scanner(System.in);
        System.out.println("Bitte geben Sie ihren Namen ein...");
        String zeichenkette = scan2.next();
        System.out.println("Ihre Name lautet: " + zeichenkette);
    }
}
