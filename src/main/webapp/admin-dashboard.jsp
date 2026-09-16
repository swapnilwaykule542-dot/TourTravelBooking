<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String adminUsername =
(String) session.getAttribute("adminUsername");

if (adminUsername == null) {
    response.sendRedirect("admin-login.jsp");
    return;
}

Integer totalPackages =
    (Integer) request.getAttribute("totalPackages");

Integer totalBookings =
    (Integer) request.getAttribute("totalBookings");

Integer totalUsers =
    (Integer) request.getAttribute("totalUsers");

Integer confirmedBookings =
    (Integer) request.getAttribute("confirmedBookings");

Integer cancelledBookings =
    (Integer) request.getAttribute("cancelledBookings");

if (totalPackages == null) totalPackages = 0;
if (totalBookings == null) totalBookings = 0;
if (totalUsers == null) totalUsers = 0;
if (confirmedBookings == null) confirmedBookings = 0;
if (cancelledBookings == null) cancelledBookings = 0;

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Admin Dashboard - Tour & Travel Booking</title>

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
        max-width: 1200px;
        margin: 45px auto;
    }

    .header {
        text-align: center;
        margin-bottom: 30px;
    }

    .header h1 {
        font-size: 36px;
        color: #111827;
        margin-bottom: 10px;
    }

    .header p {
        color: #666;
        font-size: 17px;
    }

    .welcome {
        background: white;

        padding: 20px;

        border-radius: 10px;

        margin-bottom: 30px;

        box-shadow:
            0 4px 15px rgba(0, 0, 0, 0.07);

        text-align: center;
    }

    .welcome strong {
        color: #2563eb;
    }

    .stats {
        display: grid;

        grid-template-columns:
            repeat(auto-fit, minmax(190px, 1fr));

        gap: 20px;

        margin-bottom: 40px;
    }

    .stat-card {
        background: white;

        padding: 25px 20px;

        border-radius: 12px;

        text-align: center;

        box-shadow:
            0 5px 18px rgba(0, 0, 0, 0.08);
    }

    .stat-icon {
        font-size: 38px;
        margin-bottom: 10px;
    }

    .stat-number {
        font-size: 32px;
        font-weight: bold;
        color: #2563eb;

        margin-bottom: 8px;
    }

    .stat-title {
        color: #666;
        font-size: 15px;
    }

    .section-title {
        text-align: center;
        margin-bottom: 25px;
    }

    .section-title h2 {
        font-size: 28px;
        color: #111827;
    }

    .cards {
        display: grid;

        grid-template-columns:
            repeat(auto-fit, minmax(250px, 1fr));

        gap: 25px;

        margin-bottom: 40px;
    }

    .card {
        background: white;

        padding: 30px 25px;

        border-radius: 12px;

        text-align: center;

        box-shadow:
            0 5px 18px rgba(0, 0, 0, 0.08);

        transition: transform 0.2s;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .card-icon {
        font-size: 45px;
        margin-bottom: 15px;
    }

    .card h2 {
        font-size: 22px;

        margin-bottom: 10px;

        color: #111827;
    }

    .card p {
        color: #666;

        line-height: 1.5;

        margin-bottom: 20px;
    }

    .button {
        display: inline-block;

        padding: 12px 22px;

        background: #2563eb;

        color: white;

        text-decoration: none;

        border-radius: 6px;

        font-weight: bold;
    }

    .button:hover {
        background: #1d4ed8;
    }

    .quick-actions {
        display: grid;

        grid-template-columns:
            repeat(auto-fit, minmax(220px, 1fr));

        gap: 20px;
    }

    .action {
        background: white;

        padding: 25px;

        border-radius: 10px;

        text-align: center;

        box-shadow:
            0 4px 15px rgba(0, 0, 0, 0.07);
    }

    .action h3 {
        margin-bottom: 10px;
    }

    .action p {
        color: #666;

        margin-bottom: 15px;
    }

    .action-button {
        display: inline-block;

        padding: 10px 18px;

        background: #374151;

        color: white;

        text-decoration: none;

        border-radius: 6px;

        font-size: 14px;

        font-weight: bold;
    }

    .action-button:hover {
        background: #111827;
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

        .header h1 {
            font-size: 30px;
        }

    }

</style>

</head>

<body>

<div class="navbar">

    <div class="logo">
        ✈️ Tour & Travel Admin
    </div>

    <div class="nav-links">

        <a href="<%= request.getContextPath() %>/admin-stats">
            Dashboard
        </a>

        <a href="<%= request.getContextPath() %>/admin-packages">
            Packages
        </a>

        <a href="<%= request.getContextPath() %>/admin-bookings">
            Bookings
        </a>

        <a href="<%= request.getContextPath() %>/admin-users">
            Users
        </a>

        <a href="<%= request.getContextPath() %>/admin-logout">
            Logout
        </a>

    </div>

</div>


<div class="container">

    <div class="header">

        <h1>
            Admin Dashboard 📊
        </h1>

        <p>
            Manage your Tour & Travel Booking System
        </p>

    </div>


    <div class="welcome">

        Welcome,
        <strong>
            <%= adminUsername %>
        </strong>
        👋

    </div>


    <div class="stats">

        <div class="stat-card">

            <div class="stat-icon">
                🌍
            </div>

            <div class="stat-number">
                <%= totalPackages %>
            </div>

            <div class="stat-title">
                Total Tour Packages
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                📋
            </div>

            <div class="stat-number">
                <%= totalBookings %>
            </div>

            <div class="stat-title">
                Total Bookings
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                👥
            </div>

            <div class="stat-number">
                <%= totalUsers %>
            </div>

            <div class="stat-title">
                Registered Users
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                ✅
            </div>

            <div class="stat-number">
                <%= confirmedBookings %>
            </div>

            <div class="stat-title">
                Confirmed Bookings
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                ❌
            </div>

            <div class="stat-number">
                <%= cancelledBookings %>
            </div>

            <div class="stat-title">
                Cancelled Bookings
            </div>

        </div>

    </div>


    <div class="section-title">

        <h2>
            Management 📌
        </h2>

    </div>


    <div class="cards">


        <div class="card">

            <div class="card-icon">
                🌍
            </div>

            <h2>
                Tour Packages
            </h2>

            <p>
                Add, edit and delete tour packages.
            </p>

            <a
                href="<%= request.getContextPath() %>/admin-packages"
                class="button">
                Manage Packages
            </a>

        </div>


        <div class="card">

            <div class="card-icon">
                📋
            </div>

            <h2>
                Customer Bookings
            </h2>

            <p>
                View all customer tour bookings.
            </p>

            <a
                href="<%= request.getContextPath() %>/admin-bookings"
                class="button">
                View Bookings
            </a>

        </div>


        <div class="card">

            <div class="card-icon">
                👥
            </div>

            <h2>
                Registered Users
            </h2>

            <p>
                View registered customer information.
            </p>

            <a
                href="<%= request.getContextPath() %>/admin-users"
                class="button">
                View Users
            </a>

        </div>

    </div>


    <div class="section-title">

        <h2>
            Quick Actions ⚡
        </h2>

    </div>


    <div class="quick-actions">


        <div class="action">

            <h3>
                ➕ Add Package
            </h3>

            <p>
                Create a new tour package.
            </p>

            <a
                href="<%= request.getContextPath() %>/add-package.jsp"
                class="action-button">
                Add Package
            </a>

        </div>


        <div class="action">

            <h3>
                📋 Manage Bookings
            </h3>

            <p>
                Check customer booking records.
            </p>

            <a
                href="<%= request.getContextPath() %>/admin-bookings"
                class="action-button">
                View Bookings
            </a>

        </div>


        <div class="action">

            <h3>
                👤 Manage Users
            </h3>

            <p>
                Check registered users.
            </p>

            <a
                href="<%= request.getContextPath() %>/admin-users"
                class="action-button">
                View Users
            </a>

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