package Exceptions;

public class ExceptionTest {

    public static void main(String[] args) {

        int a = 20;
        int b = 0;

        try {
            int summe = a / b;
            System.out.println(summe);
        } catch (ArithmeticException e) {
            System.out.println("Durch 0 teilen geht nicht");
        }

    }
}
