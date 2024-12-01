<%@page import="java.util.List"%>
<%@page import="com.appsquadz.service.LoginService"%>
<%@page import="java.util.Date" %>
<%@page import="com.appsquadz.model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <title>Result Page</title>
</head>
<body>
    <div id="container">
        <h1>Result Page</h1>
        <strong>This is a Sample Result Page</strong><br/>
        <%= new Date() %><br/>

        <%
            // Check if the user is logged in (session not null)
            User user = (User) session.getAttribute("user"); 
            if (user != null) {
        %>
            <strong>Welcome <%= user.getFirstName() + " " + user.getLastName() %></strong><br/>
            <a href="logout.jsp">Logout</a><br/>
            
            <table>
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>First Name</th>
                        <th>Middle Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            // Fetch the list of users using the LoginService
                            LoginService loginService = new LoginService();
                            List<User> list = loginService.getListOfUsers();
                            for (User u : list) {
                    %>
                    <tr>
                        <td><%= u.getUserId() %></td>
                        <td><%= u.getFirstName() %></td>
                        <td><%= u.getMiddleName() %></td>
                        <td><%= u.getLastName() %></td>
                        <td><%= u.getEmail() %></td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='5'>Error fetching user data.</td></tr>");
                            e.printStackTrace(); // Optional: log the error
                        }
                    %>
                </tbody>
            </table>
            <br/>
        <%
            } else {
        %>
            <strong>User session not found. Please log in.</strong><br/>
            <a href="login.jsp">Login</a>
        <%
            }
        %>
    </div>
</body>
</html>
