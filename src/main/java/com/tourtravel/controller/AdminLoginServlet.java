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

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {

private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request,
                      HttpServletResponse response)
        throws ServletException, IOException {

    String username =
            request.getParameter("username");

    String password =
            request.getParameter("password");

    String sql =
            "SELECT * FROM admin "
          + "WHERE username = ? AND password = ?";

    try (Connection connection =
                 DBConnection.getConnection();
         PreparedStatement preparedStatement =
                 connection.prepareStatement(sql)) {

        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);

        ResultSet resultSet =
                preparedStatement.executeQuery();

        if (resultSet.next()) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "adminId",
                    resultSet.getInt("admin_id"));

            session.setAttribute(
                    "adminUsername",
                    resultSet.getString("username"));

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin-stats");

        } else {

            response.sendRedirect(
                    "admin-login.jsp?error=invalid");
        }

    } catch (Exception e) {

        e.printStackTrace();

        response.sendRedirect(
                "admin-login.jsp?error=failed");
    }
}

}