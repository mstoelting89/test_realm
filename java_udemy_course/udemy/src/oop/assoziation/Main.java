package oop.assoziation;

public class Main {
    public static void main(String[] args) {
        Auto auto1 = new Auto("BMW", "Goodyear", "Winterreifen");
        Auto auto2 = new Auto("VW", "michelin", "Sommerreifen");

        auto1.ausgabeDaten();
        auto2.ausgabeDaten();
    }
}
