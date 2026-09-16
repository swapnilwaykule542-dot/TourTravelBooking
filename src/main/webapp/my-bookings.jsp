<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tourtravel.model.Booking" %>

<%
if (session.getAttribute("userId") == null) {
response.sendRedirect("login.jsp");
return;
}

List<Booking> bookings =
    (List<Booking>) request.getAttribute("bookings");

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>My Bookings - Tour & Travel Booking</title>

<style>

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: Arial, sans-serif;
        background: #f5f7fa;
        color: #333;
    }

    .navbar {
        background: #1f2937;
        color: white;
        padding: 18px 6%;

        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        font-size: 24px;
        font-weight: bold;
    }

    .nav-links {
        display: flex;
        gap: 25px;
    }

    .nav-links a {
        color: white;
        text-decoration: none;
        font-size: 15px;
    }

    .nav-links a:hover {
        color: #60a5fa;
    }

    .container {
        width: 90%;
        max-width: 1100px;
        margin: 50px auto;
    }

    .page-header {
        text-align: center;
        margin-bottom: 35px;
    }

    .page-header h1 {
        font-size: 36px;
        color: #111827;
        margin-bottom: 10px;
    }

    .page-header p {
        color: #666;
        font-size: 16px;
    }

    .booking-card {
        background: white;
        padding: 28px;
        margin-bottom: 22px;

        border-radius: 12px;

        box-shadow:
            0 5px 18px rgba(0, 0, 0, 0.08);
    }

    .booking-header {
        display: flex;
        justify-content: space-between;
        align-items: center;

        border-bottom: 1px solid #e5e7eb;
        padding-bottom: 18px;
        margin-bottom: 20px;
    }

    .booking-header h2 {
        font-size: 21px;
        color: #111827;
    }

    .booking-id {
        color: #777;
        font-size: 14px;
    }

    .booking-details {
        display: grid;

        grid-template-columns:
            repeat(auto-fit, minmax(200px, 1fr));

        gap: 15px;

        margin-bottom: 22px;
    }

    .detail-box {
        background: #f3f4f6;
        padding: 15px;
        border-radius: 8px;
    }

    .detail-box .label {
        display: block;
        color: #777;
        font-size: 13px;
        margin-bottom: 6px;
    }

    .detail-box .value {
        display: block;
        color: #111827;
        font-size: 16px;
        font-weight: bold;
    }

    .amount {
        font-size: 24px;
        color: #2563eb;
        font-weight: bold;
    }

    .status-confirmed {
        color: #15803d;
        font-weight: bold;
    }

    .status-cancelled {
        color: #dc2626;
        font-weight: bold;
    }

    .actions {
        border-top: 1px solid #e5e7eb;
        padding-top: 18px;
    }

    .cancel-button {
        display: inline-block;

        padding: 11px 20px;

        background: #dc2626;
        color: white;

        text-decoration: none;

        border-radius: 6px;

        font-weight: bold;
    }

    .cancel-button:hover {
        background: #b91c1c;
    }

    .cancelled-message {
        color: #dc2626;
        font-weight: bold;
    }

    .empty-box {
        background: white;
        padding: 50px 30px;

        text-align: center;

        border-radius: 12px;

        box-shadow:
            0 5px 18px rgba(0, 0, 0, 0.08);
    }

    .empty-box .icon {
        font-size: 60px;
        margin-bottom: 15px;
    }

    .empty-box h2 {
        font-size: 26px;
        margin-bottom: 10px;
        color: #111827;
    }

    .empty-box p {
        color: #666;
        margin-bottom: 25px;
    }

    .packages-button {
        display: inline-block;

        padding: 12px 25px;

        background: #2563eb;
        color: white;

        text-decoration: none;

        border-radius: 6px;

        font-weight: bold;
    }

    .packages-button:hover {
        background: #1d4ed8;
    }

    footer {
        background: #1f2937;
        color: white;
        text-align: center;
        padding: 20px;
        margin-top: 60px;
    }

    @media (max-width: 700px) {

        .navbar {
            flex-direction: column;
            gap: 15px;
        }

        .nav-links {
            gap: 15px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .page-header h1 {
            font-size: 30px;
        }

        .booking-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 8px;
        }

        .booking-card {
            padding: 22px;
        }

    }

</style>

</head>

<body>

<div class="navbar">

    <div class="logo">
        ✈️ Tour & Travel
    </div>

    <div class="nav-links">

        <a href="<%= request.getContextPath() %>/home.jsp">
            Home
        </a>

        <a href="<%= request.getContextPath() %>/packages">
            Packages
        </a>

        <a href="<%= request.getContextPath() %>/my-bookings">
            My Bookings
        </a>

        <a href="<%= request.getContextPath() %>/logout">
            Logout
        </a>

    </div>

</div>

<div class="container">

    <div class="page-header">

        <h1>
            My Bookings 📋
        </h1>

        <p>
            View and manage all your tour bookings.
        </p>

    </div>

    <%
        if (bookings != null && !bookings.isEmpty()) {

            for (Booking booking : bookings) {
    %>

    <div class="booking-card">

        <div class="booking-header">

            <h2>
                Tour Booking
            </h2>

            <span class="booking-id">
                Booking ID: #<%= booking.getBookingId() %>
            </span>

        </div>

        <div class="booking-details">

            <div class="detail-box">

                <span class="label">
                    Package ID
                </span>

                <span class="value">
                    🌍 <%= booking.getPackageId() %>
                </span>

            </div>

            <div class="detail-box">

                <span class="label">
                    Booking Date
                </span>

                <span class="value">
                    📅 <%= booking.getBookingDate() %>
                </span>

            </div>

            <div class="detail-box">

                <span class="label">
                    Number of People
                </span>

                <span class="value">
                    👥 <%= booking.getNumberOfPeople() %>
                </span>

            </div>

            <div class="detail-box">

                <span class="label">
                    Total Amount
                </span>

                <span class="value amount">
                    ₹<%= String.format("%.2f",
                        booking.getTotalAmount()) %>
                </span>

            </div>

            <div class="detail-box">

                <span class="label">
                    Booking Status
                </span>

                <span class="value">

                    <%
                        if ("Confirmed".equalsIgnoreCase(
                                booking.getStatus())) {
                    %>

                        <span class="status-confirmed">
                            ✅ <%= booking.getStatus() %>
                        </span>

                    <%
                        } else {
                    %>

                        <span class="status-cancelled">
                            ❌ <%= booking.getStatus() %>
                        </span>

                    <%
                        }
                    %>

                </span>

            </div>

        </div>

        <div class="actions">

            <%
                if (!"Cancelled".equalsIgnoreCase(
                        booking.getStatus())) {
            %>

                <a
                    href="<%= request.getContextPath() %>/cancel-booking?bookingId=<%= booking.getBookingId() %>"
                    class="cancel-button"
                    onclick="return confirm('Are you sure you want to cancel this booking?');">
                    Cancel Booking
                </a>

            <%
                } else {
            %>

                <span class="cancelled-message">
                    This booking has already been cancelled.
                </span>

            <%
                }
            %>

        </div>

    </div>

    <%
            }

        } else {
    %>

    <div class="empty-box">

        <div class="icon">
            📭
        </div>

        <h2>
            No Bookings Found
        </h2>

        <p>
            You have not booked any tour package yet.
        </p>

        <a
            href="<%= request.getContextPath() %>/packages"
            class="packages-button">
            Explore Tour Packages 🌍
        </a>

    </div>

    <%
        }
    %>

</div>

<footer>

    <p>
        © 2026 Tour & Travel Booking Management System
    </p>

</footer>

</body>

</html>