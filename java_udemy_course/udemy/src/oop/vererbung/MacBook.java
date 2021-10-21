package oop.vererbung;

public class MacBook extends Laptop {

    boolean touchBar;

    public MacBook(String marke, int ram, String cpu, double preis, boolean touchBar) {
        super(marke, ram, cpu, preis);
        this.touchBar = touchBar;
    }

    @Override
    public void starten() {
        System.out.println("Macbook startet");
    }
}
