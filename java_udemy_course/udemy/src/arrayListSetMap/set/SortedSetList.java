package arrayListSetMap.set;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class SortedSetList {

    public static void main(String[] args) {
        List<String> list1 = new ArrayList<String>();

        list1.add("Peter");
        list1.add("Frank");
        list1.add("Frauke");
        list1.add("Regina");
        list1.add("Peter");

        for (String string:list1
        ) {
            System.out.println(string);
        }

        Collections.sort(list1);
        System.out.println("Sortiert");
        for (String string:list1
        ) {
            System.out.println(string);
        }
    }
}
