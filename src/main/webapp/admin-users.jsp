<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    List<String[]> users =
        (List<String[]>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Registered Users - Admin</title>

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

        .no-users {
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

        <h1>Registered Users 👥</h1>

        <%
            if (users != null && !users.isEmpty()) {
        %>

        <div class="table-container">

            <table>

                <tr>

                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Registration Date</th>

                </tr>

                <%
                    for (String[] user : users) {
                %>

                <tr>

                    <td>
                        <%= user[0] %>
                    </td>

                    <td>
                        <%= user[1] %>
                    </td>

                    <td>
                        <%= user[2] %>
                    </td>

                    <td>
                        <%= user[3] %>
                    </td>

                    <td>
                        <%= user[4] %>
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

        <div class="no-users">

            <h2>No Registered Users Found</h2>

            <p>
                There are currently no registered users.
            </p>

        </div>

        <%
            }
        %>

    </div>

</body>

</html>