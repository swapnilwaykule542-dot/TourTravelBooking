package com.tourtravel.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.tourtravel.dao.UserDAO;
import com.tourtravel.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        User user = new User(
                fullName,
                email,
                password,
                phone
        );

        UserDAO userDAO = new UserDAO();

        boolean success = userDAO.registerUser(user);

        if (success) {
        	response.sendRedirect("login.jsp?registered=success");
        } else {
            response.sendRedirect("register.jsp?error=failed");
        }
    }
}