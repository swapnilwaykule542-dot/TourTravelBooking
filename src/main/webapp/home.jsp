<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String fullName = (String) session.getAttribute("fullName");

    if (fullName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Home - Tour & Travel Booking</title>

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

        .hero {
            min-height: 480px;
            background:
                linear-gradient(
                    rgba(0, 0, 0, 0.55),
                    rgba(0, 0, 0, 0.55)
                ),
                url("https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1600&q=80");

            background-size: cover;
            background-position: center;

            display: flex;
            justify-content: center;
            align-items: center;

            text-align: center;
            color: white;
            padding: 30px;
        }

        .hero-content {
            max-width: 800px;
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 20px;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .button {
            display: inline-block;
            padding: 14px 28px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            margin: 5px;
            font-size: 16px;
            font-weight: bold;
        }

        .button:hover {
            background: #1d4ed8;
        }

        .button.secondary {
            background: white;
            color: #2563eb;
        }

        .button.secondary:hover {
            background: #e5e7eb;
        }

        .welcome {
            text-align: center;
            padding: 45px 20px 20px;
        }

        .welcome h2 {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .welcome p {
            color: #666;
            font-size: 17px;
        }

        .features {
            width: 90%;
            max-width: 1100px;
            margin: 30px auto 60px;

            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(220px, 1fr));

            gap: 25px;
        }

        .feature-card {
            background: white;
            padding: 30px 20px;
            text-align: center;
            border-radius: 12px;

            box-shadow:
                0 4px 15px rgba(0, 0, 0, 0.08);

            transition: transform 0.2s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            font-size: 42px;
            margin-bottom: 15px;
        }

        .feature-card h3 {
            margin-bottom: 10px;
            font-size: 20px;
        }

        .feature-card p {
            color: #666;
            line-height: 1.5;
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

            .hero h1 {
                font-size: 34px;
            }

            .hero p {
                font-size: 17px;
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

    <section class="hero">

        <div class="hero-content">

            <h1>
                Explore The World 🌍
            </h1>

            <p>
                Discover amazing destinations,
                choose your perfect tour package,
                and book your next adventure with ease.
            </p>

            <a href="<%= request.getContextPath() %>/packages"
               class="button">
                Explore Packages
            </a>

            <a href="<%= request.getContextPath() %>/my-bookings"
               class="button secondary">
                My Bookings
            </a>

        </div>

    </section>

    <section class="welcome">

        <h2>
            Welcome, <%= fullName %>! 🎉
        </h2>

        <p>
            Your journey begins here.
            Plan your next unforgettable trip today.
        </p>

    </section>

    <section class="features">

        <div class="feature-card">

            <div class="feature-icon">
                🌍
            </div>

            <h3>
                Amazing Destinations
            </h3>

            <p>
                Explore beautiful and exciting
                destinations across India.
            </p>

        </div>

        <div class="feature-card">

            <div class="feature-icon">
                💰
            </div>

            <h3>
                Affordable Packages
            </h3>

            <p>
                Choose tour packages designed
                for different budgets.
            </p>

        </div>

        <div class="feature-card">

            <div class="feature-icon">
                📅
            </div>

            <h3>
                Easy Booking
            </h3>

            <p>
                Book your favourite tour package
                quickly and easily.
            </p>

        </div>

        <div class="feature-card">

            <div class="feature-icon">
                🔒
            </div>

            <h3>
                Secure Account
            </h3>

            <p>
                Manage your bookings and account
                information from one place.
            </p>

        </div>

    </section>

    <footer>

        <p>
            © 2026 Tour & Travel Booking Management System
        </p>

    </footer>

</body>

</html>