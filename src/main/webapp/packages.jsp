<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tourtravel.model.TourPackage" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<TourPackage> packages =
        (List<TourPackage>) request.getAttribute("packages");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Tour Packages - Tour & Travel Booking</title>

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

        .page-header {
            text-align: center;
            padding: 50px 20px 30px;
        }

        .page-header h1 {
            font-size: 38px;
            margin-bottom: 12px;
        }

        .page-header p {
            color: #666;
            font-size: 17px;
        }

        .packages {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto 60px;

            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(280px, 1fr));

            gap: 25px;
        }

        .card {
            background: white;
            border-radius: 14px;
            overflow: hidden;

            box-shadow:
                0 5px 18px rgba(0, 0, 0, 0.08);

            transition: transform 0.2s,
                        box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-6px);

            box-shadow:
                0 10px 25px rgba(0, 0, 0, 0.14);
        }

        .card-image {
            width: 100%;
            height: 190px;
            object-fit: cover;
            display: block;
        }

        .image-placeholder {
            width: 100%;
            height: 190px;

            display: flex;
            justify-content: center;
            align-items: center;

            background: #e5e7eb;
            font-size: 60px;
        }

        .card-content {
            padding: 22px;
        }

        .card h2 {
            font-size: 22px;
            margin-bottom: 12px;
        }

        .destination {
            color: #2563eb;
            font-weight: bold;
            margin-bottom: 12px;
        }

        .description {
            color: #666;
            line-height: 1.5;
            min-height: 48px;
            margin-bottom: 15px;
        }

        .info {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            margin-bottom: 15px;
        }

        .info-box {
            background: #f3f4f6;
            padding: 9px;
            border-radius: 6px;
            font-size: 14px;
            flex: 1;
            text-align: center;
        }

        .price {
            font-size: 24px;
            font-weight: bold;
            color: #111827;
            margin-bottom: 15px;
        }

        .price span {
            font-size: 13px;
            color: #777;
            font-weight: normal;
        }

        .button {
            display: block;
            width: 100%;
            padding: 12px;

            background: #2563eb;
            color: white;

            text-decoration: none;
            text-align: center;

            border-radius: 6px;
            font-weight: bold;
        }

        .button:hover {
            background: #1d4ed8;
        }

        .no-packages {
            width: 90%;
            max-width: 600px;
            margin: 30px auto 60px;

            background: white;
            padding: 40px;
            text-align: center;

            border-radius: 12px;

            box-shadow:
                0 5px 18px rgba(0, 0, 0, 0.08);
        }

        footer {
            background: #1f2937;
            color: white;
            text-align: center;
            padding: 20px;
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

    <div class="page-header">

        <h1>
            Explore Our Tour Packages 🌍
        </h1>

        <p>
            Choose your destination and start your next adventure.
        </p>

    </div>

    <%
        if (packages != null && !packages.isEmpty()) {
    %>

    <div class="packages">

        <%
            for (TourPackage tourPackage : packages) {
        %>

        <div class="card">

            <%
                if (tourPackage.getImage() != null &&
                    !tourPackage.getImage().trim().isEmpty()) {
            %>

                <img
                    src="<%= request.getContextPath() %>/images/<%= tourPackage.getImage() %>"
                    alt="<%= tourPackage.getPackageName() %>"
                    class="card-image">

            <%
                } else {
            %>

                <div class="image-placeholder">
                    🌍
                </div>

            <%
                }
            %>

            <div class="card-content">

                <h2>
                    <%= tourPackage.getPackageName() %>
                </h2>

                <div class="destination">
                    📍 <%= tourPackage.getDestination() %>
                </div>

                <p class="description">
                    <%= tourPackage.getDescription() %>
                </p>

                <div class="info">

                    <div class="info-box">
                        🕐<br>
                        <%= tourPackage.getDuration() %>
                    </div>

                    <div class="info-box">
                        💺<br>
                        <%= tourPackage.getAvailableSeats() %> Seats
                    </div>

                </div>

                <div class="price">
                    ₹<%= String.format("%.2f", tourPackage.getPrice()) %>
                    <span> / person</span>
                </div>

                <a
                    href="<%= request.getContextPath() %>/package-details?id=<%= tourPackage.getPackageId() %>"
                    class="button">
                    View Details
                </a>

            </div>

        </div>

        <%
            }
        %>

    </div>

    <%
        } else {
    %>

    <div class="no-packages">

        <h2>
            No Tour Packages Available 😔
        </h2>

        <p>
            Please check again later.
        </p>

    </div>

    <%
        }
    %>

    <footer>

        <p>
            © 2026 Tour & Travel Booking Management System
        </p>

    </footer>

</body>

</html>