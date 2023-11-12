/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


package Models;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
    private static final String JDBC_URL = "jdbc:mysql://localhost:8080/social_media";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    public static boolean checkLogin(String username, String password) {
        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);

            String query = "SELECT * FROM profile WHERE username=? AND password=?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);

                ResultSet resultSet = preparedStatement.executeQuery();
                return resultSet.next(); // If there's a match, resultSet.next() will be true
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
