package arrayListSetMap.map;

import java.util.HashMap;
import java.util.Map;

public class Main {

    public static void main(String[] args) {

        Map<Integer, String> map1 = new HashMap<>();

        map1.put(1234,"Tisch");
        map1.put(12345,"Stuhl");

        System.out.println(map1.get(1234));

        for(Integer key: map1.keySet()) {
            System.out.println(map1.get(key));

        }
    }
}
