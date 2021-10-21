package oop.assoziation;

public class Auto {
    String autoMarke;
    Reifen reifen;

    public Auto() {

    }

    public Auto(String autoMarke, String reifenMarke, String reifenTyp) {
        reifen = new Reifen(reifenMarke, reifenTyp);
        this.autoMarke = autoMarke;
    }

    public void ausgabeDaten() {
        System.out.println("Automarke: " + this.autoMarke + " und Reifen: " + reifen.reifenTyp);
    }
}
