package com.tourtravel.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tourtravel.dao.TourPackageDAO;
import com.tourtravel.model.TourPackage;

@WebServlet("/admin-packages")
public class AdminPackageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("adminId") == null) {

            response.sendRedirect("admin-login.jsp");
            return;
        }

        try {

            TourPackageDAO packageDAO =
                    new TourPackageDAO();

            List<TourPackage> packages =
                    packageDAO.getAllPackages();

            request.setAttribute("packages", packages);

            request.getRequestDispatcher(
                    "/admin-packages.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "admin-packages.jsp?error=failed");
        }
    }
}