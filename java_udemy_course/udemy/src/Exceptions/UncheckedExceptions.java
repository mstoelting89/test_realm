package Exceptions;

public class UncheckedExceptions {

    public static void main(String[] args) {

        //
        //
        // Unchecked -> Das sind die fiesen Bugs -> passieren nur zur Laufzeit
        //
        //

        //
        // ArrayIndexOutOfBoundsException
        //

        String[] warenkorb = new String[40];
        warenkorb[0] = "Schuhe";
        warenkorb[1] = "Hemd";
        warenkorb[2] = "Gürtel";

        try {
            warenkorb[40] = "Handy";
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("Dein Warenkorb ist maximal gefüllt");
        }


        //
        // NumberFormatException
        //

        String inputTextField = "";
        inputTextField = "jh";
        System.out.println(inputTextField + " Schuhe");
        int artikelPreis = 20;

        try {
            int gesamtSumme = artikelPreis * Integer.parseInt(inputTextField);
            System.out.println("Gesamtsumme: " + gesamtSumme);
        } catch (NumberFormatException e) {
            System.out.println("Bitte keine Buchstaben in das TextField eintippen");
        }


        //
        // NullPointerException
        //

        String passwort = null;
        try {
            if(passwort.length() <=  10) {
                System.out.println("Dein Passwort ist viel zu kurz");
            }
        } catch (NullPointerException e) {
            System.out.println("Bitte ein Passwort eingeben");
        }


        //
        // ClassCastException
        //

        double number = 30.3453245;
        int numberAsInt = (int)number;
        System.out.println(numberAsInt);
        try {
            Object iObject = Integer.valueOf(42);
            String string = (String)iObject;
        } catch (ClassCastException e) {
            System.out.println("Ist kein Objekt");
        }

    }
}
