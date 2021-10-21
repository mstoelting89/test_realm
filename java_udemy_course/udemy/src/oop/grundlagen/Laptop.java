package oop.grundlagen;

public class Laptop {

    int ram;
    double preis;
    String marke;

    public Laptop(int ram, double preis, String marke) {
        this.ram = ram;
        this.preis = preis;
        this.marke = marke;
    }

    public void ausgabe() {
        System.out.println("Der Laptop " + this.marke + " mit " + this.ram + " RAM kostet " + this.preis + " Euro");
    }
}
