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

import com.tourtravel.util.DBConnection;

@WebServlet("/package-details")
public class PackageDetailsServlet extends HttpServlet {

private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws ServletException, IOException {

    String packageId = request.getParameter("id");

    String sql =
            "SELECT * FROM tour_packages "
          + "WHERE package_id = ?";

    try (Connection connection =
                 DBConnection.getConnection();
         PreparedStatement preparedStatement =
                 connection.prepareStatement(sql)) {

        preparedStatement.setInt(
                1,
                Integer.parseInt(packageId));

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
                    "/package-details.jsp")
                   .forward(request, response);

        } else {

            response.sendRedirect("packages");

        }

    } catch (Exception e) {

        e.printStackTrace();

        response.sendRedirect("packages");
    }
}

}