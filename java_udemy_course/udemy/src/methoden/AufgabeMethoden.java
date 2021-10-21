package methoden;

public class AufgabeMethoden {
    public static void main (String[] args) {
        double value = multiplikation(3.547, 6.354);
        System.out.println(value);
    }

    public static double multiplikation(double value1, double value2) {
        double result = value1 * value2;
        return result;
    }
}
