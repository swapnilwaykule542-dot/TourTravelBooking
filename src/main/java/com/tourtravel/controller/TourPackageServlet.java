package com.tourtravel.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.tourtravel.dao.TourPackageDAO;
import com.tourtravel.model.TourPackage;

@WebServlet("/packages")
public class TourPackageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        TourPackageDAO packageDAO = new TourPackageDAO();

        List<TourPackage> packages = packageDAO.getAllPackages();

        request.setAttribute("packages", packages);

        request.getRequestDispatcher("/packages.jsp")
               .forward(request, response);
    }
}