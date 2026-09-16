
package com.tourtravel.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tourtravel.dao.BookingDAO;

@WebServlet("/cancel-booking")
public class CancelBookingServlet extends HttpServlet {

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

        String bookingIdParameter =
                request.getParameter("bookingId");

        if (bookingIdParameter == null ||
            bookingIdParameter.isEmpty()) {

            response.sendRedirect("my-bookings");
            return;
        }

        int bookingId =
                Integer.parseInt(bookingIdParameter);

        BookingDAO bookingDAO = new BookingDAO();

        boolean success =
                bookingDAO.cancelBooking(bookingId, userId);

        if (success) {

            response.sendRedirect("my-bookings");

        } else {

            response.sendRedirect("my-bookings?error=failed");
        }
    }
}

