package Threads;

public class JavaThreads {

    public static void main(String[] args) {
        /*
        Thread thread = new Thread(new SecondThread());
        thread.start();
        Thread thread2 = new Thread(() -> System.out.println("Test"));
        thread2.start();
        */

        Thread thread = new Thread(new Counter(), "First");
        thread.start();

        Thread thread2 = new Thread(new Counter(), "Second");
        thread2.start();
    }

}
