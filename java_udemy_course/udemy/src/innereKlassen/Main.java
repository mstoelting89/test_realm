package innereKlassen;

public class Main {

    public static void main(String[] args) {
        // Bisher
        Person p1 = new Person("Ralf");

        // Anonym
        new Person("Olaf") {
            @Override
            public void printName() {
                System.out.println("Der Name ist: " + this.getName());
            }
        };

        Hund hund1 = new Hund();
        hund1.machLaute();

        Katze katze1 = new Katze();
        katze1.machLaute();

        Tier elefant = new Tier() {
            @Override
            public String machLaute() {
                return "törö";
            }
        };

        Tier schwein = new Tier() {
            @Override
            public String machLaute() {
                return "oink oink";
            }
        };

    }
}


