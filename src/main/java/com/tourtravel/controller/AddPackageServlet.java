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

@WebServlet("/add-package")
public class AddPackageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("adminId") == null) {

            response.sendRedirect("admin-login.jsp");
            return;
        }

        String packageName =
                request.getParameter("packageName");

        String destination =
                request.getParameter("destination");

        String description =
                request.getParameter("description");

        String duration =
                request.getParameter("duration");

        String priceText =
                request.getParameter("price");

        String seatsText =
                request.getParameter("availableSeats");

        String image =
                request.getParameter("image");

        try {

            double price = Double.parseDouble(priceText);

            int availableSeats =
                    Integer.parseInt(seatsText);

            String sql =
                    "INSERT INTO tour_packages "
                  + "(package_name, destination, description, "
                  + "duration, price, available_seats, image) "
                  + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement preparedStatement =
                    connection.prepareStatement(sql);

            preparedStatement.setString(1, packageName);
            preparedStatement.setString(2, destination);
            preparedStatement.setString(3, description);
            preparedStatement.setString(4, duration);
            preparedStatement.setDouble(5, price);
            preparedStatement.setInt(6, availableSeats);
            preparedStatement.setString(7, image);

            int result =
                    preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();

            if (result > 0) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/admin-packages");

            } else {

                response.sendRedirect(
                        request.getContextPath()
                        + "/add-package.jsp?error=failed");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/add-package.jsp?error=failed");
        }
    }
}