package Threads;

public class Counter implements Runnable{
    @Override
    public void run() {
        Thread thread = Thread.currentThread();

        for(long count = 0; count <= 100; count++) {
            System.out.println(thread + " Count: " + count);
        }
    }
}
