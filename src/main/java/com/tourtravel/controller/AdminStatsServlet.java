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

@WebServlet("/admin-stats")
public class AdminStatsServlet extends HttpServlet {

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

    int totalPackages = 0;
    int totalBookings = 0;
    int totalUsers = 0;
    int confirmedBookings = 0;
    int cancelledBookings = 0;

    try {

        Connection connection =
                DBConnection.getConnection();

        if (connection == null) {

            System.out.println(
                    "ERROR: Database connection is NULL.");

            response.sendRedirect(
                    "admin-dashboard.jsp?error=db");

            return;
        }

        String packageSql =
                "SELECT COUNT(*) FROM tour_packages";

        try (PreparedStatement statement =
                     connection.prepareStatement(packageSql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            if (resultSet.next()) {

                totalPackages =
                        resultSet.getInt(1);
            }
        }


        String bookingSql =
                "SELECT COUNT(*) FROM bookings";

        try (PreparedStatement statement =
                     connection.prepareStatement(bookingSql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            if (resultSet.next()) {

                totalBookings =
                        resultSet.getInt(1);
            }
        }


        String userSql =
                "SELECT COUNT(*) FROM users";

        try (PreparedStatement statement =
                     connection.prepareStatement(userSql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            if (resultSet.next()) {

                totalUsers =
                        resultSet.getInt(1);
            }
        }


        String confirmedSql =
                "SELECT COUNT(*) FROM bookings "
              + "WHERE status = 'Confirmed'";

        try (PreparedStatement statement =
                     connection.prepareStatement(confirmedSql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            if (resultSet.next()) {

                confirmedBookings =
                        resultSet.getInt(1);
            }
        }


        String cancelledSql =
                "SELECT COUNT(*) FROM bookings "
              + "WHERE status = 'Cancelled'";

        try (PreparedStatement statement =
                     connection.prepareStatement(cancelledSql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            if (resultSet.next()) {

                cancelledBookings =
                        resultSet.getInt(1);
            }
        }


        connection.close();


        System.out.println(
                "===== ADMIN STATISTICS =====");

        System.out.println(
                "Packages: " + totalPackages);

        System.out.println(
                "Bookings: " + totalBookings);

        System.out.println(
                "Users: " + totalUsers);

        System.out.println(
                "Confirmed: " + confirmedBookings);

        System.out.println(
                "Cancelled: " + cancelledBookings);

        System.out.println(
                "============================");


        request.setAttribute(
                "totalPackages",
                totalPackages);

        request.setAttribute(
                "totalBookings",
                totalBookings);

        request.setAttribute(
                "totalUsers",
                totalUsers);

        request.setAttribute(
                "confirmedBookings",
                confirmedBookings);

        request.setAttribute(
                "cancelledBookings",
                cancelledBookings);


        request.getRequestDispatcher(
                "/admin-dashboard.jsp")
               .forward(request, response);


    } catch (Exception e) {

        System.out.println(
                "ERROR: Unable to load admin statistics.");

        e.printStackTrace();

        response.sendRedirect(
                "admin-dashboard.jsp?error=failed");
    }
}

}