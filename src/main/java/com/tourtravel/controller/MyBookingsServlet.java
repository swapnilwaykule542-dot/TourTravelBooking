package com.tourtravel.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tourtravel.dao.BookingDAO;
import com.tourtravel.model.Booking;

@WebServlet("/my-bookings")
public class MyBookingsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        BookingDAO bookingDAO = new BookingDAO();

        List<Booking> bookings =
                bookingDAO.getBookingsByUser(userId);

        request.setAttribute("bookings", bookings);

        request.getRequestDispatcher("/my-bookings.jsp")
               .forward(request, response);
    }
}