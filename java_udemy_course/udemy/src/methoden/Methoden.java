package methoden;

public class Methoden {
    public static void main(String[] args) {
        ausgabe();
    }

    public static void ausgabe(){
        System.out.println("Ich bin eine Methode");
    }

    public static void summe() {
        int a,b, summe;
        a = 5;
        b = 5;

        summe = a + b;
        System.out.println(summe);
        
    }
}
