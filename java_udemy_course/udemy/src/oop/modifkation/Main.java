package oop.modifkation;

import oop.modifkation.beispielpaket.NichtDruchNullTeilenExeption;
import oop.modifkation.beispielpaket.Taschenrechner;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws Exception {

        //Taschenrechner.plus(5,6);
        Scanner scan = new Scanner(System.in);
        try {
            /*System.out.println("Bitte Zahl 1 wählen");
            int userZahl1 = scan.nextInt();
            System.out.println("Bitte Zahl 2 wählen");
            int userZahl2 = scan.nextInt(); */

            Taschenrechner.dividieren(10,0);
        } catch (NichtDruchNullTeilenExeption e) {
            /*
            System.out.println("Man kann nicht durch 0 teilen");
            System.out.println("Bitte neue Zahlen wählen");

            System.out.println("Bitte Zahl 1 wählen");
            int neueEingabe1 = scan.nextInt();
            System.out.println("Bitte Zahl 2 wählen");
            int neueEingabe2 = scan.nextInt();

            Taschenrechner.dividieren(neueEingabe1,neueEingabe2); */

            System.out.println(e.getMessage());
        } catch (Exception e1) {

        }

    }
}
