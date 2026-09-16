<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Booking Successful - Tour Travel Booking</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            margin: 0;
        }

        .container {
            width: 450px;
            margin: 100px auto;
            padding: 35px;
            background: white;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h1 {
            color: green;
        }

        p {
            font-size: 18px;
        }

        .button {
            display: inline-block;
            padding: 12px 25px;
            margin: 10px;
            background: #333;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .button:hover {
            background: #555;
        }

    </style>

</head>

<body>

    <div class="container">

        <h1>Booking Successful! 🎉</h1>

        <p>Your tour has been booked successfully.</p>

        <p>Thank you for booking with us! ✈️🌍</p>

        <a href="<%= request.getContextPath() %>/packages"
           class="button">
            View More Packages
        </a>

        <a href="<%= request.getContextPath() %>/home.jsp"
           class="button">
            Go to Home
        </a>

    </div>

</body>

</html>