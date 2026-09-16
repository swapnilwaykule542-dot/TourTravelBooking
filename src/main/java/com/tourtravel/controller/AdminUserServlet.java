package com.tourtravel.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tourtravel.util.DBConnection;

@WebServlet("/admin-users")
public class AdminUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("adminId") == null) {

            response.sendRedirect("admin-login.jsp");
            return;
        }

        List<String[]> users =
                new ArrayList<>();

        String sql =
                "SELECT user_id, full_name, email, phone, created_at "
              + "FROM users "
              + "ORDER BY user_id DESC";

        try (Connection connection =
                     DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql);
             ResultSet resultSet =
                     preparedStatement.executeQuery()) {

            while (resultSet.next()) {

                String[] user = new String[5];

                user[0] =
                        String.valueOf(
                                resultSet.getInt("user_id"));

                user[1] =
                        resultSet.getString("full_name");

                user[2] =
                        resultSet.getString("email");

                user[3] =
                        resultSet.getString("phone");

                user[4] =
                        String.valueOf(
                                resultSet.getTimestamp(
                                        "created_at"));

                users.add(user);
            }

            request.setAttribute(
                    "users",
                    users);

            request.getRequestDispatcher(
                    "/admin-users.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "admin-dashboard.jsp?error=failed");
        }
    }
}