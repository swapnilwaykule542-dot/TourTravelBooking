<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Tour Travel Booking</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
        }

        .container {
            width: 400px;
            margin: 60px auto;
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
    </style>
</head>

<body>

<div class="container">

    <h2>Create Account</h2>

    <form action="register" method="post">

        <input type="text"
               name="fullName"
               placeholder="Full Name"
               required>

        <input type="email"
               name="email"
               placeholder="Email"
               required>

        <input type="password"
               name="password"
               placeholder="Password"
               required>

        <input type="text"
               name="phone"
               placeholder="Phone Number"
               required>

        <button type="submit">Register</button>

    </form>

</div>

</body>
</html>