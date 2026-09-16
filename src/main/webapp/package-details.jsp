<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
if (session.getAttribute("userId") == null) {
response.sendRedirect("login.jsp");
return;
}

String packageName = (String) request.getAttribute("packageName");
String destination = (String) request.getAttribute("destination");
String description = (String) request.getAttribute("description");
String duration = (String) request.getAttribute("duration");
String image = (String) request.getAttribute("image");

double price = Double.parseDouble(
    request.getAttribute("price").toString()
);

int availableSeats = Integer.parseInt(
    request.getAttribute("availableSeats").toString()
);

int packageId = Integer.parseInt(
    request.getAttribute("packageId").toString()
);

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title><%= packageName %> - Tour & Travel Booking</title>

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

    .back-link {
        display: inline-block;
        margin-bottom: 25px;

        color: #2563eb;
        text-decoration: none;
        font-weight: bold;
    }

    .back-link:hover {
        text-decoration: underline;
    }

    .details-card {
        background: white;
        border-radius: 14px;
        overflow: hidden;

        box-shadow:
            0 5px 20px rgba(0, 0, 0, 0.08);

        display: grid;
        grid-template-columns: 1fr 1fr;
    }

    .package-image {
        min-height: 500px;

        display: flex;
        justify-content: center;
        align-items: center;

        background: #e5e7eb;

        font-size: 80px;
    }

    .package-img {
        width: 100%;
        height: 100%;
        min-height: 500px;
        object-fit: cover;
        display: block;
    }

    .details-content {
        padding: 45px;
    }

    .details-content h1 {
        font-size: 36px;
        margin-bottom: 12px;
        color: #111827;
    }

    .destination {
        color: #2563eb;
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 25px;
    }

    .description {
        color: #666;
        line-height: 1.7;
        font-size: 16px;
        margin-bottom: 25px;
    }

    .info-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 15px;
        margin-bottom: 25px;
    }

    .info-box {
        background: #f3f4f6;
        padding: 16px;
        border-radius: 8px;
        text-align: center;
    }

    .info-box .label {
        display: block;
        color: #777;
        font-size: 13px;
        margin-bottom: 5px;
    }

    .info-box .value {
        display: block;
        font-size: 17px;
        font-weight: bold;
        color: #111827;
    }

    .price {
        font-size: 30px;
        font-weight: bold;
        color: #2563eb;
        margin-bottom: 30px;
    }

    .price span {
        font-size: 14px;
        color: #777;
        font-weight: normal;
    }

    .booking-section {
        border-top: 1px solid #e5e7eb;
        padding-top: 25px;
    }

    .booking-section h2 {
        font-size: 22px;
        margin-bottom: 18px;
    }

    .booking-section label {
        display: block;
        font-weight: bold;
        margin-bottom: 8px;
    }

    .booking-section input {
        width: 100%;
        padding: 13px;

        border: 1px solid #d1d5db;
        border-radius: 6px;

        font-size: 16px;
        margin-bottom: 15px;
    }

    .booking-section input:focus {
        outline: none;
        border-color: #2563eb;
    }

    .book-button {
        width: 100%;
        padding: 14px;

        background: #2563eb;
        color: white;

        border: none;
        border-radius: 7px;

        font-size: 17px;
        font-weight: bold;

        cursor: pointer;
    }

    .book-button:hover {
        background: #1d4ed8;
    }

    .no-seats {
        background: #fee2e2;
        color: #b91c1c;

        padding: 15px;
        border-radius: 7px;

        text-align: center;
        font-weight: bold;
    }

    footer {
        background: #1f2937;
        color: white;
        text-align: center;
        padding: 20px;
        margin-top: 60px;
    }

    @media (max-width: 800px) {

        .navbar {
            flex-direction: column;
            gap: 15px;
        }

        .nav-links {
            gap: 15px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .details-card {
            grid-template-columns: 1fr;
        }

        .package-image {
            min-height: 300px;
        }

        .package-img {
            min-height: 300px;
        }

        .details-content {
            padding: 30px 25px;
        }

        .details-content h1 {
            font-size: 30px;
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

    <a href="<%= request.getContextPath() %>/packages"
       class="back-link">
        ← Back to Tour Packages
    </a>

    <div class="details-card">

        <div class="package-image">

            <%
                if (image != null && !image.trim().isEmpty()) {
            %>

                <img
                    src="<%= request.getContextPath() %>/images/<%= image %>"
                    alt="<%= packageName %>"
                    class="package-img">

            <%
                } else {
            %>

                🌍

            <%
                }
            %>

        </div>

        <div class="details-content">

            <h1>
                <%= packageName %>
            </h1>

            <div class="destination">
                📍 <%= destination %>
            </div>

            <p class="description">
                <%= description %>
            </p>

            <div class="info-grid">

                <div class="info-box">

                    <span class="label">
                        Duration
                    </span>

                    <span class="value">
                        🕐 <%= duration %>
                    </span>

                </div>

                <div class="info-box">

                    <span class="label">
                        Available Seats
                    </span>

                    <span class="value">
                        💺 <%= availableSeats %>
                    </span>

                </div>

            </div>

            <div class="price">

                ₹<%= String.format("%.2f", price) %>

                <span>
                    / person
                </span>

            </div>

            <div class="booking-section">

                <h2>
                    Book This Tour 🎫
                </h2>

                <%
                    if (availableSeats > 0) {
                %>

                <form
                    action="<%= request.getContextPath() %>/book"
                    method="post">

                    <input
                        type="hidden"
                        name="packageId"
                        value="<%= packageId %>">

                    <input
                        type="hidden"
                        name="price"
                        value="<%= price %>">

                    <label for="numberOfPeople">
                        Number of People
                    </label>

                    <input
                        type="number"
                        id="numberOfPeople"
                        name="numberOfPeople"
                        min="1"
                        max="<%= availableSeats %>"
                        placeholder="Enter number of people"
                        required>

                    <button
                        type="submit"
                        class="book-button">
                        Book Now ✈️
                    </button>

                </form>

                <%
                    } else {
                %>

                <div class="no-seats">
                    Sorry, no seats are currently available.
                </div>

                <%
                    }
                %>

            </div>

        </div>

    </div>

</div>

<footer>

    <p>
        © 2026 Tour & Travel Booking Management System
    </p>

</footer>

</body>

</html>