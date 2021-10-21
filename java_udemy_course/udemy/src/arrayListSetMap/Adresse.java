package arrayListSetMap;

public class Adresse {

    private String name;
    private String strasse;
    private String stadt;

    public Adresse() {

    }

    public Adresse(String name, String strasse, String stadt) {
        this.name = name;
        this.strasse = strasse;
        this.stadt = stadt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStrasse() {
        return strasse;
    }

    public void setStrasse(String strasse) {
        this.strasse = strasse;
    }

    public String getStadt() {
        return stadt;
    }

    public void setStadt(String stadt) {
        this.stadt = stadt;
    }
}
