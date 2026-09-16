<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tourtravel.model.TourPackage" %>

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

    <title>Manage Packages - Admin</title>

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
        }

        .top-bar {
            text-align: right;
            margin-bottom: 20px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background: #333;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .button:hover {
            background: #555;
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

        .edit-button {
            background: #1976d2;
            color: white;
            padding: 7px 12px;
            text-decoration: none;
            border-radius: 4px;
        }

        .delete-button {
            background: #c62828;
            color: white;
            padding: 7px 12px;
            text-decoration: none;
            border-radius: 4px;
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

        <h1>Manage Tour Packages 🌍</h1>

        <div class="top-bar">

            <a href="<%= request.getContextPath() %>/add-package.jsp"
               class="button">
                + Add New Package
            </a>

        </div>

        <%
            List<TourPackage> packages =
                (List<TourPackage>) request.getAttribute("packages");

            if (packages != null && !packages.isEmpty()) {
        %>

        <table>

            <tr>

                <th>ID</th>
                <th>Package Name</th>
                <th>Destination</th>
                <th>Duration</th>
                <th>Price</th>
                <th>Available Seats</th>
                <th>Actions</th>

            </tr>

            <%
                for (TourPackage tourPackage : packages) {
            %>

            <tr>

                <td>
                    <%= tourPackage.getPackageId() %>
                </td>

                <td>
                    <%= tourPackage.getPackageName() %>
                </td>

                <td>
                    <%= tourPackage.getDestination() %>
                </td>

                <td>
                    <%= tourPackage.getDuration() %>
                </td>

                <td>
                    ₹<%= tourPackage.getPrice() %>
                </td>

                <td>
                    <%= tourPackage.getAvailableSeats() %>
                </td>

                <td>

                   <a href="<%= request.getContextPath() %>/edit-package?id=<%= tourPackage.getPackageId() %>"
   class="edit-button">
    Edit
 </a>

                   <a href="<%= request.getContextPath() %>/delete-package?id=<%= tourPackage.getPackageId() %>"
   class="delete-button"
   onclick="return confirm('Are you sure you want to delete this package?');">
    Delete
</a>

                </td>

            </tr>

            <%
                }
            %>

        </table>

        <%
            } else {
        %>

        <p style="text-align:center;">
            No tour packages found.
        </p>

        <%
            }
        %>

    </div>

</body>

</html> 