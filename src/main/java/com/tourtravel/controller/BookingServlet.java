package com.tourtravel.controller;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tourtravel.dao.BookingDAO;
import com.tourtravel.model.Booking;

@WebServlet("/book")
public class BookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        int packageId = Integer.parseInt(
                request.getParameter("packageId"));

        int numberOfPeople = Integer.parseInt(
                request.getParameter("numberOfPeople"));

        double price = Double.parseDouble(
                request.getParameter("price"));

        double totalAmount = price * numberOfPeople;

        String bookingDate = LocalDate.now().toString();

        Booking booking = new Booking(
                userId,
                packageId,
                bookingDate,
                numberOfPeople,
                totalAmount,
                "Confirmed"
        );

        BookingDAO bookingDAO = new BookingDAO();

        boolean success = bookingDAO.createBooking(booking);

        if (success) {

            response.sendRedirect(
                    "booking-success.jsp");

        } else {

            response.sendRedirect(
                    "package-details?id=" + packageId);
        }
    }
}