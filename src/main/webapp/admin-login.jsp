
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Login - Tour Travel Booking</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f2f2f2;
        }

        .container {
            width: 400px;
            margin: 100px auto;
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

        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            box-sizing: border-box;
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

        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
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

    <div class="container">

        <h1>Admin Login 🔐</h1>

        <%
            String error = request.getParameter("error");

            if ("invalid".equals(error)) {
        %>

            <p class="error">
                Invalid username or password.
            </p>

        <%
            } else if ("failed".equals(error)) {
        %>

            <p class="error">
                Login failed. Please try again.
            </p>

        <%
            }
        %>

        <form action="<%= request.getContextPath() %>/admin-login"
              method="post">

            <label for="username">
                Username
            </label>

            <input type="text"
                   id="username"
                   name="username"
                   required>

            <label for="password">
                Password
            </label>

            <input type="password"
                   id="password"
                   name="password"
                   required>

            <button type="submit" class="button">
                Login
            </button>

        </form>

        <div class="back">

            <a href="<%= request.getContextPath() %>/login.jsp">
                Back to User Login
            </a>

        </div>

    </div>

</body>

</html>

