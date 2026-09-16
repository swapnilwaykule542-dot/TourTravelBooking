package com.tourtravel.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tourtravel.util.DBConnection;

@WebServlet("/update-package")
public class UpdatePackageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("adminId") == null) {

            response.sendRedirect("admin-login.jsp");
            return;
        }

        int packageId =
                Integer.parseInt(
                        request.getParameter("packageId"));

        String packageName =
                request.getParameter("packageName");

        String destination =
                request.getParameter("destination");

        String description =
                request.getParameter("description");

        String duration =
                request.getParameter("duration");

        double price =
                Double.parseDouble(
                        request.getParameter("price"));

        int availableSeats =
                Integer.parseInt(
                        request.getParameter("availableSeats"));

        String image =
                request.getParameter("image");

        String sql =
                "UPDATE tour_packages SET "
              + "package_name = ?, "
              + "destination = ?, "
              + "description = ?, "
              + "duration = ?, "
              + "price = ?, "
              + "available_seats = ?, "
              + "image = ? "
              + "WHERE package_id = ?";

        try (Connection connection =
                     DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setString(1, packageName);
            preparedStatement.setString(2, destination);
            preparedStatement.setString(3, description);
            preparedStatement.setString(4, duration);
            preparedStatement.setDouble(5, price);
            preparedStatement.setInt(6, availableSeats);
            preparedStatement.setString(7, image);
            preparedStatement.setInt(8, packageId);

            int result =
                    preparedStatement.executeUpdate();

            if (result > 0) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/admin-packages");

            } else {

                response.sendRedirect(
                        request.getContextPath()
                        + "/admin-packages?error=failed");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin-packages?error=failed");
        }
    }
}