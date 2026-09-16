package com.tourtravel.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tourtravel.util.DBConnection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                HttpSession session = request.getSession();

                session.setAttribute("userId", resultSet.getInt("user_id"));
                session.setAttribute("fullName", resultSet.getString("full_name"));
                session.setAttribute("email", resultSet.getString("email"));

                response.sendRedirect("home.jsp");

            } else {

                response.sendRedirect("login.jsp?error=invalid");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("login.jsp?error=failed");
        }
    }
}