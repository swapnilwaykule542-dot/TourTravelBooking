package com.tourtravel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.tourtravel.model.User;
import com.tourtravel.util.DBConnection;

public class UserDAO {

    public boolean registerUser(User user) {

        String sql = "INSERT INTO users (full_name, email, password, phone) "
                   + "VALUES (?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getPhone());

            int result = preparedStatement.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}