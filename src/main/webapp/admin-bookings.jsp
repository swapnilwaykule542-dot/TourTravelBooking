<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    List<String[]> bookings =
        (List<String[]>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>All Bookings - Admin</title>

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
            width: 95%;
            margin: 30px auto;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px #ccc;
        }

        th {
            background: #333;
            color: white;
            padding: 12px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        tr:hover {
            background: #f5f5f5;
        }

        .confirmed {
            color: green;
            font-weight: bold;
        }

        .cancelled {
            color: red;
            font-weight: bold;
        }

        .no-bookings {
            background: white;
            padding: 30px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

    </style>

</head>

<body>

    <div class="navbar">

        <h2>Admin Panel</h2>

        <a href="<%= request.getContextPath() %>/admin-logout">
            Logout
        </a>

        <a href="<%= request.getContextPath() %>/admin-dashboard.jsp">
            Dashboard
        </a>

    </div>

    <div class="container">

        <h1>All Customer Bookings 📋</h1>

        <%
            if (bookings != null && !bookings.isEmpty()) {
        %>

        <div class="table-container">

            <table>

                <tr>

                    <th>Booking ID</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                    <th>Package</th>
                    <th>Destination</th>
                    <th>Booking Date</th>
                    <th>People</th>
                    <th>Total Amount</th>
                    <th>Status</th>

                </tr>

                <%
                    for (String[] booking : bookings) {
                %>

                <tr>

                    <td>
                        <%= booking[0] %>
                    </td>

                    <td>
                        <%= booking[1] %>
                    </td>

                    <td>
                        <%= booking[2] %>
                    </td>

                    <td>
                        <%= booking[3] %>
                    </td>

                    <td>
                        <%= booking[4] %>
                    </td>

                    <td>
                        <%= booking[5] %>
                    </td>

                    <td>
                        <%= booking[6] %>
                    </td>

                    <td>
                        ₹<%= booking[7] %>
                    </td>

                    <td>

                        <%
                            if ("Confirmed".equalsIgnoreCase(booking[8])) {
                        %>

                            <span class="confirmed">
                                <%= booking[8] %>
                            </span>

                        <%
                            } else {
                        %>

                            <span class="cancelled">
                                <%= booking[8] %>
                            </span>

                        <%
                            }
                        %>

                    </td>

                </tr>

                <%
                    }
                %>

            </table>

        </div>

        <%
            } else {
        %>

        <div class="no-bookings">

            <h2>No Bookings Found</h2>

            <p>
                There are currently no customer bookings.
            </p>

        </div>

        <%
            }
        %>

    </div>

</body>

</html>