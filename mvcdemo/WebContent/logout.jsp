<html>
<head>
    <title>logout Page</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<%
    session.removeAttribute("userid");
    session.removeAttribute("password");
    session.invalidate();
%>
<h1>You have successfully logged out</h1>
<a href="login.jsp">Click here</a> to login again.
</body>
</html>
