package bubblesort;

public class BubbleSort {

    public static void main(String[] args) {

        int[] zahlen = {12, 234, 1, 47, 5, 800, 600, 342};
        printArray(zahlen);

        int[] bubbleSort = bubbleSortierung(zahlen);
        printArray(bubbleSort);

    }

    public static int[] bubbleSortierung(int[] numbers) {

        int temp;
        for (int i = 0; i < numbers.length - 1; i++) {
            for (int j = 0; j < numbers.length - 1; j++) {
                if (numbers[j] > numbers[j + 1]) {
                    //System.out.println("Sortierung wird gestartet");
                    temp = numbers[j];
                    //System.out.println("temp: " + temp);
                    numbers[j] = numbers[j + 1];
                    //System.out.println("numbers[j]: " + numbers[j]);
                    numbers[j + 1] = temp;
                    //System.out.println("numbers[j + 1]: " + numbers[j + 1]);
                    //System.out.println("");
                }
            }
        }


        return numbers;
    }

    public static void printArray(int[] numbers) {
        int n = numbers.length;

        for (int i = 0; i < n ; i++) {
            System.out.print(numbers[i] + " ");
        }
        System.out.println("");
    }
}
