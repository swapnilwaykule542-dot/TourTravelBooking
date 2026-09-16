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

@WebServlet("/delete-package")
public class DeletePackageServlet extends HttpServlet {

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
                "DELETE FROM tour_packages "
              + "WHERE package_id = ?";

        try (Connection connection =
                     DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, packageId);

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