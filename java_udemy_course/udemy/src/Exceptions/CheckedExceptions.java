package Exceptions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CheckedExceptions {

    public static void main (String[] args) {

        // Checked -> check mich an Ort und Stelle

        try {
            Connection connection = DriverManager.getConnection("C:/Programme/Java");
        } catch (SQLException e) {
            System.out.println("Hey bitte InternetConnection prüfen");
        }
    }
}
