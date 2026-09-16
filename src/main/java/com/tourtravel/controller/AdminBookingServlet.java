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

@WebServlet("/admin-bookings")
public class AdminBookingServlet extends HttpServlet {

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

        List<String[]> bookings =
                new ArrayList<>();

        String sql =
                "SELECT b.booking_id, "
              + "u.full_name, "
              + "u.email, "
              + "t.package_name, "
              + "t.destination, "
              + "b.booking_date, "
              + "b.number_of_people, "
              + "b.total_amount, "
              + "b.status "
              + "FROM bookings b "
              + "JOIN users u ON b.user_id = u.user_id "
              + "JOIN tour_packages t "
              + "ON b.package_id = t.package_id "
              + "ORDER BY b.booking_id DESC";

        try (Connection connection =
                     DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql);
             ResultSet resultSet =
                     preparedStatement.executeQuery()) {

            while (resultSet.next()) {

                String[] booking = new String[9];

                booking[0] =
                        String.valueOf(
                                resultSet.getInt("booking_id"));

                booking[1] =
                        resultSet.getString("full_name");

                booking[2] =
                        resultSet.getString("email");

                booking[3] =
                        resultSet.getString("package_name");

                booking[4] =
                        resultSet.getString("destination");

                booking[5] =
                        resultSet.getString("booking_date");

                booking[6] =
                        String.valueOf(
                                resultSet.getInt(
                                        "number_of_people"));

                booking[7] =
                        String.valueOf(
                                resultSet.getDouble(
                                        "total_amount"));

                booking[8] =
                        resultSet.getString("status");

                bookings.add(booking);
            }

            request.setAttribute(
                    "bookings",
                    bookings);

            request.getRequestDispatcher(
                    "/admin-bookings.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "admin-dashboard.jsp?error=failed");
        }
    }
}