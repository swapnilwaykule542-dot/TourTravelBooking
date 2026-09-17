<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign In - Tour Travel Booking</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
        }

        .container {
            width: 400px;
            margin: 80px auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background: #333;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background: #555;
        }

        .error {
            color: red;
            text-align: center;
        }

        .success {
            color: green;
            text-align: center;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
        }

        .register-link a {
            color: #333;
            font-weight: bold;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Sign In</h2>

    <%
        String error = request.getParameter("error");
        String registered = request.getParameter("registered");

        if ("success".equals(registered)) {
    %>

        <p class="success">
            Account created successfully! Please sign in.
        </p>

    <%
        } else if ("invalid".equals(error)) {
    %>

        <p class="error">
            Invalid email or password!
        </p>

    <%
        } else if ("failed".equals(error)) {
    %>

        <p class="error">
            Something went wrong. Please try again.
        </p>

    <%
        }
    %>

    <form action="login" method="post">

        <input type="email"
               name="email"
               placeholder="Email"
               required>

        <input type="password"
               name="password"
               placeholder="Password"
               required>

        <button type="submit">
            Sign In
        </button>

    </form>

    <div class="register-link">
        Don't have an account?
        <a href="register.jsp">Create Account</a>
    </div>

</div>

</body>
</html>