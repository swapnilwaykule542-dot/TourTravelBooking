<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Add Package - Admin</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f2f2f2;
        }

        .navbar {
            background: #333;
            padding: 15px;
            color: white;
        }

        .navbar h2 {
            display: inline;
        }

        .navbar a {
            float: right;
            color: white;
            text-decoration: none;
            margin-left: 20px;
        }

        .container {
            width: 500px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input,
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            box-sizing: border-box;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        .button {
            width: 100%;
            padding: 12px;
            background: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .button:hover {
            background: #555;
        }

        .back {
            text-align: center;
            margin-top: 20px;
        }

        .back a {
            color: #333;
            text-decoration: none;
        }

    </style>

</head>

<body>

    <div class="navbar">

        <h2>Admin Panel</h2>

        <a href="<%= request.getContextPath() %>/admin-dashboard.jsp">
            Dashboard
        </a>

    </div>

    <div class="container">

        <h1>Add New Tour Package 🌍</h1>

        <form action="<%= request.getContextPath() %>/add-package"
              method="post">

            <label for="packageName">
                Package Name
            </label>

            <input type="text"
                   id="packageName"
                   name="packageName"
                   required>

            <label for="destination">
                Destination
            </label>

            <input type="text"
                   id="destination"
                   name="destination"
                   required>

            <label for="description">
                Description
            </label>

            <textarea id="description"
                      name="description"
                      required></textarea>

            <label for="duration">
                Duration
            </label>

            <input type="text"
                   id="duration"
                   name="duration"
                   placeholder="Example: 3 Days / 2 Nights"
                   required>

            <label for="price">
                Price
            </label>

            <input type="number"
                   id="price"
                   name="price"
                   step="0.01"
                   min="0"
                   required>

            <label for="availableSeats">
                Available Seats
            </label>

            <input type="number"
                   id="availableSeats"
                   name="availableSeats"
                   min="0"
                   required>

            <label for="image">
                Image File Name
            </label>

            <input type="text"
                   id="image"
                   name="image"
                   placeholder="Example: goa.jpg">

            <button type="submit"
                    class="button">
                Add Package
            </button>

        </form>

        <div class="back">

            <a href="<%= request.getContextPath() %>/admin-packages">
                Back to Manage Packages
            </a>

        </div>

    </div>

</body>

</html>