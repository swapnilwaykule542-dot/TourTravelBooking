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

@WebServlet("/edit-package")
public class EditPackageServlet extends HttpServlet {

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

        String packageIdParameter =
                request.getParameter("id");

        if (packageIdParameter == null ||
            packageIdParameter.isEmpty()) {

            response.sendRedirect("admin-packages");
            return;
        }

        int packageId =
                Integer.parseInt(packageIdParameter);

        String sql =
                "SELECT * FROM tour_packages "
              + "WHERE package_id = ?";

        try (Connection connection =
                     DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, packageId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                request.setAttribute(
                        "packageId",
                        resultSet.getInt("package_id"));

                request.setAttribute(
                        "packageName",
                        resultSet.getString("package_name"));

                request.setAttribute(
                        "destination",
                        resultSet.getString("destination"));

                request.setAttribute(
                        "description",
                        resultSet.getString("description"));

                request.setAttribute(
                        "duration",
                        resultSet.getString("duration"));

                request.setAttribute(
                        "price",
                        resultSet.getDouble("price"));

                request.setAttribute(
                        "availableSeats",
                        resultSet.getInt("available_seats"));

                request.setAttribute(
                        "image",
                        resultSet.getString("image"));

                request.getRequestDispatcher(
                        "/edit-package.jsp")
                       .forward(request, response);

            } else {

                response.sendRedirect(
                        "admin-packages");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "admin-packages");
        }
    }
}